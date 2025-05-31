import 'package:venue_entity/venue_entity.dart';

abstract class VenueListState {}

class InitialState extends VenueListState {}

class LoadingState extends VenueListState {}

class LoadedState extends VenueListState {
  final List<Venue> venues;
  LoadedState(this.venues);
}

class ErrorState extends VenueListState {
  final String message;
  ErrorState(this.message);
}
