import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/datasource/remote_data_source.dart';
import 'package:venue_data/src/mapper/venue_mapper.dart';
import 'package:venue_data/src/parser/venue_parser.dart';
import 'package:venue_data/src/utility/safe.dart';
import 'package:venue_domain/venue_domain.dart' show VenueRepository;
import 'package:venue_entity/venue_entity.dart';
import 'package:collection/collection.dart';

@immutable
@injectable
class VenueRepositoryImplementation implements VenueRepository {
  final VenueRemoteDataSource _remoteDataSource;
  final VenueParser _parser;
  final VenueMapper _mapper;

  const VenueRepositoryImplementation({
    required VenueRemoteDataSource remoteDataSource,
    required VenueParser parser,
    required VenueMapper mapper,
  }) : _remoteDataSource = remoteDataSource,
       _parser = parser,
       _mapper = mapper;

  @override
  Future<List<Venue>> getVenues() async {
    final rawJsonList = await _remoteDataSource.fetchVenues();

    final venueDtos =
        rawJsonList
            .map((json) => safeCast<Map<String, dynamic>>(json))
            .map((jsonMap) => _parser.parse(jsonMap))
            .toList();

    return venueDtos.map((dto) => _mapper.map(venue: dto)).toList();
  }

  @override
  Future<Venue?> getVenueById(String id) async {
    final venues = await getVenues();
    return venues.firstWhereOrNull((venue) => venue.id == id);
  }
}
