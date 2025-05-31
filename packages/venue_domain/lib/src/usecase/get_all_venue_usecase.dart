import 'package:flutter/foundation.dart';
import 'package:venue_domain/src/repository/venue_repository.dart';
import 'package:venue_entity/venue_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
abstract class GetAllVenuesUseCase {
  Future<List<Venue>> call();
}

@LazySingleton(as: GetAllVenuesUseCase)
class GetAllVenuesUseCaseImplementation implements GetAllVenuesUseCase {
  final VenueRepository _repository;

  const GetAllVenuesUseCaseImplementation(this._repository);

  @override
  Future<List<Venue>> call() => _repository.getVenues();
}
