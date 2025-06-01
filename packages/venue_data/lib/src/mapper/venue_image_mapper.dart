import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/venue_image_dto.dart';
import 'package:venue_domain/venue_domain.dart' show VenueImage;

@immutable
abstract class VenueImageMapper {
  VenueImage map({required VenueImageDto image});
  List<VenueImage> mapList({required List<VenueImageDto> images});
}

@LazySingleton(as: VenueImageMapper)
class VenueImageMapperImplementation implements VenueImageMapper {
  @override
  VenueImage map({required VenueImageDto image}) => VenueImage(url: image.url);

  @override
  List<VenueImage> mapList({required List<VenueImageDto> images}) =>
      images.map((image) => map(image: image)).toList();
}
