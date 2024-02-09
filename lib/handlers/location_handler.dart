//import 'package:geocoding/geocoding.dart';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHandler {
  //goelocator package
  static Future<Position> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isServiceEnabled == false || permission == LocationPermission.denied) {
      //await Geolocator.openLocationSettings();
      await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
/* Future<void> getCurrentLocation() async {
    await LocationHandler.getCurrentLocation();
    position = (await Geolocator.getCurrentPosition()
        .whenComplete(() => setState(() {})));
  } */
  //geocoding package
  static Future<List<double>> getLocationFromAddress(
      {required String location}) async {
    try {
      List<Location> locations = await locationFromAddress(location);

      double? latitude = locations[0].latitude;
      double? longitude = locations[0].longitude;
      return [latitude, longitude];
    } catch (e) {
      log('getLocationFromAddress error: $e');
      return [];
    }
  }

 static Future<List<Placemark>> getAddressFromLocation(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        String name = placemarks[0].name!;
        String subLocality = placemarks[0].subLocality!;
        String area = placemarks[0].administrativeArea!;
        String postalCode = placemarks[0].postalCode!;
      
       // String knownName = placemarks[0].featureName!;

        log('Place Name: $name');
        log('Sublocality: $subLocality');
        log('Area: $area');
        log('Postal Code: $postalCode');
       // print('Known Name: $knownName');
       return placemarks;
      } else {
        log('No placemark found for the given coordinates.');
        return [];
      }
    } catch (e) {
      log('Error fetching placemark: $e');
      return [];
    }
  }
}
