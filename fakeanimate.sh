#!/bin/bash
#usage: a fake animation that makes you looks like a programmer
#can print package name flooding your terminal so far.

function show_package() {
    local line_count=$( wc -l < packagelist )
    local r=$(( ( RANDOM % $line_count ) + 1 ))
    local para=$r'q;d'
    local p=$(sed $para packagelist)
    printf $p'\n'
}

while true
do
    show_package
    sleep 0.15
done

#exit 0
