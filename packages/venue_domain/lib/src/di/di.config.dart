// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:venue_domain/src/repository/venue_repository.dart' as _i213;
import 'package:venue_domain/src/usecase/get_all_venue_usecase.dart' as _i959;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i959.GetAllVenuesUseCase>(
      () =>
          _i959.GetAllVenuesUseCaseImplementation(gh<_i213.VenueRepository>()),
    );
    return this;
  }
}
