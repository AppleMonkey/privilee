import 'package:meta/meta.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';

@immutable
abstract class VenueListState {}

class InitialState extends VenueListState {}

class LoadingState extends VenueListState {}

class LoadedState extends VenueListState {
  final VenueGridDisplayModel venueGrid;
  LoadedState(this.venueGrid);
}

class ErrorState extends VenueListState {
  final String message;
  ErrorState(this.message);
}
