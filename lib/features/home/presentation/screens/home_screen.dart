import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map_task/handlers/google_map.dart';
import 'package:flutter_map_task/handlers/location_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();
  Future<void> getCurrentLocation() async {
    await LocationHandler.getCurrentLocation();
    position = (await Geolocator.getCurrentPosition()
        .whenComplete(() => setState(() {})));
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMapWidget(
              location: _myCurrentLocationCameraPosition,
              mapController: _mapController),
    );
  }
}
