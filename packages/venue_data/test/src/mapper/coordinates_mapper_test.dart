import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/mapper/category_mapper.dart';
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_domain/venue_domain.dart' show Category;

void main() {
  final categoryMapper = CategoryMapperImplementation();
  test(
    'CategoryMapper should return valid Category when CategoryDto is valid',
    () {
      final dto = CategoryDto(name: 'Test Category');
      final expected = Category(name: 'Test Category');

      final actual = categoryMapper.map(category: dto);

      expect(actual, expected);
    },
  );
}
