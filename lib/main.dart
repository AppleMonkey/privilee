import 'package:flutter/material.dart';
import 'package:venue_list/venue_list.dart' as venue_list;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Privilee',
    home: const Scaffold(body: Center(child: venue_list.Screen())),
  );
}
