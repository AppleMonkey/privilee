import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:venue_domain/venue_domain.dart';
import 'package:venue_list/src/display_mapper/venue_grid_mapper.dart';
import 'package:venue_list/src/display_model/venue_grid_display_model.dart';

@immutable
abstract class GetVenueGridModelUseCase {
  Future<VenueGridDisplayModel> call();
}

@Injectable(as: GetVenueGridModelUseCase)
class GetVenueGridModelUseCaseImpl implements GetVenueGridModelUseCase {
  final GetAllVenuesUseCase _getAllVenuesUseCase;
  final VenueGridMapper _venueGridMapper;

  const GetVenueGridModelUseCaseImpl({
    required GetAllVenuesUseCase getAllVenuesUseCase,
    required VenueGridMapper venueGridMapper,
  }) : _getAllVenuesUseCase = getAllVenuesUseCase,
       _venueGridMapper = venueGridMapper;

  @override
  Future<VenueGridDisplayModel> call() async {
    final venues = await _getAllVenuesUseCase();
    final displayModel = _venueGridMapper(venues);
    return displayModel;
  }
}
