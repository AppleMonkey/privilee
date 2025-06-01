import 'package:meta/meta.dart' show immutable;
import 'package:venue_domain/src/model/venue.dart';

@immutable
abstract class VenueRepository {
  Future<List<Venue>> getVenues();
  Future<Venue?> getVenueById(String id);
}
