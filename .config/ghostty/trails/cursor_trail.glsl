/*─────────────────────────────────────────────────────────────────────────
 * cursor_smear_dynamic.glsl  —  Ghostty custom-shader drop-in (rev 3)
 * • trail now aligned to cursor row
 * • colour chosen from the most **vivid corner** (<-- THIS IS THE 'ISSUE' WITH COLOR SAMPLING!!! Pretty interesting function though)
 * of **each** cursor rect (<-- COULD THIS BE CAUSING THE PHANTOM THIRD CURSOR LOCATION (see video embedded in README) ???)
 *
 * MODIFIED: Dynamic color sampling replaced by Catppuccin Mocha Lavender.
 * Gradient structure is maintained, but endpoints are the same color.
 *────────────────────────────────────────────────────────────────────────*/

/* ───── Tunables (constants only) ─────────────────────────────────────── */
const float DURATION = 0.30;     /* tween time (s)                        */
const float TRAIL_OPACITY = 1.00;  /* global α of trail                   */
const float CURVE_STRENGTH = 0.00; /* −: concave  +: convex               */
const float EDGE_SOFT = 0.001;     /* AA width in NDC units               */
const float GLOW_RADIUS = 0.002;   /* halo thickness (NDC)                */
const float GLOW_INTENSITY = 0.90; /* halo α multiplier                   */
const float CURSOR_HIDE_AT = 1.00; /* hide stand-in when prog ≥ …         */

// ADDED: Catppuccin Mocha Lavender color (Hex: #B7BDF8)
const vec3 CATPPUCCIN_LAVENDER = vec3(0.7176, 0.7412, 0.9725);
/* ─────────────────────────────────────────────────────────────────────── */

/* pixel → NDC (−1‥+1 across short axis, keeps aspect) */
vec2 ndc(vec2 px, float isPos) {
    return (px * 2.0 - iResolution.xy * isPos) / iResolution.y;
}

/* fast coverage for AA */
float cover(float sd) {
    return clamp(0.5 - sd / EDGE_SOFT, 0.0, 1.0);
}

/* cubic ease-out */
float ease(float t) {
    return 1.0 - pow(1.0 - t, 3.0);
}

