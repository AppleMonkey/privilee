import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_data/src/model/thing_to_do_dto.dart';
import 'package:venue_data/src/model/venue_dto.dart';
import 'package:venue_data/src/model/venue_image_dto.dart';
import 'package:venue_data/src/parser/category_parser.dart';
import 'package:venue_data/src/parser/coordinates_parser.dart';
import 'package:venue_data/src/parser/opening_hours_parser.dart';
import 'package:venue_data/src/parser/thing_to_do_parser.dart';
import 'package:venue_data/src/parser/venue_image_parser.dart';
import 'package:venue_data/src/utility/safe.dart';

abstract class VenueParser {
  VenueDto parse(dynamic json);
}

@immutable
@injectable
class VenueParserImplementation implements VenueParser {
  final CoordinatesParser _coordinatesParser;
  final VenueImageParser _venueImageParser;
  final CategoryParser _categoryParser;
  final OpeningHoursParser _openingHoursParser;
  final ThingToDoParser _thingToDoParser;

  const VenueParserImplementation({
    required CoordinatesParser coordinatesParser,
    required VenueImageParser venueImageParser,
    required CategoryParser categoryParser,
    required OpeningHoursParser openingHoursParser,
    required ThingToDoParser thingToDoParser,
  }) : _coordinatesParser = coordinatesParser,
       _venueImageParser = venueImageParser,
       _categoryParser = categoryParser,
       _openingHoursParser = openingHoursParser,
       _thingToDoParser = thingToDoParser;

  @override
  VenueDto parse(dynamic json) {
    final map = safeCast<Map<String, dynamic>>(json);

    if (map == null) {
      throw ArgumentError(
        'Venue must be a Map with String keys and dynamic values',
      );
    }

    if (map.isEmpty) {
      throw ArgumentError('Venue cannot be empty');
    }

    final id = safeCast<String>(map['id']);
    if (id == null || id.isEmpty) {
      throw ArgumentError('Venue id cannot be null or empty');
    }

    final name = safeCast<String>(map['name']);
    if (name == null || name.isEmpty) {
      throw ArgumentError('Venue name cannot be null or empty');
    }

    final city = safeCast<String>(map['city']);
    if (city == null || city.isEmpty) {
      throw ArgumentError('Venue city cannot be null or empty');
    }

    final type = safeCast<String>(map['type']);
    if (type == null || type.isEmpty) {
      throw ArgumentError('Venue type cannot be null or empty');
    }

    final location = safeCast<String>(map['location']);
    if (location == null || location.isEmpty) {
      throw ArgumentError('Venue location cannot be null or empty');
    }

    final accessibleForGuestPass = safeCast<bool>(
      map['accessibleForGuestPass'],
    );
    if (accessibleForGuestPass == null) {
      throw ArgumentError('Venue accessibleForGuestPass cannot be null');
    }

    final overviewTextList = safeCast<List<dynamic>>(map['overviewText']);
    if (overviewTextList == null || overviewTextList.isEmpty) {
      throw ArgumentError('Venue overviewText cannot be null or empty');
    }

    final overviewText =
        overviewTextList
            .map((text) => safeCast<String>(text))
            .whereType<String>()
            .toList();

    final coordinates = _coordinatesParser.parse(map['coordinates']);
    if (coordinates == null) {
      throw ArgumentError('Venue coordinates cannot be null');
    }

    final images =
        safeCast<List<dynamic>>(map['images'])
            ?.map((image) => _venueImageParser.parse(image))
            .whereType<VenueImageDto>()
            .toList() ??
        [];

    final categories =
        safeCast<List<dynamic>>(map['categories'])
            ?.map((category) => _categoryParser.parse(category))
            .whereType<CategoryDto>()
            .toList() ??
        [];

    final openingHours = _openingHoursParser.parse(map['openingHours']);

    final thingsToDo =
        safeCast<List<dynamic>>(map['thingsToDo'])
            ?.map((thing) => _thingToDoParser.parse(thing))
            .whereType<ThingToDoDto>()
            .toList() ??
        [];

    return VenueDto(
      id: id,
      name: name,
      city: city,
      type: type,
      coordinates: coordinates,
      location: location,
      images: images,
      categories: categories,
      openingHours: openingHours,
      accessibleForGuestPass: accessibleForGuestPass,
      overviewText: overviewText,
      thingsToDo: thingsToDo,
    );
  }
}
