import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:venue_domain/venue_domain.dart';
import 'package:venue_list/src/usecase/get_venue_grid_model_usecase.dart';

import 'venue_list_event.dart';
import 'venue_list_state.dart';

@injectable
class VenueListBloc extends Bloc<VenueListEvent, VenueListState> {
  final GetVenueGridModelUseCase _getVenueGridModelUseCase;

  VenueListBloc(this._getVenueGridModelUseCase) : super(InitialState()) {
    on<LoadVenuesEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final displayModel = await _getVenueGridModelUseCase();
        emit(LoadedState(displayModel));
      } catch (_) {
        emit(ErrorState("Failed to load venues"));
      }
    });
  }
}
