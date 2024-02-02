import 'dart:async';

import 'package:flutter/material.dart';
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
    return Container(
      child: GoogleMap(
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position:
                LatLng(location.target.latitude, location.target.longitude),
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
      ),
    ); /* SliverAppBar(
      expandedHeight: MediaQueryHelper.height * 0.6,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      /* pinned: true,*/
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        /* stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ], */
        background:   
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0.r),
              topRight: Radius.circular(30.0.r),
            ),
          ),
          child: Container(
            width: MediaQueryHelper.width * 0.1,
            height: MediaQueryHelper.height * 0.005,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ),
        ),
      ),
    ); */
  }
}
