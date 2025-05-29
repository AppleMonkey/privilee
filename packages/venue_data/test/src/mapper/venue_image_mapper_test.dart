import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/mapper/venue_image_mapper.dart';
import 'package:venue_data/src/model/venue_image_dto.dart';
import 'package:venue_entity/venue_entity.dart' show VenueImage;

void main() {
  final venueImaveMapper = VenueImageMapperImplementation();

  test(
    'VenueImageMapper should return valid VenueImage when VenueImageDto is valid',
    () {
      final dto = VenueImageDto(url: 'https://example.com/image.jpg');
      final expected = VenueImage(url: 'https://example.com/image.jpg');

      final actual = venueImaveMapper.map(image: dto);

      expect(actual, expected);
    },
  );
}
