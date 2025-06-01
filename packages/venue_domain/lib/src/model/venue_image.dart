import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class VenueImage extends Equatable {
  final String url;

  const VenueImage({required this.url});

  @override
  List<Object?> get props => [url];
}
