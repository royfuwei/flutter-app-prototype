import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class DevGoogleMap extends StatefulWidget {
  static String routeName = "/dev/google_map";
  const DevGoogleMap({Key? key}) : super(key: key);

  @override
  _DevGoogleMapState createState() => _DevGoogleMapState();
}

class _DevGoogleMapState extends State<DevGoogleMap> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late String _darkMapStyle;
  late String _lightMapStyle;
  late String _nightMapStyle;

  Future _loadMapStyles() async {
    /* _darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
    _lightMapStyle =
        await rootBundle.loadString('assets/map_styles/light.json'); */
    _nightMapStyle =
        await rootBundle.loadString('assets/map_styles/night.json');
  }

  Completer<GoogleMapController> _controller = Completer();

  late Position position;
  bool _enableMyLocation = true;

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: _enableMyLocation,
        myLocationButtonEnabled: true,
        // markers: Set<Marker>.of(_markerMap.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  _initState() async {
    await _loadMapStyles();
    await _setMapStyle();
    await _moveCurrentLocation();
    await _getCurrentLocation();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
    // final theme = WidgetsBinding.instance.window.platformBrightness;
    controller.setMapStyle(_nightMapStyle);
  }

  _getCurrentLocation() async {
    // final controller = await _controller.future;
    var requestPermission = await Geolocator.requestPermission();
    if (requestPermission != LocationPermission.denied) {
      var _position = await Geolocator.getCurrentPosition();
      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(_position.latitude, _position.longitude),
          zoom: 16.4746,
        );
      });
      // controller.moveCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
    }
  }

  _moveCurrentLocation() async {
    final controller = await _controller.future;
    var requestPermission = await Geolocator.requestPermission();
    if (requestPermission != LocationPermission.denied) {
      var _position = await Geolocator.getCurrentPosition();
      var _cameraPosition = CameraPosition(
        target: LatLng(_position.latitude, _position.longitude),
        zoom: 16.4746,
      );
      controller.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    }
  }

  Future<void> _goToGoogle() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}
