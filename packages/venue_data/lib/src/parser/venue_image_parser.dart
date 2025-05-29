import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/venue_image_dto.dart' show VenueImageDto;
import 'package:venue_data/src/utility/safe.dart' show safeCast;

abstract class VenueImageParser {
  VenueImageDto? parse(dynamic json);
}

@immutable
@injectable
class VenueImageParserImplementation implements VenueImageParser {
  @override
  VenueImageDto? parse(dynamic json) {
    final image = safeCast<Map<dynamic, dynamic>>(json);
    if (image == null) {
      throw ArgumentError(
        'VenueImage must be a Map with String keys and String values',
      );
    }

    if (!image.containsKey('url')) {
      throw ArgumentError('VenueImage must contain a "url" key');
    }

    final url = image['url'];
    if (url == null) {
      throw ArgumentError('VenueImage url cannot be null');
    }

    if (url.isEmpty == true) {
      throw ArgumentError('VenueImage url cannot be empty');
    }

    return VenueImageDto(url: url);
  }
}
