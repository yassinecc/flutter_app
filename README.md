# flutter_app

A new Flutter project.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Setup the project

You will need a Google API key to use Google Maps. Create one that can call the iOS and Android Maps SDK then:

- Create a `constants.json` file in the `ios` folder with the following structure. You might need to re-link this file in Xcode:

```json
{ "google_maps_api_key": "YOUR_API_KEY" }
```

- Create a `constants.xml` file in the `android/app/src/main/res/values` folder with the following structure

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_api_key">YOUR_API_KEY</string>
</resources
```
