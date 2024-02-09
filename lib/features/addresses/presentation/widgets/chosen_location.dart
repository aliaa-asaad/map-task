import 'package:flutter/material.dart';
import 'package:flutter_map_task/utilities/images.dart';
import 'package:flutter_map_task/utilities/text_style_helper.dart';
import 'package:flutter_svg/svg.dart';

class ChosenLocation extends StatelessWidget {
  final String locationName;

  const ChosenLocation({
    super.key, required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Location',
                style: TextStyleHelper.caption11.copyWith(
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 8),
               Text(locationName,
                style: TextStyle(color: Colors.black),
                           ),
            ],
          ),
          SvgPicture.asset(
            ImagesHelper.locationSolidIcon,
            height: 24,
          )
        ],
      ),
    );
  }
}
