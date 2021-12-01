#!/bin/bash

set -euxo pipefail

swift build -c release --arch arm64 --arch x86_64
rm -rf .build/release
mkdir -p .build/release
cp -R Resources/* .build/apple/Products/Release/alfred-soulvercore .build/apple/Products/Release/*.framework .build/release
cd .build/release && zip -r ../SoulverCore.alfredworkflow ./*
