import 'package:equatable/equatable.dart';

class VenueImage extends Equatable {
  final String url;

  VenueImage({required this.url});

  @override
  List<Object?> get props => [url];
}
