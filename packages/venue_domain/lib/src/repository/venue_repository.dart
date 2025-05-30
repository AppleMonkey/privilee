import 'package:venue_entity/venue_entity.dart';

abstract class VenueRepository {
  Future<List<Venue>> getVenues();
  Future<Venue?> getVenueById(String id);
}
