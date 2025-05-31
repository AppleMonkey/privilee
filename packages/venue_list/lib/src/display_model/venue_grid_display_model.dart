import 'package:meta/meta.dart';
import 'package:venue_list/src/display_model/venue_display_model.dart';

@immutable
class VenueGridDisplayModel {
  final String title;
  final List<VenueCardDisplayModel> items;

  const VenueGridDisplayModel({required this.title, required this.items});
}
