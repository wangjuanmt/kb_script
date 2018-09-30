#!/usr/bin/env bash

eval "$(jenv init -)"

#jenv add $JVM_DIR/jdk7
jenv add $JVM_DIR/jdk8

jenv global 1.8
jenv rehash
jenv enable-plugin export
