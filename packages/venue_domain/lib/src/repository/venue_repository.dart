import 'package:meta/meta.dart' show immutable;
import 'package:venue_entity/venue_entity.dart';

@immutable
abstract class VenueRepository {
  Future<List<Venue>> getVenues();
  Future<Venue?> getVenueById(String id);
}
