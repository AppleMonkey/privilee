import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:meta/meta.dart' show immutable;
import 'package:venue_data/src/model/thing_to_do_dto.dart';

@immutable
abstract class ThingToDoParser {
  ThingToDoDto parse(dynamic json);
}

@LazySingleton(as: ThingToDoParser)
class ThingToDoParserImplementation implements ThingToDoParser {
  @override
  ThingToDoDto parse(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw ArgumentError(
        'ThingToDo must be a Map with String keys and dynamic values',
      );
    }

    if (!json.containsKey('title')) {
      throw ArgumentError('ThingToDo must contain "title" key');
    }

    final title = json['title'];
    if (title == null || title is! String || title.isEmpty) {
      throw ArgumentError('ThingToDo title must be a non-empty String');
    }

    final description = json['description'];
    if (description != null && description is! String) {
      throw ArgumentError('ThingToDo description must be a String or null');
    }

    return ThingToDoDto(title: title, description: description);
  }
}
