import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_data/src/model/coordinates_dto.dart';
import 'package:venue_data/src/model/opening_hours_dto.dart';
import 'package:venue_data/src/model/thing_to_do_dto.dart';
import 'package:venue_data/src/model/venue_dto.dart';
import 'package:venue_data/src/model/venue_image_dto.dart';
import 'package:venue_data/src/parser/category_parser.dart';
import 'package:venue_data/src/parser/coordinates_parser.dart';
import 'package:venue_data/src/parser/opening_hours_parser.dart';
import 'package:venue_data/src/parser/thing_to_do_parser.dart';
import 'package:venue_data/src/parser/venue_image_parser.dart';
import 'package:venue_data/src/parser/venue_parser.dart';

import '../parametarized_test_utility/parametarized_test.dart';

part 'internal/venue_parser_fixture.dart';

void main() {
  final venueParser = VenueParserImplementation(
    coordinatesParser: CoordinatesParserImplementation(),
    venueImageParser: VenueImageParserImplementation(),
    categoryParser: CategoryParserImplementation(),
    openingHoursParser: OpeningHoursParserImplementation(),
    thingToDoParser: ThingToDoParserImplementation(),
  );

  group('VenueParser should return ', () {
    test('valid VenueDto when parse is called with valid input', () async {
      final input = await buildValidVenueJson();
      final expected = buildValidVenueDto();
      final actual = venueParser.parse(input);
      expect(actual, expected);
    });
  });

  group('VenueParser should throw an error ', () {
    [
      TestCase(
        name: 'when parse is called with null input',
        input: null,
        expected: 'Venue must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'when parse is called with empty input',
        input: {},
        expected: 'Venue must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'when parse is called with missing id',
        input: {'name': 'Test Venue'},
        expected: 'Venue id cannot be null or empty',
      ),
      TestCase(
        name: 'when parse is called with missing name',
        input: {'id': '1'},
        expected: 'Venue name cannot be null or empty',
      ),
      TestCase(
        name: 'throws when "id" is null or empty',
        input: {
          "id": "",
          "name": "Test Name",
          "city": "Test City",
          "type": "Test Type",
          "location": "Test Location",
          "accessibleForGuestPass": true,
          "overviewText": ["Intro"],
          "coordinates": {"latitude": 0.0, "longitude": 0.0},
        },
        expected: 'Venue id cannot be null or empty',
      ),
      //TODO: Add more test cases for other fields like city, type, location, etc.
    ].runTestCases((testCase) {
      expect(
        () => venueParser.parse(testCase.input),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            testCase.expected,
          ),
        ),
      );
    });
  });
}
