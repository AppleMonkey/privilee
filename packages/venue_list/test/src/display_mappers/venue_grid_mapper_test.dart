import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:venue_list/src/display_mapper/venue_card_mapper.dart';
import 'package:venue_list/src/display_mapper/venue_grid_mapper.dart';
import 'package:venue_list/src/display_model/venue_display_model.dart';

import '../utility/venue_Fake.dart';

class MockVenueCardMapper extends Mock implements VenueCardMapper {}

void main() {
  late MockVenueCardMapper mockCardMapper;
  late VenueGridMapperImpl gridMapper;

  setUp(() {
    mockCardMapper = MockVenueCardMapper();
    gridMapper = VenueGridMapperImpl(venueCardMapper: mockCardMapper);
  });

  test('should map list of venues to VenueGridDisplayModel correctly', () {
    // Arrange
    final venues = [
      VenueFake(),
    ];

    final cardModels = [
      VenueCardDisplayModel(name: 'Gym A', location: 'Location A', imageUrl: []),
    ];

    when(() => mockCardMapper(venues[0])).thenReturn(cardModels[0]);

    // Act
    final result = gridMapper(venues);

    // Assert
    expect(result.title, '1 Gyms');
    expect(result.items, cardModels);
  });
}
