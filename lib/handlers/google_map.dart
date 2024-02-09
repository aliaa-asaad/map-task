import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map_task/features/addresses/data/view_models/cubit/location_cubit.dart';
import 'package:flutter_map_task/routing/navigator.dart';
import 'package:flutter_map_task/routing/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final CameraPosition location;
  final Completer<GoogleMapController> mapController;
  const GoogleMapWidget(
      {super.key, required this.location, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: (LatLng latLng) {
        // Handle the tapped coordinates (latLng.latitude and latLng.longitude)
        log('Selected coordinates: ${latLng.latitude}, ${latLng.longitude}');
        LocationCubit.instance.getCurrentLocation();
      },
      markers: {
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(location.target.latitude, location.target.longitude),
          infoWindow: const InfoWindow(title: 'My Location'),
          onTap: () =>
              AppRoutes.pushNamedNavigator(routeName: Routes.placeDetails),
          icon: BitmapDescriptor.defaultMarker,
        )
      },
      initialCameraPosition: location,
      //شكل الماب هيقبي عامل ازاي يعي هتبقي ماب عادية زي
      // الللي عارفينها ولا ماب زي بتاعة الستالايت ولا ايه
      mapType: MapType.normal, buildingsEnabled: true,
      indoorViewEnabled: true,
      // بيعمل نقطة زرقة عاللوكيشن اللي انا فيه
      myLocationButtonEnabled: true,
      //بيظهر تحت زرارين للتكبير والتصغير فهو هيلغيهم لان انا كدا كدا بقدر اكبر واصغر بنفسي عادي
      zoomControlsEnabled: true, zoomGesturesEnabled: true,
      // بيظهرلي بوتون بيجيبلي اللوكيشن الحالي بتاعي
      myLocationEnabled: true, //liteModeEnabled: true ,
      onMapCreated: (GoogleMapController controller) =>
          mapController.complete(controller),
    );
  }
}
