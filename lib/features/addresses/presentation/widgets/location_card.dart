import 'package:flutter/material.dart';
import 'package:flutter_map_task/features/addresses/data/view_models/cubit/location_cubit.dart';
import 'package:flutter_map_task/utilities/images.dart';
import 'package:flutter_map_task/utilities/text_style_helper.dart';
import 'package:flutter_svg/svg.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ImagesHelper.locationIcon,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Home',
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  onPressed: () {},
                  child: const Icon(Icons.edit_location_alt_outlined))
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${LocationCubit.instance.locationName[0].administrativeArea!}, ${LocationCubit.instance.locationName[0].locality!},${LocationCubit.instance.locationName[0].street!}',
            style:
                TextStyleHelper.button13.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
