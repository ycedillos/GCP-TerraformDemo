#!/bin/bash

if [ 'terraform fmt -diff -recursive | wc -c' -ne 0 ]
  then
    echo "You need to format your files"
fi

