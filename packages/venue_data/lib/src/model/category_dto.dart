import 'package:meta/meta.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
class CategoryDto extends Equatable {
  final String name;

  const CategoryDto({required this.name});

  @override
  List<Object?> get props => [name];
}
