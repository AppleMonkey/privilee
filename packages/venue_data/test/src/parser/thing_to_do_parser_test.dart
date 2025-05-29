import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/model/thing_to_do_dto.dart';
import 'package:venue_data/src/parser/thing_to_do_parser.dart';

import '../parametarized_test_utility/model/test_case.dart';
import '../parametarized_test_utility/test_case_runner/test_case_list_extension.dart';

void main() {
  final thingToDoParser = ThingToDoParserImplementation();

  group('ThingToDoParser should return ', () {
    [
      TestCase(
        name: 'valid dto when json is valid',
        input: {"title": "title", "description": "description"},
        expected: ThingToDoDto(title: "title", description: "description"),
      ),
      TestCase(
        name: 'valid dto when json has extra fields',
        input: {
          "title": "title",
          "description": "description",
          "extraField": "value",
        },
        expected: ThingToDoDto(title: "title", description: "description"),
      ),
    ].runTestCases((testCase) {
      final actual = thingToDoParser.parse(testCase.input);
      expect(actual, testCase.expected);
    });
  });

  group('ThingToDoParser should throw', () {
    [
      TestCase(
        name: 'error when json is null',
        input: null,
        expected: 'ThingToDo must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'error when json is not a map',
        input: 'not a map',
        expected: 'ThingToDo must be a Map with String keys and dynamic values',
      ),
      TestCase(
        name: 'error when json does not contain "title" key',
        input: {"description": "description"},
        expected: 'ThingToDo must contain "title" key',
      ),
      TestCase(
        name: 'error when "title" value is null',
        input: {"title": null, "description": "description"},
        expected: 'ThingToDo title must be a non-empty String',
      ),
      TestCase(
        name: 'error when "title" value is empty',
        input: {"title": "", "description": "description"},
        expected: 'ThingToDo title must be a non-empty String',
      ),
      TestCase(
        name: 'error when "description" value is not a String',
        input: {"title": "title", "description": 123},
        expected: 'ThingToDo description must be a String or null',
      ),
    ].runTestCases((testCase) {
      expect(
        () => thingToDoParser.parse(testCase.input),
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
