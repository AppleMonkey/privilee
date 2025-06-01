import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/opening_hours_dto.dart'
    show OpeningHoursDto;
import 'package:venue_domain/venue_domain.dart' show OpeningHours;

@immutable
abstract class OpeningHoursMapper {
  OpeningHours mapEntry({required OpeningHoursDto openingHours});
  Map<String, OpeningHours> map({
    required Map<String, OpeningHoursDto> openingHoursList,
  });
}

@LazySingleton(as: OpeningHoursMapper)
class OpeningHoursMapperImplementation implements OpeningHoursMapper {
  @override
  OpeningHours mapEntry({required OpeningHoursDto openingHours}) {
    if (openingHours.open.isEmpty || openingHours.close.isEmpty) {
      throw ArgumentError(
        'open and close times cannot be empty',
      );
    }

    if (!RegExp(r'^\d{2}:\d{2}$').hasMatch(openingHours.open) ||
        !RegExp(r'^\d{2}:\d{2}$').hasMatch(openingHours.close)) {
      throw ArgumentError(
        'open and close times must be in HH:mm format',
      );
    }

    if (openingHours.open == openingHours.close) {
      throw ArgumentError(
        'open and close times cannot be the same',
      );
    }

    if (openingHours.open.compareTo(openingHours.close) > 0) {
      throw ArgumentError(
        'open time cannot be after close time',
      );
    }

    return OpeningHours(open: openingHours.open, close: openingHours.close);
  }

  @override
  Map<String, OpeningHours> map({
    required Map<String, OpeningHoursDto> openingHoursList,
  }) {
    return Map.fromEntries(
      openingHoursList.entries.map((entry) {
        try {
          return MapEntry(entry.key, mapEntry(openingHours: entry.value));
        } catch (_) {
          return null;
        }
      }).whereType<MapEntry<String, OpeningHours>>(),
    );
  }
}
