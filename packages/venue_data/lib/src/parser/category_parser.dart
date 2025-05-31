import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/category_dto.dart';
import 'package:venue_data/src/utility/safe.dart';

@immutable
abstract class CategoryParser {
  CategoryDto? parse(dynamic json);
}

@LazySingleton(as: CategoryParser)
class CategoryParserImplementation implements CategoryParser {
  @override
  CategoryDto? parse(dynamic json) {
    final categoryMap = safeCast<Map<dynamic, dynamic>>(json);

    if (categoryMap == null) {
      throw ArgumentError(
        'Category must be a Map with String keys and String values',
      );
    }

    if (!categoryMap.containsKey('name')) {
      throw ArgumentError('Category must contain a "name" key');
    }

    final category = categoryMap['name'];

    if (category == null) {
      throw ArgumentError('Category name cannot be null');
    }

    if (category.isEmpty == true) {
      throw ArgumentError('Category name cannot be empty');
    }

    return CategoryDto(name: category);
  }
}
