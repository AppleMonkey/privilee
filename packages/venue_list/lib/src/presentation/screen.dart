import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_state.dart';
import 'package:venue_list/src/presentation/widgets/venue_grid.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Venues')),
      body: BlocBuilder<VenueListBloc, VenueListState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            final displayModel = state.venueGrid;
            return VenueGrid(venueGridDisplayModel: displayModel);
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No venues found.'));
          }
        },
      ),
    );
  }
}
