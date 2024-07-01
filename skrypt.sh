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
    echo "--date         Wyświetla dzisiejszą datę"
    echo "--logs [liczba]   Tworzy automatycznie [liczba] plików log_x.txt"
    echo "--help         Wyświetla wszystkie dostępne opcje"
}

case $1 in
    --date)
        show_date
        ;;
    --logs)
        create_logs $2
        ;;
    --help)
        show_help
        ;;
    *)
        echo "Nieznana opcja: $1"
        show_help
        ;;
esac
