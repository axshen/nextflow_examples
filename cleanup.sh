#!/bin/bash

for D in `find . -mindepth 1 -maxdepth 1 -type d`
do
    echo ${D}
    rm -rf ${D}/.nextflow*
    rm -rf ${D}/work
done