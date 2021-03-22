#!/bin/bash

if [ `terraform fmt | wc -c` -ne 0 ]
  then
    echo "You need to format your files. Run terraform fmt to solve your issues";
    exit 1;
fi

