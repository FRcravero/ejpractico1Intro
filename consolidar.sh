#!/bin/bash

while :; do
    for archivo in entrada/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "salida/$FILENAME.txt"
            mv "$archivo" procesado/
        fi
    done
    sleep 0.1
done
