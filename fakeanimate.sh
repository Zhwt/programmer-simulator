#!/bin/bash
#usage: a fake animation that makes you looks like a programmer
#can print package name
#and a fake file size
#flooding your terminal so far.

function progress_bar() {
    local space_before=${1}
    local space_after=${2}
    local words_before=${3}
    local words_after=${4}

    local progress=''
    local print_width=$(( `tput cols` - $(( ${space_before} )) - $(( ${space_after} )) ))

    for (( i=0; i<$print_width; ++i )); do
        progress+='#'
    done

    for (( i=0; i<$print_width; ++i )); do
        echo -ne "\r${words_before}" # something like "Initializing..."
        
        for (( j=0; j<$(( ${space_before} - ${#words_before} )); ++j)); do
            echo -ne " "; # space before progress bar
        done;
        
        echo -ne "${progress:0:$i}" # $i chars of $progress from 0 position
        
        sleep .01
    done
    
    echo -ne "${words_after}" # e.g. "Done."
}

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
