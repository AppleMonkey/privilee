import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Category extends Equatable {
  final String name;

  const Category({required this.name});
  
  @override
  List<Object?> get props => [name];
}
