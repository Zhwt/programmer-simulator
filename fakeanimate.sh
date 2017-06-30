#!/bin/bash
#usage: a fake animation that makes you looks like a programmer
#can print package name
#and a fake file size
#flooding your terminal so far.

function show_package() {
    local line_count=$( wc -l < packagelist )
    local r=$(( ( RANDOM % $line_count ) + 1 ))
    local para=$r'q;d'
    local p=$(sed $para packagelist)
    printf $p
}

function show_file_size() {
    local r=$(( ( RANDOM % 500 ) + 1 ))
    local s
    local unit
    if [[ $r -gt 100 ]];
    then
        unit="k"
    elif [[ $r -gt 50 ]];
    then
        s=$(( ( RANDOM % 9 ) ))
        if [[ $s -gt 7 ]];
        then
            unit="k"
        else
            unit="M"
        fi
    elif [[ $r -gt 9 ]];
    then
        unit="M"
    else
        s=$(( ( RANDOM % 9 ) ))
        r=$r'.'$s
        unit="M"
    fi
    printf $r' '$unit
}

while true
do
    show_package
    printf ' '
    show_file_size
    printf '\n'
    sleep 0.15
done

#exit 0
