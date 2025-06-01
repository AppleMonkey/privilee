import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/mapper/opening_hours_mapper.dart';
import 'package:venue_data/src/model/opening_hours_dto.dart';
import 'package:venue_domain/venue_domain.dart' show OpeningHours;

import '../parametarized_test_utility/parametarized_test.dart';

void main() {
  final openingHoursMapper = OpeningHoursMapperImplementation();

  group('OpeningHoursMapper should return ', () {
    test('valid OpeningHoursDto when mapEntry is called with valid input', () {
      final input = OpeningHoursDto(open: "08:00", close: "20:00");
      final expected = OpeningHours(open: "08:00", close: "20:00");

      final actual = openingHoursMapper.mapEntry(openingHours: input);
      expect(actual, expected);
    });
  });

  group('OpeningHoursMapper should throw an error ', () {
    [
      TestCase(
        name: 'when mapEntry is called with open time empty',
        input: OpeningHoursDto(open: "", close: "20:00"),
        expected: 'open and close times cannot be empty',
      ),
      TestCase(
        name: 'when mapEntry is called with close time empty',
        input: OpeningHoursDto(open: "08:00", close: ""),
        expected: 'open and close times cannot be empty',
      ),
      TestCase(
        name: 'when mapEntry is called with open time not in HH:mm format',
        input: OpeningHoursDto(open: "8:00", close: "20:00"),
        expected: 'open and close times must be in HH:mm format',
      ),
      TestCase(
        name: 'when mapEntry is called with close time is not in HH:mm format',
        input: OpeningHoursDto(open: "08:00", close: "20"),
        expected: 'open and close times must be in HH:mm format',
      ),
      TestCase(
        name: 'when mapEntry is called with open and close times are the same',
        input: OpeningHoursDto(open: "08:00", close: "08:00"),
        expected: 'open and close times cannot be the same',
      ),
      TestCase(
        name: 'when mapEntry is called with open time is after close time',
        input: OpeningHoursDto(open: "20:00", close: "08:00"),
        expected: 'open time cannot be after close time',
      ),
    ].runTestCases((testCase) {
      expect(
        () => openingHoursMapper.mapEntry(openingHours: testCase.input),
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

  group('OpeningHoursMapper.map should return ', () {
    [
      TestCase(
        name: 'when map is called with empty map when input is empty',
        input: <String, OpeningHoursDto>{},
        expected: <String, OpeningHours>{},
      ),
      TestCase(
        name: 'when map is called with valid entries when input is valid',
        input: {
          "Monday": OpeningHoursDto(open: "08:00", close: "20:00"),
          "Tuesday": OpeningHoursDto(open: "09:00", close: "21:00"),
        },
        expected: {
          "Monday": OpeningHours(open: "08:00", close: "20:00"),
          "Tuesday": OpeningHours(open: "09:00", close: "21:00"),
        },
      ),
      TestCase(
        name: 'Only valid entries when map is called with some invalid entries',
        input: {
          "Monday": OpeningHoursDto(open: "08:00", close: "20:00"),
          "Tuesday": OpeningHoursDto(open: "09:00", close: "21:00"),
          "Invalid": OpeningHoursDto(open: "", close: "22:00"), // Invalid entry
        },
        expected: {
          "Monday": OpeningHours(open: "08:00", close: "20:00"),
          "Tuesday": OpeningHours(open: "09:00", close: "21:00"),
        },
      ),
    ].runTestCases((testCase) {
      final actual = openingHoursMapper.map(openingHoursList: testCase.input);
      expect(actual, testCase.expected);
    });
  });
}
