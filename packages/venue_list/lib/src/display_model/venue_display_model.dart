import 'package:meta/meta.dart';

@immutable
class VenueCardDisplayModel {
  final String name;
  final String location;
  final List<String>? imageUrl;

  const VenueCardDisplayModel({
    required this.name,
    required this.location,
    this.imageUrl,
  });
}
