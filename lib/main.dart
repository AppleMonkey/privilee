import 'package:flutter/material.dart';
import 'package:privilee/privilee.dart';
import 'package:venue_list/venue_list.dart' as venue_list;
import 'package:venue_domain/venue_domain.dart' as venue_domain;
import 'package:venue_data/venue_data.dart' as venue_data;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await venue_data.configureDependencies();
  await venue_domain.configureDependencies();
  await venue_list.configureDependencies();

  runApp(const Privilee());
}
