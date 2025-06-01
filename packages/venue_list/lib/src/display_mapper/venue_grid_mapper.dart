import 'package:injectable/injectable.dart' show Injectable;
import 'package:venue_domain/venue_domain.dart' show Venue;
import 'package:venue_list/src/display_mapper/venue_card_mapper.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';

abstract class VenueGridMapper {
  VenueGridDisplayModel call(List<Venue> venues);
}

@Injectable(as: VenueGridMapper)
class VenueGridMapperImpl implements VenueGridMapper {
  final VenueCardMapper _venueCardMapper;

  VenueGridMapperImpl({required VenueCardMapper venueCardMapper})
    : _venueCardMapper = venueCardMapper;

  @override
  VenueGridDisplayModel call(List<Venue> venues) {
    return VenueGridDisplayModel(
      title: '${venues.length} Gyms',
      items: venues.map((venue) => _venueCardMapper(venue)).toList(),
    );
  }
}
