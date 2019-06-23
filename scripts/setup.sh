#!/bin/bash

sed -i '' "s/YOUR_GOOGLE_MAPS_API_KEY/$1/g" ./android/app/src/main/AndroidManifest.xml ./ios/Runner/AppDelegate.m
