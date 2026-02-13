#!/bin/bash

# Simple variables
name="Anton"
count=5

# Function
function greet() {
    local user=$1
    echo "Hello, $user!"
}

# Loop
for ((i=1; i<=count; i++)); do
    greet "$name"
done

# Conditional
if [ "$name" == "Anton" ]; then
    echo "Name is Tom"
else
    echo "Name is not Tom"
fi
