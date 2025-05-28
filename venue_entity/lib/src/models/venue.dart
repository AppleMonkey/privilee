import 'category.dart';
import 'coordinates.dart';
import 'thing_to_do.dart';
import 'venue_image.dart';
import 'opening_hours.dart';

class Venue {
  final String id;
  final String name;
  final String city;
  final String type;
  final Coordinates coordinates;
  final String location;
  final List<VenueImage> images;
  final List<Category> categories;
  final Map<String, OpeningHours> openingHours;
  final bool accessibleForGuestPass;
  final List<String> overviewText;
  final List<ThingToDo> thingsToDo;

  Venue({
    required this.id,
    required this.name,
    required this.city,
    required this.type,
    required this.coordinates,
    required this.location,
    required this.images,
    required this.categories,
    required this.openingHours,
    required this.accessibleForGuestPass,
    required this.overviewText,
    required this.thingsToDo,
  });
}
