set wifiName to "E56B 300mbps 2.4ghz@unifi"
set wifiPass to "E56B@2021-"
set connected to false
set attempts to 0
set maxAttempts to 5 -- So it doesn't loop forever if the router is actually dead

repeat while connected is false and attempts < maxAttempts
    set attempts to attempts + 1
    try
        -- 1. Try to join the network
        do shell script "networksetup -setairportnetwork en0 " & quoted form of wifiName & " " & quoted form of wifiPass
        
        -- 2. Wait a moment for the IP to stabilize
        delay 5
        
        -- 3. Ping Google's DNS once to check for actual internet
        do shell script "ping -c 1 8.8.8.8"
        
        set connected to true
        display notification "Internet is live!" with title "Wi-Fi Fixed"
    on error
        -- If ping fails, it hits this block
        display notification "Attempt " & attempts & " failed. Retrying..." with title "Wi-Fi Issue"
        delay 3 -- Wait before next attempt
    end try
end repeat

if connected is false then
    display dialog "Gave up after " & maxAttempts & " tries. Maybe check the router?" buttons {"Bummer"} default button 1
end if
