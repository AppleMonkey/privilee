import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:venue_domain/venue_domain.dart';

import 'venue_list_event.dart';
import 'venue_list_state.dart';

@injectable
class VenueListBloc extends Bloc<VenueListEvent, VenueListState> {
  final GetAllVenuesUseCase _getAllVenues;

  VenueListBloc(this._getAllVenues) : super(InitialState()) {
    on<LoadVenuesEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final venues = await _getAllVenues();
        emit(LoadedState(venues));
      } catch (_) {
        emit(ErrorState("Failed to load venues"));
      }
    });
  }
}
