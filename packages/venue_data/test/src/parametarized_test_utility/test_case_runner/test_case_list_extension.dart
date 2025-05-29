import 'package:flutter_test/flutter_test.dart';

import '../model/test_case.dart';

extension TestCaseListExtension on List<TestCase> {

  void runTestCases(Function(dynamic) testFunction) {
    for (final testCase in this) {
      test(testCase.name, () {
        testFunction(testCase);
      });
    }
  }
}