import 'package:venue_data/src/model/opening_hours_dto.dart';
import 'package:venue_data/src/utility/safe.dart';

abstract class OpeningHoursParser {
  Map<String, OpeningHoursDto> parse(dynamic json);
}

class OpeningHoursParserImplementation implements OpeningHoursParser {
  @override
  Map<String, OpeningHoursDto> parse(dynamic json) {
    final rawMap = safeCast<Map<dynamic, dynamic>>(json);

    if (rawMap == null) {
      throw ArgumentError(
        'OpeningHours must be a Map with String keys and Map<String, String> values',
      );
    }

    if (rawMap.isEmpty) {
      throw ArgumentError('OpeningHours cannot be empty');
    }

    final parsed = <String, OpeningHoursDto>{};

    for (final entry in rawMap.entries) {
      final key = entry.key;
      final value = entry.value;

      if (key is! String) {
        throw ArgumentError('OpeningHours keys must be Strings');
      }

      final valueMap = safeCast<Map<dynamic, dynamic>>(value);
      if (valueMap == null) {
        throw ArgumentError('OpeningHours values must be Map<String, String>');
      }

      final open = safeCast<String>(valueMap['open']);
      final close = safeCast<String>(valueMap['close']);

      if (open == null || close == null) {
        throw ArgumentError(
          'OpeningHours for "$key" must include both "open" and "close" strings',
        );
      }

      parsed[key] = OpeningHoursDto(open: open, close: close);
    }

    return parsed;
  }
}
