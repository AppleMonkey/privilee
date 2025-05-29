import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/coordinates_dto.dart';
import 'package:venue_entity/venue_entity.dart' show Coordinates;

abstract class CoordinatesMapper {
  Coordinates map({required CoordinatesDto coordinates});
}

@immutable
@injectable
class CoordinatesMapperImplementation implements CoordinatesMapper {
  @override
  Coordinates map({required CoordinatesDto coordinates}) {
    return Coordinates(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
    );
  }
}
