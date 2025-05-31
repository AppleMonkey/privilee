import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/datasource/remote_data_source.dart';

void main() {
  late VenueRemoteDataSource remoteDataSource;

  setUpAll(() {
    remoteDataSource = VenueRemoteDataSourceImpl();
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('VenueRemoteDataSource should return ', () {
    test('a list of venues', () async {
      // Act
      final venues = await remoteDataSource.fetchVenues();

      // Assert
      expect(venues, isA<List<dynamic>>());
      expect(venues.length, 29);
    });
  });
}
