import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_task/app_widgets/custom_button.dart';
import 'package:flutter_map_task/features/addresses/data/view_models/cubit/location_cubit.dart';
import 'package:flutter_map_task/features/addresses/presentation/widgets/empty_location.dart';
import 'package:flutter_map_task/features/addresses/presentation/widgets/location_card.dart';
import 'package:flutter_map_task/routing/navigator.dart';
import 'package:flutter_map_task/routing/routes.dart';
import 'package:flutter_map_task/utilities/text_style_helper.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyleHelper.subtitle19.copyWith(
          color: Colors.black,
        ),
        title: const Text('Addresses'),
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
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: LocationCubit.instance.isEmpty
                  ? const EmptyLocation()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const LocationCard(),
                          CustomButton(
                            background: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.1),
                            onPressed: () {
                              AppRoutes.pushNamedNavigator(
                                  routeName: Routes.addAddresses);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_circle_outline,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Add Address',
                                  style: TextStyleHelper.button13.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            );
          }
          return Text('null');
        },
      ),
    );
  }
}
