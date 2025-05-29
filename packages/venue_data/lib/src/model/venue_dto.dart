import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_data/src/model/coordinates_dto.dart';
import 'package:venue_data/src/model/opening_hours_dto.dart';
import 'package:venue_data/src/model/thing_to_do_dto.dart';
import 'package:venue_data/src/model/venue_image_dto.dart';

@immutable
class VenueDto extends Equatable {
  final String id;
  final String name;
  final String city;
  final String type;
  final CoordinatesDto coordinates;
  final String location;
  final List<VenueImageDto> images;
  final List<CategoryDto> categories;
  final Map<String, OpeningHoursDto> openingHours;
  final bool accessibleForGuestPass;
  final List<String> overviewText;
  final List<ThingToDoDto> thingsToDo;

  const VenueDto({
    required this.categories,
    required this.openingHours,
    required this.accessibleForGuestPass,
    required this.overviewText,
    required this.thingsToDo,
    required this.images,
    required this.id,
    required this.name,
    required this.city,
    required this.type,
    required this.location,
    required this.coordinates,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    city,
    type,
    coordinates,
    location,
    images,
    categories,
    openingHours,
    accessibleForGuestPass,
    overviewText,
    thingsToDo,
  ];
}
