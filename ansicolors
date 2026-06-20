#!/usr/bin/env bash

for b in {40..47}; do
    printf "\e[%dm  " $b
done
printf "\e[0m\n"

for b in {100..107}; do
    printf "\e[%dm  " $b
done
printf "\e[0m\n"

for b in 49 {40..47} {100..107}; do
    for f in 39 {30..37} {90..97}; do
        printf "\e[%d;%dm text " $b $f
    done
    printf "\e[0m\n"
done
