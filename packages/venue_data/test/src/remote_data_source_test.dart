import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:venue_data/src/datasource/remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late Client client;
  late VenueRemoteDataSource remoteDataSource;

  setUpAll(() {
    client = MockClient();
    remoteDataSource = VenueRemoteDataSourceImpl(client: client);
    WidgetsFlutterBinding.ensureInitialized();
  });

  tearDownAll(() {
    reset(client);
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

class MockClient extends Mock implements Client {}
