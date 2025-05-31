import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_state.dart';

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
            final venues = state.venues;
            return ListView.builder(
              itemCount: venues.length,
              itemBuilder:
                  (_, index) => ListTile(
                    title: Text(venues[index].name),
                    subtitle: Text(venues[index].city),
                  ),
            );
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
