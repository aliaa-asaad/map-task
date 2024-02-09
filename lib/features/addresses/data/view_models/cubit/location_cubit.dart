import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_task/handlers/location_handler.dart';
import 'package:flutter_map_task/routing/navigator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  Position? position;
  List<Placemark> locationName = [];
  bool isEmpty = true;
  final Completer<GoogleMapController> mapController = Completer();

  CameraPosition? myCurrentLocationCameraPosition;

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    try {
      //  await LocationHandler.getCurrentLocation();
      position = await LocationHandler.getCurrentLocation();
      locationName = await LocationHandler.getAddressFromLocation(
          position!.latitude, position!.longitude);
      myCurrentLocationCameraPosition = CameraPosition(
        bearing: 0.0,
        target: LatLng(position!.latitude, position!.longitude),
        tilt: 0.0,
        zoom: 17,
      );
      isEmpty = false;
      emit(LocationLoaded());
    } catch (e) {
      emit(LocationError());
      log(e.toString());
    }
  }
}
