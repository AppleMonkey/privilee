import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venue_list/venue_list.dart' as venue_list;
import 'package:venue_domain/venue_domain.dart' as venue_domain;
import 'package:venue_data/venue_data.dart' as venue_data;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await venue_data.configureDependencies();
  await venue_domain.configureDependencies();
  await venue_list.configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
