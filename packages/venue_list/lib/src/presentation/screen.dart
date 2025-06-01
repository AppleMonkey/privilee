import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:venue_list/src/bloc/venue_list_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_state.dart';
import 'package:venue_list/src/presentation/widgets/venue_grid.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: SvgPicture.asset(
        '/assets/privilee_logo.svg',
        package: 'venue_list',
        height: 32,
      ),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(234, 235, 236, 1.0),
      elevation: 1.0,
    ),
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
