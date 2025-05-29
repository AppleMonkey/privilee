import 'package:flutter_test/flutter_test.dart';
import 'package:venue_data/src/mapper/thing_to_do_mapper.dart';
import 'package:venue_data/src/model/thing_to_do_dto.dart';
import 'package:venue_entity/venue_entity.dart' show ThingToDo;

void main() {
  final thingToDoMapper = ThingToDoMapperImplementation();

  test(
    'ThingToDoMapper should return valid ThingToDo when ThingToDoDto is valid',
    () {
      final dto = ThingToDoDto(title: 'title', description: 'description');
      final expected = ThingToDo(title: 'title', description: 'description');

      final actual = thingToDoMapper.map(thing: dto);

      expect(actual, expected);
    },
  );

  test(
    'ThingToDoMapper should return list of ThingToDo when input list is valid',
    () {
      final things = [
        ThingToDoDto(title: 'title', description: 'description'),
        ThingToDoDto(title: 'Hiking', description: 'Hiking is fun'),
      ];
      final expected = [
        ThingToDo(title: 'title', description: 'description'),
        ThingToDo(title: 'Hiking', description: 'Hiking is fun'),
      ];

      final actual = thingToDoMapper.mapList(things: things);

      expect(actual, expected);
    },
  );

  test('ThingToDoMapper should return empty list when input list is empty', () {
    final things = <ThingToDoDto>[];
    final expected = <ThingToDo>[];

    final actual = thingToDoMapper.mapList(things: things);

    expect(actual, expected);
  });
}
