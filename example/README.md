<p align="center">
<a href="https://app.flightmap.io">
  <img src="/assets/flightmap_logo.png" width="500"/>
</a>
</p>

# React Native Flightmap GL Demo

Demo Application for [React Native Flightmap GL](../README.md)

## Sign up for Flightmaps

Not a Flightmap user yet? [Sign up for an account here](https://app.flightmap.io). Once you’re signed in, all you need to start building is a Flightmap access token. 

## Installation

* Before installing node packages you'll need to enter your Flightmap access token to a file "set_access_token.sh".

* Make sure you are in the example directory
```
cd example
```

* Install our dependencies using `npm install`.

## Start React Native Packager

Open up another tab in your Terminal and run
```
npm start
```

*Note*: if modules were added to base lib you might need to run `npm start --reset-cache` because we're using `babel` to [rewrite imports](https://github.com/react-native-mapbox-gl/maps/pull/778)

## Run Android Simulator

* Start Android emulator
* Run `adb reverse tcp:8081 tcp:8081` to forward port to packager(needed for hot reloading, if you're not developing you can skip this step).
* Run `react-native run-android` from `example` directory

**NOTE**

If the build fails make sure gradle has permission to build from cli
```
cd android
chmod +x gradlew
```

## Run iOS Simulator

You can run this with the react-native cli or Xcode

* Run `cd ios && pod install && cd ..` from `example` directory to install cocoapods pods
* Run `react-native run-ios` from `example` directory
