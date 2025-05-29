import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/mapper/category_mapper.dart';
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_entity/venue_entity.dart' show Category;

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

  test('list of Categories when list of CategoryDto is valid', () {
    final dtoList = [
      CategoryDto(name: 'Category 1'),
      CategoryDto(name: 'Category 2'),
    ];
    final expectedList = [
      Category(name: 'Category 1'),
      Category(name: 'Category 2'),
    ];

    final actualList = categoryMapper.mapList(categories: dtoList);

    expect(actualList, expectedList);
  });
}
