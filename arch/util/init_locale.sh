#!/usr/bin/env bash

printf "\nen_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
printf "\nzh_CN.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
printf "\nko_KR.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
printf "\nja_JP.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen

sudo locale-gen