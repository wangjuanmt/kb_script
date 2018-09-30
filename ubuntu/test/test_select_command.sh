#!/usr/bin/env bash

echo "Is NetworkManager restarting completed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) continue;;
    esac
done
