import 'package:injectable/injectable.dart';
import 'package:venue_entity/venue_entity.dart';
import 'package:venue_list/src/display_model/venue_display_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VenueCardMapper {
  VenueCardDisplayModel call(Venue venue);
}

@Injectable(as: VenueCardMapper)
class VenueCardMapperImpl implements VenueCardMapper {
  @override
  VenueCardDisplayModel call(Venue venue) => VenueCardDisplayModel(
    name: venue.name,
    location: venue.location,
    imageUrl: venue.images.map((image) => image.url).toList(),
  );
}
