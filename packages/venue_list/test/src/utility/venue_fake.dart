import 'package:mocktail/mocktail.dart';
import 'package:venue_entity/venue_entity.dart';

class VenueFake extends Fake implements Venue {
  @override
  String get id => 'v1';

  @override
  String get name => 'Sunset Beach';

  @override
  String get location => 'Dubai Marina';

  @override
  List<VenueImage> get images => [
    VenueImage(url: 'https://example.com/1.jpg'),
    VenueImage(url: 'https://example.com/2.jpg'),
  ];

  @override
  String get city => 'Dubai';

  @override
  String get type => 'Beach';

  @override
  Coordinates get coordinates =>
      Coordinates(latitude: 21.2341, longitude: 53.1234);

  @override
  List<Category> get categories => [];

  @override
  Map<String, OpeningHours> get openingHours => {
    'Monday': OpeningHours(open: "8:00", close: "21:00"),
  };

  @override
  bool get accessibleForGuestPass => true;

  @override
  List<String> get overviewText => [];

  @override
  List<ThingToDo> get thingsToDo => [
    ThingToDo(title: 'Surfing', description: 'Enjoy surfing at the beach.'),
  ];
}