#!/bin/bash

search_path="dataset/images/test/"

touch test.txt

ls $search_path > test.txt

OUT=$?

if [ $OUT -eq 0 ];then
   echo "file names copied, verify and proceed"
else
   echo "something broke"
fi