import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidgetNotification extends Notification {
  // final Completer<GoogleMapController> googleMapController;
  final GoogleMapController controller;
  GoogleMapWidgetNotification({required this.controller});
}

class GoogleMapWidget extends StatefulWidget {
  static String routeName = "/google_map";
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // late String _darkMapStyle;
  // late String _lightMapStyle;
  late String _nightMapStyle;

  Future _loadMapStyles() async {
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
    asyncInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  body() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      myLocationEnabled: _enableMyLocation,
      myLocationButtonEnabled: true,
      // markers: Set<Marker>.of(_markerMap.values),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        GoogleMapWidgetNotification(controller: controller).dispatch(context);
      },
      onTap: (LatLng latLng) {
        FocusScope.of(context).unfocus();
        print("onTap latLng.latitude: ${latLng.latitude}");
        print("onTap longitude.: ${latLng.longitude}");
      },
    );
  }

  asyncInitState() async {
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
