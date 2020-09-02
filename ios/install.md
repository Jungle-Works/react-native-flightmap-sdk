# iOS Installation

## React-Native > `0.60.0`

If you are using autolinking feature introduced in React-Native `0.60.0`, you just need `npm install @react-native-flightmap-gl/flightmap`, followed by `pod install` from the `ios` directory.

## Using CocoaPods

To install with CocoaPods, add the following to your `Podfile`:

```ruby
  # Mapbox
  pod 'react-native-flightmap-gl', :path => '../node_modules/@react-native-flightmap-gl/flightmap'

```

Then run `pod install` and rebuild your project.


