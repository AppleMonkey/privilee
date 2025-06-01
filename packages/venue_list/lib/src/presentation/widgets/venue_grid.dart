import 'package:flutter/material.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';
import 'package:venue_list/src/presentation/widgets/venue_card.dart';

class VenueGrid extends StatelessWidget {
  final VenueGridDisplayModel venueGridDisplayModel;

  const VenueGrid({super.key, required this.venueGridDisplayModel});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            venueGridDisplayModel.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((_, index) {
            final venue = venueGridDisplayModel.items[index];
            return VenueCard(model: venue);
          }, childCount: venueGridDisplayModel.items.length),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 3.7,
          ),
        ),
      ),
    ],
  );
}
