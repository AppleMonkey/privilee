import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/coordinates_dto.dart';

@immutable
abstract class CoordinatesParser {
  CoordinatesDto? parse(dynamic json);
}

@LazySingleton(as: CoordinatesParser)
class CoordinatesParserImplementation implements CoordinatesParser {
  @override
  CoordinatesDto? parse(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw ArgumentError(
        'Coordinates must be a Map with String keys and dynamic values',
      );
    }

    if (!json.containsKey('latitude') || !json.containsKey('longitude')) {
      throw ArgumentError(
        'Coordinates must contain "latitude" and "longitude" keys',
      );
    }

    final latitude = json['latitude'];
    final longitude = json['longitude'];

    if (latitude == null || longitude == null) {
      throw ArgumentError(
        'Coordinates must contain "latitude" and "longitude"',
      );
    }

    if (latitude is! double || longitude is! double) {
      throw ArgumentError(
        'Coordinates "latitude" and "longitude" must be numbers',
      );
    }

    return CoordinatesDto(latitude: latitude, longitude: longitude);
  }
}
