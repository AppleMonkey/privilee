import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/venue_image_dto.dart';
import 'package:venue_data/src/parser/venue_image_parser.dart';

import '../parametarized_test_utility/model/test_case.dart';
import '../parametarized_test_utility/test_case_runner/test_case_list_extension.dart';

void main() {
  final venueImageParser = VenueImageParserImplementation();

  group('VenueImageParser should return ', () {
    [
      TestCase(
        name: 'valid dto when json is valid',
        input: {"url": "https://example.com/image.jpg"},
        expected: VenueImageDto(url: 'https://example.com/image.jpg'),
      ),
      TestCase(
        name: 'valid dto when json is valid with extra fields',
        input: {"url": "https://example.com/image.jpg", "extraField": "value"},
        expected: VenueImageDto(url: 'https://example.com/image.jpg'),
      ),
    ].runTestCases((testCase) {
      final actual = venueImageParser.parse(testCase.input);
      expect(actual, testCase.expected);
    });
  });

  group('VenueImageParser should throw', () {
    [
      TestCase(
        name: 'error when json is null',
        input: null,
        expected: 'VenueImage must be a Map with String keys and String values',
      ),
      TestCase(
        name: 'error when json is not a map',
        input: 'not a map',
        expected: 'VenueImage must be a Map with String keys and String values',
      ),
      TestCase(
        name: 'error when json does not contain "url" key',
        input: {"otherKey": "value"},
        expected: 'VenueImage must contain a "url" key',
      ),
      TestCase(
        name: 'error when "url" value is null',
        input: {"url": null},
        expected: 'VenueImage url cannot be null',
      ),
      TestCase(
        name: 'error when "url" value is empty',
        input: {"url": ""},
        expected: 'VenueImage url cannot be empty',
      ),
    ].runTestCases((testCase) {
      expect(
        () => venueImageParser.parse(testCase.input),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            "",
            equals(testCase.expected),
          ),
        ),
      );
    });
  });
}
