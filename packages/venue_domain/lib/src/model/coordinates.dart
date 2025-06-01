import 'package:meta/meta.dart';

@immutable
class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({required this.latitude, required this.longitude});
}
