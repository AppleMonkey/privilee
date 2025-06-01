import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/mapper/category_mapper.dart';
import 'package:venue_data/src/mapper/coordinates_mapper.dart';
import 'package:venue_data/src/mapper/opening_hours_mapper.dart';
import 'package:venue_data/src/mapper/thing_to_do_mapper.dart';
import 'package:venue_data/src/mapper/venue_image_mapper.dart';
import 'package:venue_data/src/model/venue_dto.dart';
import 'package:venue_domain/venue_domain.dart' show Venue;


@immutable
abstract class VenueMapper {
  Venue map({required VenueDto venue});
}

@LazySingleton(as: VenueMapper)
class VenueMapperImplementation implements VenueMapper {
  final CoordinatesMapper _coordinatesMapper;
  final VenueImageMapper _venueImageMapper;
  final CategoryMapper _categoryMapper;
  final OpeningHoursMapper _openingHoursMapper;
  final ThingToDoMapper _thingToDoMapper;

  const VenueMapperImplementation({
    required CoordinatesMapper coordinatesMapper,
    required VenueImageMapper venueImageMapper,
    required CategoryMapper categoryMapper,
    required OpeningHoursMapper openingHoursMapper,
    required ThingToDoMapper thingToDoMapper,
  }) : _coordinatesMapper = coordinatesMapper,
       _venueImageMapper = venueImageMapper,
       _categoryMapper = categoryMapper,
       _openingHoursMapper = openingHoursMapper,
       _thingToDoMapper = thingToDoMapper;

  @override
  Venue map({required VenueDto venue}) => Venue(
    id: venue.id,
    name: venue.name,
    city: venue.city,
    type: venue.type,
    location: venue.location,
    accessibleForGuestPass: venue.accessibleForGuestPass,
    overviewText: venue.overviewText,
    coordinates: _coordinatesMapper.map(coordinates: venue.coordinates),
    images: _venueImageMapper.mapList(images: venue.images),
    categories:_categoryMapper.mapList(categories: venue.categories),
    openingHours: _openingHoursMapper.map(openingHoursList: venue.openingHours),
    thingsToDo: _thingToDoMapper.mapList(things: venue.thingsToDo),
  );
}
