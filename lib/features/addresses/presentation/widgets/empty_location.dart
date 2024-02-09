import 'package:flutter/material.dart';
import 'package:flutter_map_task/app_widgets/custom_button.dart';
import 'package:flutter_map_task/routing/navigator.dart';
import 'package:flutter_map_task/routing/routes.dart';
import 'package:flutter_map_task/utilities/images.dart';
import 'package:flutter_map_task/utilities/text_style_helper.dart';
import 'package:flutter_svg/svg.dart';

class EmptyLocation extends StatelessWidget {
  const EmptyLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImagesHelper.emptyLocationIcon),
        const SizedBox(height: 20),
        Text(
          'No Addresses Found',
          style:
              TextStyleHelper.subtitle17.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Display addresses here, you can use a ListView.builder
        // with actual address data.
        // Example:
        Text(
          'Add a new address to ensure timely and accurate delivery of your order',
          textAlign: TextAlign.center,
          style: TextStyleHelper.button13.copyWith(color: Colors.grey.shade400),
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            AppRoutes.pushNamedNavigator(routeName: Routes.addAddresses);
          },
          text: 'Add Address',
        )
      ],
    );
  }
}
