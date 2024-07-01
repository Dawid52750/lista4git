#!/bin/bash

function showdate() {
    echo $(date +%Y-%m-%d)
}

function create_logs() {
    num_files=${1:-100}
    for ((i=1; i<=num_files; i++)); do
        filename="log${i}.txt"
        echo "Nazwa skryptu to $0" > $filename
    done
}

function show_help() {
    echo "Dostępne opcje:"
    echo "-d            Wyświetla dzisiejszą datę"
    echo "-l [liczba]   Tworzy automatycznie [liczba] plików log_x.txt"
    echo "-h            Wyświetla wszystkie dostępne opcje"
}

while getopts ":dl:h" opt; do
    case ${opt} in
        d)
            show_date
            ;;
        l)
            create_logs $OPTARG
            ;;
        h)
            show_help
            ;;
        ?)
            echo "Nieznana opcja: $OPTARG"
            show_help
            ;;
    esac
done

