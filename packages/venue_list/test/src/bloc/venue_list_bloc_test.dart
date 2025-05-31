import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:venue_list/src/bloc/venue_list_bloc.dart';
import 'package:venue_list/src/bloc/venue_list_event.dart';
import 'package:venue_list/src/bloc/venue_list_state.dart';
import 'package:venue_list/src/display_model/venue_display_model.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';
import 'package:venue_list/src/usecase/get_venue_grid_model_usecase.dart';

class GetVenueGridModelUseCaseMock extends Mock implements GetVenueGridModelUseCase {}

void main() {
  late VenueListBloc bloc;
  late GetVenueGridModelUseCaseMock getVenueGridModelUseCaseMock;

  setUp(() {
    getVenueGridModelUseCaseMock = GetVenueGridModelUseCaseMock();
    bloc = VenueListBloc(getVenueGridModelUseCaseMock);
  });

  tearDown(() {
    bloc.close();
  });

  final displayModel = VenueGridDisplayModel(title: "hi", items: [
    
    VenueCardDisplayModel(
      name: 'Test Venue 1',
      imageUrl: ['https://example.com/image1.jpg'], location: 'Test Location 1',
    ),
  ]);

  blocTest<VenueListBloc, VenueListState>(
    'emits [LoadingState, LoadedState] when LoadVenuesEvent succeeds',
    build: () {
      when(() => getVenueGridModelUseCaseMock()).thenAnswer((_) async => displayModel);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadVenuesEvent()),
    expect:
        () => [
          isA<LoadingState>(),
          isA<LoadedState>().having((s) => s.venueGrid, 'venues', displayModel),
        ],
    verify: (_) {
      verify(() => getVenueGridModelUseCaseMock()).called(1);
    },
  );

  blocTest<VenueListBloc, VenueListState>(
    'emits [LoadingState, ErrorState] when LoadVenuesEvent fails',
    build: () {
      when(() => getVenueGridModelUseCaseMock()).thenThrow(Exception('error'));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadVenuesEvent()),
    expect: () => [isA<LoadingState>(), isA<ErrorState>()],
  );
}
