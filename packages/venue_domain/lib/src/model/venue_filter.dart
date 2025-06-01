
import 'package:meta/meta.dart' show immutable;

@immutable
class VenueFilter {
  final List<String> types;
  final List<String> facilities;
  final bool? familyAccess;
  final bool? guestAccess;

  const VenueFilter({
    this.types = const [],
    this.facilities = const [],
    this.familyAccess,
    this.guestAccess,
  });
}
