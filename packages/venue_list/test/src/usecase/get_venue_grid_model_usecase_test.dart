import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:venue_domain/venue_domain.dart';
import 'package:venue_entity/venue_entity.dart';
import 'package:venue_list/src/display_model/venue_display_model.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';
import 'package:venue_list/src/display_mapper/venue_grid_mapper.dart';
import 'package:venue_list/src/usecase/get_venue_grid_model_usecase.dart';

class MockGetAllVenuesUseCase extends Mock implements GetAllVenuesUseCase {}

class MockVenueGridMapper extends Mock implements VenueGridMapper {}

void main() {
  late GetVenueGridModelUseCaseImpl useCase;
  late MockGetAllVenuesUseCase mockGetAllVenues;
  late MockVenueGridMapper mockMapper;

  setUp(() {
    mockGetAllVenues = MockGetAllVenuesUseCase();
    mockMapper = MockVenueGridMapper();
    useCase = GetVenueGridModelUseCaseImpl(
      getAllVenuesUseCase: mockGetAllVenues,
      venueGridMapper: mockMapper,
    );
  });

  test('should return VenueGridDisplayModel from mapped venues', () async {
    final expected = VenueGridDisplayModel(
      items: [
        VenueCardDisplayModel(
          name: 'name',
          location: 'location',
          imageUrl: ['https://example.com/image.jpg'],
        ),
      ],
      title: '1 Gyms',
    );

    when(() => mockGetAllVenues()).thenAnswer((_) async => []);
    when(() => mockMapper([])).thenReturn(expected);

    final result = await useCase();

    expect(result, expected);
    verify(() => mockGetAllVenues()).called(1);
    verify(() => mockMapper([])).called(1);
  });
}
