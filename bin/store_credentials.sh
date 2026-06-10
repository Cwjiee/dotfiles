#!/bin/sh

echo -n "name of credential: "
read cred_name

echo -n "paste the credential: "
read cred

credential="$(cred_name):$(cred)"

echo $credential>> 

