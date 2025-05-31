import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VenueRemoteDataSource {
  Future<List<dynamic>> fetchVenues();
}

@LazySingleton(as: VenueRemoteDataSource)
class VenueRemoteDataSourceImpl implements VenueRemoteDataSource {
  const VenueRemoteDataSourceImpl();

  @override
  Future<List<dynamic>> fetchVenues() async {
    // TODO: Change the implementation to fetch from an actual API

    // For now, we simulate a delay to mimic network latency
    await Future.delayed(const Duration(milliseconds: 300));

    // In a real implementation, you would use _client.get() to fetch data from an API
    // await _client.get(Uri.parse('https://api.example.com/venues'));
    final raw = await rootBundle.loadString('assets/gyms.json');

    final decoded = jsonDecode(raw);

    if (decoded is Map && decoded.containsKey("items")) {
      return decoded["items"];
    }

    throw Exception("Unexpected JSON structure");
  }
}
