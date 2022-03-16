#!/bin/bash
# Use this script to download compatible binaries
wget https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-55/stable-headless-chromium-amazonlinux-2017-03.zip
wget https://chromedriver.storage.googleapis.com/2.43/chromedriver_linux64.zip
unzip stable-headless-chromium-amazonlinux-2017-03.zip
unzip chromedriver_linux64.zip
rm "*.zip"
