require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))


REACT_NATIVE_MAPBOX_MAPBOX_IOS_VERSION = ENV["REACT_NATIVE_MAPBOX_MAPBOX_IOS_VERSION"] || '~> 5.8'

Pod::Spec.new do |s|
  s.name		= "react-native-flightmap-gl"
  s.summary		= "React Native Component for Mapbox GL"
  s.version		= package['version']
  s.authors		= "Jungleworks"
  s.homepage    	= "https://github.com/@react-native-mapbox-gl/maps#readme"
  s.source      	= { :git => "https://github.com/@react-native-mapbox-gl/maps.git" }
  s.license     	= "MIT"
  s.platform    	= :ios, "8.0"

  s.dependency 'Flightmap-SDK-iOS'
  s.dependency 'React'

  s.subspec 'DynamicLibrary' do |sp|
    sp.source_files	= "ios/RCTMGL/**/*.{h,m}"
  end

  if ENV["REACT_NATIVE_MAPBOX_GL_USE_FRAMEWORKS"]
    s.default_subspecs= ['DynamicLibrary']
  else
    s.subspec 'StaticLibraryFixer' do |sp|
      s.dependency '@react-native-mapbox-gl-mapbox-static', REACT_NATIVE_MAPBOX_MAPBOX_IOS_VERSION
    end

    s.default_subspecs= ['DynamicLibrary', 'StaticLibraryFixer']
  end
end
