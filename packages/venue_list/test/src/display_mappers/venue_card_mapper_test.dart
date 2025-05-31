import 'package:flutter_test/flutter_test.dart';
import 'package:venue_entity/venue_entity.dart';
import 'package:venue_list/src/display_mapper/venue_card_mapper.dart';

void main() {
  late VenueCardMapperImpl mapper;

  setUp(() {
    mapper = VenueCardMapperImpl();
  });

  test('should map Venue to VenueCardDisplayModel correctly', () {
    final venue = Venue(
      id: 'v1',
      name: 'Sunset Beach',
      location: 'Dubai Marina',
      images: [
        VenueImage(url: 'https://example.com/1.jpg'),
        VenueImage(url: 'https://example.com/2.jpg'),
      ],
      city: 'Dubai',
      type: 'Beach',
      coordinates: Coordinates(latitude: 21.2341, longitude: 53.1234),
      categories: [],
      openingHours: {'Monday': OpeningHours(open: "8:00", close: "21:00")},
      accessibleForGuestPass: true,
      overviewText: [],
      thingsToDo: [
        ThingToDo(title: 'Surfing', description: 'Enjoy surfing at the beach.'),
      ],
    );

    final result = mapper(venue);

    expect(result.name, 'Sunset Beach');
    expect(result.location, 'Dubai Marina');
    expect(result.imageUrl, [
      'https://example.com/1.jpg',
      'https://example.com/2.jpg',
    ]);
  });
}

class VenueCoordinates {}
