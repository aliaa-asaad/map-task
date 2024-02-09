import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_task/app_widgets/custom_button.dart';
import 'package:flutter_map_task/features/addresses/data/view_models/cubit/location_cubit.dart';
import 'package:flutter_map_task/features/addresses/presentation/widgets/chosen_location.dart';
import 'package:flutter_map_task/handlers/google_map.dart';
import 'package:flutter_map_task/utilities/text_style_helper.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyleHelper.subtitle19.copyWith(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Add Address'),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LocationError) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (state is LocationLoaded) {
            return Stack(
              children: [
                GoogleMapWidget(
                    location:
                        LocationCubit.instance.myCurrentLocationCameraPosition!,
                    mapController: LocationCubit.instance.mapController),
                Positioned(
                  bottom: 24,
                  right: 24,
                  left: 24,
                  child: Column(
                    children: [
                      ChosenLocation(
                          locationName:
                              '${LocationCubit.instance.locationName[0].administrativeArea!}, ${LocationCubit.instance.locationName[0].locality!},${LocationCubit.instance.locationName[0].street!}'),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Your location',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.my_location_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                      CustomButton(onPressed: () {}, text: 'Confirm')
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text('empty'),
          );
        },
      ),
    );
  }
}
