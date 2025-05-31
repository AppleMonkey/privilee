import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:venue_list/src/bloc/venue_list_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_event.dart';
import 'package:venue_list/src/bloc/venue_list_state.dart';
import 'package:venue_domain/venue_domain.dart';
import 'package:venue_entity/venue_entity.dart';

class MockGetAllVenues extends Mock implements GetAllVenuesUseCase {}

void main() {
  late VenueListBloc bloc;
  late MockGetAllVenues mockGetAllVenues;

  setUp(() {
    mockGetAllVenues = MockGetAllVenues();
    bloc = VenueListBloc(mockGetAllVenues);
  });

  tearDown(() {
    bloc.close();
  });

  final testVenues = [
    Venue(
      id: '1',
      name: 'Test Gym',
      city: 'Dubai',
      type: 'Gym',
      location: 'Downtown',
      accessibleForGuestPass: true,
      overviewText: ['Good gym'],
      coordinates: Coordinates(latitude: 25.2, longitude: 55.3),
      images: [],
      categories: [],
      openingHours: {},
      thingsToDo: [],
    ),
  ];

  blocTest<VenueListBloc, VenueListState>(
    'emits [LoadingState, LoadedState] when LoadVenuesEvent succeeds',
    build: () {
      when(() => mockGetAllVenues()).thenAnswer((_) async => testVenues);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadVenuesEvent()),
    expect:
        () => [
          isA<LoadingState>(),
          isA<LoadedState>().having((s) => s.venues, 'venues', testVenues),
        ],
    verify: (_) {
      verify(() => mockGetAllVenues()).called(1);
    },
  );

  blocTest<VenueListBloc, VenueListState>(
    'emits [LoadingState, ErrorState] when LoadVenuesEvent fails',
    build: () {
      when(() => mockGetAllVenues()).thenThrow(Exception('error'));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadVenuesEvent()),
    expect: () => [isA<LoadingState>(), isA<ErrorState>()],
  );
}
