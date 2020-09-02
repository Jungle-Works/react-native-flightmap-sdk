import React from 'react';
import {Alert} from 'react-native';
import MapboxGL from '@react-native-flightmap-gl/flightmap';

import sheet from '../styles/sheet';
import {onSortOptions} from '../utils';

import BaseExamplePropTypes from './common/BaseExamplePropTypes';
import TabBarPage from './common/TabBarPage';



class ShowMap extends React.Component {
  static propTypes = {
    ...BaseExamplePropTypes,
  };

  constructor(props) {
    super(props);

    this._mapOptions = Object.keys(MapboxGL.StyleURL)
      .map((key) => {
        return {
          label: key,
          data: MapboxGL.StyleURL[key],
        };
      })
      .sort(onSortOptions);

    this.state = {
      styleURL: this._mapOptions[0].data,
    };

    this.onMapChange = this.onMapChange.bind(this);
    this.onUserMarkerPress = this.onUserMarkerPress.bind(this);
  }

  componentDidMount() {
    MapboxGL.locationManager.start();
  }

  componentWillUnmount() {
    MapboxGL.locationManager.stop();
  }

  onMapChange(index, styleURL) {
    this.setState({styleURL});
  }

  onUserMarkerPress() {
    Alert.alert('You pressed on the user location annotation');
  }

  render() {
    return (
      <TabBarPage
        {...this.props}
        scrollable
        options={this._mapOptions}
        onOptionPress={this.onMapChange}>
        <MapboxGL.MapView
          styleURL= 'https://maps.flightmap.io/styles//default.json'
          style={sheet.matchParent}>
          <MapboxGL.Camera followZoomLevel={12} followUserLocation />

          <MapboxGL.UserLocation onPress={this.onUserMarkerPress} />
        </MapboxGL.MapView>
      </TabBarPage>
    );
  }
}

export default ShowMap;
