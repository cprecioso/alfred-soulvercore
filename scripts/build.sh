#!/bin/bash

set -euxo pipefail

swift build -c release --arch arm64 --arch x86_64
rm -rf .build/release
mkdir -p .build/release
cp -R Resources/* .build/apple/Products/Release/alfred-soulvercore .build/apple/Products/Release/*.framework .build/release
install_name_tool -rpath '@executable_path/../lib' '@executable_path' .build/release/alfred-soulvercore
cd .build/release && zip -r ../SoulverCore.alfredworkflow ./*