/* SDF of axis-aligned box centred at `c`, half-size `b` (both NDC) */
float sdBox(vec2 p, vec2 c, vec2 b) {
    vec2 d = abs(p - c) - b;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

/* signed distance to parallelogram (v0→v1→v2→v3, NDC) */
float sdPara(vec2 p, vec2 v0, vec2 v1, vec2 v2, vec2 v3) {
    float w = 1.0;
    float d2 = dot(p - v0, p - v0);
    #define EDGE(A,B)                                                      \
                    {                                                      \
                        vec2 e = B - A, wv = p - A;                        \
                        vec2 proj = A + e * clamp(dot(wv, e) / dot(e, e), 0.0, 1.0); \
                        d2 = min(d2, dot(p - proj, p - proj));             \
                        float c0 = step(0.0, p.y - A.y);                   \
                        float c1 = 1.0 - step(0.0, p.y - B.y);             \
                        float c2 = 1.0 - step(0.0, e.x * wv.y - e.y * wv.x); \
                        float flip = mix(1.0, -1.0, step(0.5, c0 * c1 * c2 + \
                                                             (1.0 - c0) * (1.0 - c1) * (1.0 - c2)));\
                        w *= flip;                                         \
                    }
    EDGE(v0, v1)
    EDGE(v1, v2)
    EDGE(v2, v3)
    EDGE(v3, v0)
    #undef EDGE
    return w * sqrt(d2);
}

/* framebuffer fetch with clamped coords */
vec3 sampleFB(vec2 px) {
    return texture(iChannel0,
        clamp((px + 0.5) / iResolution.xy,
            vec2(0.0), vec2(1.0))).rgb;
}

/* choose edge whose outward normal best matches motion direction */
void pickEdge(vec4 r, vec2 dir, bool origin, out vec2 aPx, out vec2 bPx) {
    vec2 N[4] = vec2[4](vec2(-1, 0), vec2(1, 0), vec2(0, -1), vec2(0, 1));
    float best = origin ? -1e9 : 1e9;
    int idx = 0;
    for (int i = 0; i < 4; ++i) {
        float d = dot(dir, N[i]);
        if (origin ? d > best : d < best) {
            best = d;
            idx = i;
        }
    }
    vec2 TL = r.xy;
    vec2 TR = TL + vec2(r.z, 0.0);
    vec2 BL = TL - vec2(0.0, r.w);
    vec2 BR = TL + vec2(r.z, -r.w);

    if (idx == 0) {
        aPx = TL;
        bPx = BL;
    }
    else if (idx == 1) {
        aPx = TR;
        bPx = BR;
    }
    else if (idx == 2) {
        aPx = TL;
        bPx = TR;
    }
    else {
        aPx = BL;
        bPx = BR;
    }
}

/* REMOVED: No longer needed as we use a fixed color.
float vividScore(vec3 c) { ... }
vec3 rectColor(vec4 r) { ... }
*/


/*─────────────────────────────────────────────────────────────────────────*/
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    /* 1. base terminal buffer */
    #if !defined(WEB)
    fragColor = texture(iChannel0, fragCoord / iResolution.xy);
    #endif

    /* 2. cursor rects (pixels) */
    vec4 cur = iCurrentCursor;
    vec4 prv = iPreviousCursor;
    vec2 dirPx = cur.xy - prv.xy;

    /* 3. build swept parallelogram */
    vec2 p0, p1, q0, q1;
    pickEdge(prv, dirPx, true, p0, p1);  /* origin edge */
    pickEdge(cur, dirPx, false, q0, q1); /* dest  edge */

    vec2 v0 = ndc(p0, 1.0), v1 = ndc(p1, 1.0);
    vec2 v2 = ndc(q1, 1.0), v3 = ndc(q0, 1.0);
    vec2 P = ndc(fragCoord, 1.0);

    float sdTrail = sdPara(P, v0, v1, v2, v3);
    float len = length(v3 - v0);
    float tAlong = clamp(dot(P - v0, (v3 - v0) / len), 0.0, 1.0);
    sdTrail /= (1.0 + CURVE_STRENGTH * (tAlong - 0.5) * 2.0);

    /* 4. tween progress & stand-in cursor SDF */
    float rawProg = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    float prog = ease(rawProg);
    float moving = 1.0 - step(CURSOR_HIDE_AT, prog);

    vec2 tweenPx = mix(prv.xy, cur.xy, prog);
    vec2 halfPx = cur.zw * 0.5;
    vec2 centrePx = tweenPx + vec2(halfPx.x, -halfPx.y);
    vec2 centreN = ndc(centrePx, 1.0);
    vec2 halfN = ndc(halfPx, 0.0);
    float sdCursor = sdBox(P, centreN, halfN);

    /* 5. colour sampling */
    // MODIFIED: Use fixed Catppuccin Lavender color for both endpoints.
    vec3 colStart = CATPPUCCIN_LAVENDER;
    vec3 colEnd = CATPPUCCIN_LAVENDER;
    
    // The mix function still creates the 'gradient', but since Start and End are the same, 
    // the color remains uniform Lavender along the trail.
    vec3 colTrail = mix(colStart, colEnd, tAlong);
    vec3 colTween = mix(colStart, colEnd, prog);

    /* 6. coverages */
    float trailVis = 1.0 - abs(1.0 - 2.0 * prog); /* grow→fade */
    float covTrail = cover(sdTrail) * TRAIL_OPACITY * trailVis;
    float covCursor = cover(sdCursor) * moving;
    float covGlow = cover(sdCursor - GLOW_RADIUS) *
                     (1.0 - cover(sdCursor)) *
                     GLOW_INTENSITY * moving;

    /* 7. composite */
    vec3 outRGB = fragColor.rgb;
    outRGB = mix(outRGB, colTrail, covTrail);  /* trail */
    outRGB = mix(outRGB, colTween, covGlow);   /* halo  */
    outRGB = mix(outRGB, colTween, covCursor); /* block */

    fragColor.rgb = outRGB;
}
