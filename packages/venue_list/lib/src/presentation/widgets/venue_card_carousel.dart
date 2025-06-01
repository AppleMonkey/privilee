import 'package:flutter/material.dart';

class VenueImageCarousel extends StatelessWidget {
  final List<String> images;

  const VenueImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Image.asset(
        'packages/venue_list/assets/placeholder.jpg',
        fit: BoxFit.cover,
      );
    }

    return PageView.builder(
      itemCount: images.length,
      itemBuilder:
          (context, index) => Image.network(
            images[index],
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => Image.asset(
                  'packages/venue_list/assets/placeholder.jpg',
                  fit: BoxFit.cover,
                ),
          ),
    );
  }
}
