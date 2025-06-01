import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class OpeningHours extends Equatable {
  final String open;
  final String close;

  const OpeningHours({required this.open, required this.close});

  @override
  List<Object?> get props => [open, close];
}
