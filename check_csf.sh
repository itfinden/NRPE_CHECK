#!/bin/bash

CSF_VAR=$(csf -l | grep -Fo disabled | wc -l)

if [ -d /etc/csf ]; then #valido que el directorio existe
        if [[ $CSF_VAR -gt 0 ]]; then
               # if [[ "$(ps aux | grep 'lfd' | grep -v grep | wc -l)" -eq 0 ]]; then
               #         echo "CSF WARNING – CSF esta corriendo pero LFD esta detenido"
               #         exit 1
               # fi
                echo "CSF CRITICAL – No Corriendo"
                exit 0
        else
                echo "CSF OK – Corriendo"
                exit 2
        fi
else #sino existe muestro este mensaje
        echo "CSF CRITICAL – No Instalado"
        exit 2
fi
