import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class OpeningHoursDto extends Equatable {
  final String open;
  final String close;

  const OpeningHoursDto({required this.open, required this.close});

  @override
  List<Object?> get props => [open, close];
}
