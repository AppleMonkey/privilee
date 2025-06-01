import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:venue_data/src/datasource/remote_data_source.dart';
import 'package:venue_data/src/mapper/category_mapper.dart';
import 'package:venue_data/src/mapper/coordinates_mapper.dart';
import 'package:venue_data/src/mapper/opening_hours_mapper.dart';
import 'package:venue_data/src/mapper/thing_to_do_mapper.dart';
import 'package:venue_data/src/mapper/venue_image_mapper.dart';
import 'package:venue_data/src/mapper/venue_mapper.dart';
import 'package:venue_data/src/parser/category_parser.dart';
import 'package:venue_data/src/parser/coordinates_parser.dart';
import 'package:venue_data/src/parser/opening_hours_parser.dart';
import 'package:venue_data/src/parser/thing_to_do_parser.dart';
import 'package:venue_data/src/parser/venue_image_parser.dart';
import 'package:venue_data/src/parser/venue_parser.dart';
import 'package:venue_data/src/repository/venue_repository.dart';
import 'package:venue_domain/venue_domain.dart' show Venue, VenueRepository;

void main() {
  late VenueRepository sut;
  late VenueRemoteDataSource venueRemoteDataSource;
  late VenueParser venueParser;
  late VenueMapper venueMapper;
  late Client client;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    
    client = Client();
    venueRemoteDataSource = VenueRemoteDataSourceImpl();
    venueParser = VenueParserImplementation(
      coordinatesParser: CoordinatesParserImplementation(),
      venueImageParser: VenueImageParserImplementation(),
      categoryParser: CategoryParserImplementation(),
      openingHoursParser: OpeningHoursParserImplementation(),
      thingToDoParser: ThingToDoParserImplementation(),
    );
    venueMapper = VenueMapperImplementation(
      coordinatesMapper: CoordinatesMapperImplementation(),
      venueImageMapper: VenueImageMapperImplementation(),
      categoryMapper: CategoryMapperImplementation(),
      openingHoursMapper: OpeningHoursMapperImplementation(),
      thingToDoMapper: ThingToDoMapperImplementation(),
    );

    sut = VenueRepositoryImplementation(
      remoteDataSource: venueRemoteDataSource,
      parser: venueParser,
      mapper: venueMapper,
    );
  });

  tearDownAll(() {
    client.close();
  });

  group('VenueRepository should return ', () {
    test('a list of venues', () async {
      // Act
      final venues = await sut.getVenues();

      // Assert
      expect(venues, isA<List<Venue>>());
      expect(venues.length, 29);
    });
  });
}
