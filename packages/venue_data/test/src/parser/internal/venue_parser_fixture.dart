part of '../venue_parser_test.dart';

Future<Map<String, dynamic>> loadFixture(String filename) async {
  final file = File('test/src/parser/internal/json/$filename.json');
  final contents = await file.readAsString();
  return json.decode(contents);
}

Future<dynamic> buildValidVenueJson() async => await loadFixture('venue_valid');

VenueDto buildValidVenueDto() => VenueDto(
  id: '123',
  name: 'Test Venue',
  city: 'Test City',
  type: 'Test Type',
  location: 'Test Location',
  accessibleForGuestPass: true,
  overviewText: ['This is a test venue.', 'It has many features.'],
  coordinates: CoordinatesDto(latitude: 0.0, longitude: 0.0),
  images: [
    VenueImageDto(url: 'https://example.com/image1.jpg'),
    VenueImageDto(url: 'https://example.com/image2.jpg'),
  ],
  categories: [
    CategoryDto(name: 'Category 1'),
    CategoryDto(name: 'Category 2'),
  ],
  openingHours: {"Monday": OpeningHoursDto(open: '08:00', close: '20:00')},
  thingsToDo: [
    ThingToDoDto(title: 'Thing 1', description: 'Description 1'),
    ThingToDoDto(title: 'Thing 2', description: 'Description 2'),
  ],
);
