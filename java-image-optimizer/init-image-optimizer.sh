#!/bin/bash

in_dir=$1
out_dir=$2

# Check if there are exactly two arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 PWD/my-in-dir/ PWD/my-out-dir/"
    exit 1

elif [[ -d "$in_dir" && -d "$out_dir" ]]; then

    read -p "Provide image name: " image_name

    echo 
    echo "***************************************** PROCESSING ... *****************************************"
    echo
    echo "BUILDING IMAGE..."
    docker build -t $image_name .
    echo
    echo "***************************************** PROCESSING BUILD ... *****************************************"
    echo
    echo "CREATING CONTAINER..."
    docker run -d -v "$in_dir":/usr/src/optimizer/imgs/in -v "$out_dir":/usr/src/optimizer/imgs/out $image_name
    echo
    
else
    echo " both $in_dir AND $out_dir must be directories"
    exit 1
fi

