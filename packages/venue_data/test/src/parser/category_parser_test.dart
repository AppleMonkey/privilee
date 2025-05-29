import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/category_dto.dart' show CategoryDto;
import 'package:venue_data/src/parser/category_parser.dart';

import '../parametarized_test_utility/model/test_case.dart';
import '../parametarized_test_utility/test_case_runner/test_case_list_extension.dart';

void main() {
  final categoryParser = CategoryParserImplementation();

  group('CategoryParser should return ', () {
    [
      TestCase(
        name: 'valid dto when json is valid',
        input: {"name": "Test Category"},
        expected: CategoryDto(name: 'Test Category'),
      ),
      TestCase(
        name: 'valid dto when json is valid with extra fields',
        input: {"name": "Test Category", "extraField": "value"},
        expected: CategoryDto(name: 'Test Category'),
      ),
    ].runTestCases((testCase) {
      final actual = categoryParser.parse(testCase.input);
      expect(actual, testCase.expected);
    });
  });

  group('CategoryParser should throw', () {
    [
      TestCase(name: 'error when json is null', input: null, expected: null),
      TestCase(
        name: 'error when json is not a map',
        input: 'not a map',
        expected: null,
      ),
      TestCase(
        name: 'error when json does not contain "name" key',
        input: {"otherKey": "value"},
        expected: null,
      ),
      TestCase(
        name: 'error when "name" value is null',
        input: {"name": null},
        expected: null,
      ),
      TestCase(
        name: 'error when "name" value is empty',
        input: {"name": ""},
        expected: null,
      ),
    ].runTestCases((testCase) {
      expect(
        () => categoryParser.parse(testCase.input),
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
