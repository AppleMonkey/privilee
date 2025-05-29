import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/coordinates_dto.dart';
import 'package:venue_data/src/parser/coordinates_parser.dart';

import '../parametarized_test_utility/model/test_case.dart';
import '../parametarized_test_utility/test_case_runner/test_case_list_extension.dart';

void main() {
  final coordinatesParser = CoordinatesParserImplementation();

  group('CoordinatesParser should return ', () {
    [
      TestCase(
        name: 'valid dto when json is valid',
        input: {"latitude": 12.34, "longitude": 56.78},
        expected: CoordinatesDto(latitude: 12.34, longitude: 56.78),
      ),
      TestCase(
        name: 'valid dto when json has extra fields',
        input: {"latitude": 12.34, "longitude": 56.78, "extraField": "value"},
        expected: CoordinatesDto(latitude: 12.34, longitude: 56.78),
      ),
    ].runTestCases((testCase) {
      final actual = coordinatesParser.parse(testCase.input);
      expect(actual, testCase.expected);
    });
  });

  group('CoordinatesParser should throw', () {
    [
      TestCase(
        name: 'error when json is null',
        input: null,
        expected:
            'Coordinates must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'error when json is not a map',
        input: 'not a map',
        expected:
            'Coordinates must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'error when json does not contain "latitude" key',
        input: {"longitude": 56.78},
        expected: 'Coordinates must contain "latitude" and "longitude" keys',
      ),
      TestCase(
        name: 'error when json does not contain "longitude" key',
        input: {"latitude": 12.34},
        expected: 'Coordinates must contain "latitude" and "longitude" keys',
      ),
      TestCase(
        name: 'error when "latitude" value is null',
        input: {"latitude": null, "longitude": 56.78},
        expected: 'Coordinates must contain "latitude" and "longitude"',
      ),
      TestCase(
        name: 'error when "longitude" value is null',
        input: {"latitude": 12.34, "longitude": null},
        expected: 'Coordinates must contain "latitude" and "longitude"',
      ),
      TestCase(
        name: 'error when "longitude" is not a double',
        input: {"latitude": 12.34, "longitude": "Not double"},
        expected: 'Coordinates "latitude" and "longitude" must be numbers',
      ),
      TestCase(
        name: 'error when "latitude" is not a double',
        input: {"latitude": "Not double", "longitude": 56.78},
        expected: 'Coordinates "latitude" and "longitude" must be numbers',
      ),
    ].runTestCases((testCase) {
      expect(
        () => coordinatesParser.parse(testCase.input),
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
