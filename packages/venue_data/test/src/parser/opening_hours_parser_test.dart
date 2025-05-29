import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/opening_hours_dto.dart';
import 'package:venue_data/src/parser/opening_hours_parser.dart';

import '../parametarized_test_utility/parametarized_test.dart';

void main() {
  final openingHoursParser = OpeningHoursParserImplementation();

  group('OpeningHoursMapper should return ', () {
    [
      TestCase(
        name: 'valid OpeningHoursDto when parse is called with valid input',
        input: {
          "sunday": {'open': '08:00', 'close': '20:00'},
        },
        expected: {"sunday": OpeningHoursDto(open: '08:00', close: '20:00')},
      ),
      TestCase(
        name:
            'valid OpeningHoursDto when parse is called with multiple entries',
        input: {
          "monday": {'open': '08:00', 'close': '20:00'},
          "tuesday": {'open': '09:00', 'close': '21:00'},
        },
        expected: {
          "monday": OpeningHoursDto(open: '08:00', close: '20:00'),
          "tuesday": OpeningHoursDto(open: '09:00', close: '21:00'),
        },
      ),
    ].runTestCases((testCase) {
      final actual = openingHoursParser.parse(testCase.input);
      expect(actual, testCase.expected);
    });
  });

  group('OpeningHoursMapper should throw an error ', () {
    [
      TestCase(
        name: 'when parse is called with null input',
        input: null,
        expected: 'OpeningHours must be a Map with String keys and Map<String, String> values',
      ),
      TestCase(
        name: 'when parse is called with empty input',
        input: {},
        expected: 'OpeningHours cannot be empty',
      ),
      TestCase(
        name: 'when parse is called with non-String key',
        input: {1: {'open': '08:00', 'close': '20:00'}},
        expected: 'OpeningHours keys must be Strings',
      ),
      TestCase(
        name: 'when parse is called with non-Map value',
        input: {'sunday': '08:00 - 20:00'},
        expected: 'OpeningHours values must be Map<String, String>',
      ),
      TestCase(
        name: 'when parse is called with missing open time',
        input: {'sunday': {'close': '20:00'}},
        expected:
            'OpeningHours for "sunday" must include both "open" and "close" strings',
      ),
      TestCase(
        name: 'when parse is called with missing close time',
        input: {'sunday': {'open': '08:00'}},
        expected:
            'OpeningHours for "sunday" must include both "open" and "close" strings',
      ),
    ].runTestCases((testCase) {
      expect(
        () => openingHoursParser.parse(testCase.input),
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', testCase.expected)),
      );
    });
  });
}
