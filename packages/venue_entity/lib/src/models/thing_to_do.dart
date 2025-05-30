import 'package:equatable/equatable.dart';

class ThingToDo extends Equatable {
  final String title;
  final String? description;

  ThingToDo({required this.title, this.description});

  @override
  List<Object?> get props => [title, description];
}
