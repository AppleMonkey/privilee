import 'package:equatable/equatable.dart';

class OpeningHours extends Equatable {
  final String open;
  final String close;

  OpeningHours({required this.open, required this.close});

  @override
  List<Object?> get props => [open, close];
}
