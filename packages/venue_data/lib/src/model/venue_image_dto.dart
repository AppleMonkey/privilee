import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class VenueImageDto extends Equatable {
  final String url;

  const VenueImageDto({required this.url});

  @override
  List<Object?> get props => [url];
}
