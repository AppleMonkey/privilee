import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/category_dto.dart' show CategoryDto;
import 'package:venue_entity/venue_entity.dart' show Category;

abstract class CategoryMapper {
  Category map({required CategoryDto category});
  List<Category> mapList({required List<CategoryDto> categories});
}

@immutable
@injectable
class CategoryMapperImplementation implements CategoryMapper {
  @override
  Category map({required CategoryDto category}) =>
      Category(name: category.name);

  @override
  List<Category> mapList({required List<CategoryDto> categories}) =>
      categories.map((category) => map(category: category)).toList();
}
