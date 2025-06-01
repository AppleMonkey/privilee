import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class ThingToDo extends Equatable {
  final String title;
  final String? description;

  const ThingToDo({required this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}
