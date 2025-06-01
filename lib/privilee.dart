import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venue_list/venue_list.dart' as venue_list;

class Privilee extends StatelessWidget {
  const Privilee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privilee',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create:
            (_) =>
                venue_list.getIt<venue_list.VenueListBloc>()
                  ..add(venue_list.LoadVenuesEvent()),
        child: const venue_list.Screen(),
      ),
    );
  }
}
