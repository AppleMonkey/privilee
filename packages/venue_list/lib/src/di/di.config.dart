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
import 'package:venue_domain/venue_domain.dart' as _i434;
import 'package:venue_list/src/bloc/venue_list_bloc.dart' as _i436;
import 'package:venue_list/src/display_mapper/venue_card_mapper.dart' as _i753;
import 'package:venue_list/src/display_mapper/venue_grid_mapper.dart' as _i78;
import 'package:venue_list/src/usecase/get_venue_grid_model_usecase.dart'
    as _i897;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i753.VenueCardMapper>(() => _i753.VenueCardMapperImpl());
    gh.factory<_i78.VenueGridMapper>(
      () => _i78.VenueGridMapperImpl(
        venueCardMapper: gh<_i753.VenueCardMapper>(),
      ),
    );
    gh.factory<_i897.GetVenueGridModelUseCase>(
      () => _i897.GetVenueGridModelUseCaseImpl(
        getAllVenuesUseCase: gh<_i434.GetAllVenuesUseCase>(),
        venueGridMapper: gh<_i78.VenueGridMapper>(),
      ),
    );
    gh.factory<_i436.VenueListBloc>(
      () => _i436.VenueListBloc(gh<_i897.GetVenueGridModelUseCase>()),
    );
    return this;
  }
}
