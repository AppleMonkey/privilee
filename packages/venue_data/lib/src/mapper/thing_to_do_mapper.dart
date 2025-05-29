import 'package:injectable/injectable.dart' show injectable;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/thing_to_do_dto.dart' show ThingToDoDto;
import 'package:venue_entity/venue_entity.dart' show ThingToDo;

abstract class ThingToDoMapper {
  ThingToDo map({required ThingToDoDto thing});
  List<ThingToDo> mapList({required List<ThingToDoDto> things});
}

@immutable
@injectable
class ThingToDoMapperImplementation implements ThingToDoMapper {
  @override
  ThingToDo map({required ThingToDoDto thing}) => ThingToDo(
        title: thing.title,
        description: thing.description,
      );

  @override
  List<ThingToDo> mapList({required List<ThingToDoDto> things}) =>
      things.map((thing) => map(thing: thing)).toList();
}
