import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class CoordinatesDto extends Equatable{
  final double latitude;
  final double longitude;

  const CoordinatesDto({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}
