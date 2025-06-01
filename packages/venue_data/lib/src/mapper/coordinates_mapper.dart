import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/coordinates_dto.dart';
import 'package:venue_domain/venue_domain.dart' show Coordinates;

@immutable
abstract class CoordinatesMapper {
  Coordinates map({required CoordinatesDto coordinates});
}

@LazySingleton(as: CoordinatesMapper)
class CoordinatesMapperImplementation implements CoordinatesMapper {
  @override
  Coordinates map({required CoordinatesDto coordinates}) {
    return Coordinates(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
    );
  }
}
