import 'package:flutter/material.dart';
import 'package:flutter_map_task/utilities/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Name
            const Text(
              'Hotel XYZ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Hotel Rate
            const Text(
              'Rate: \$150 per night',
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            // Hotel Description
            const Text(
              'A luxurious hotel with stunning views and world-class amenities.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            // Hotel Reviews
            const Text(
              'Reviews:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Display reviews here, you can use a ListView.builder
            // with actual review data.
            // Example:
            const Text('1. Great service and comfortable stay.'),
            const Text('2. Beautiful location and friendly staff.'),
            const SizedBox(height: 16),
            // Hotel Photos
            const Text(
              'Photos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Display photos here, you can use a ListView.builder
            // with actual photo data.
            // Example:

            Image.network(
              'https://wallpapercave.com/wp/wp4785032.jpg',
              // scale: 1,
            ),
            Image.network(
              'https://picsum.photos/200/300',
              // scale: 1,
            ),
            SvgPicture.asset(
             ImagesHelper.emptyLocationIcon,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
