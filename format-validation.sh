#!/bin/bash

if [ `terraform fmt | wc -c` -ne 0 ]
  then
    echo "You need to format your files"
fi

