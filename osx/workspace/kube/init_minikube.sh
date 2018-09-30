#!/usr/bin/env bash

# https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#xhyve-driver
brew install docker-machine-driver-xhyve
# docker-machine-driver-xhyve need root owner and uid
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

brew install kubernetes-cli
brew cask install minikube
