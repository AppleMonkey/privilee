import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:venue_domain/venue_domain.dart';

class MockVenueRepository extends Mock implements VenueRepository {}

void main() {
  late MockVenueRepository repository;
  late GetAllVenuesUseCaseImplementation useCase;

  setUp(() {
    repository = MockVenueRepository();
    useCase = GetAllVenuesUseCaseImplementation(repository);
  });

  test('should return list of venues from repository', () async {
    final venues = [
      Venue(
        id: '1',
        name: 'Venue 1',
        city: 'City A',
        type: 'Gym',
        location: 'Loc A',
        accessibleForGuestPass: true,
        overviewText: ['Overview'],
        coordinates: Coordinates(latitude: 0.0, longitude: 0.0),
        images: [],
        categories: [],
        openingHours: {},
        thingsToDo: [],
      ),
    ];

    when(() => repository.getVenues()).thenAnswer((_) async => venues);

    final result = await useCase();

    expect(result, venues);
    verify(() => repository.getVenues()).called(1);
  });
}
