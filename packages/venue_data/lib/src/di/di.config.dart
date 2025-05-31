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
import 'package:venue_data/src/datasource/remote_data_source.dart' as _i117;
import 'package:venue_data/src/mapper/category_mapper.dart' as _i258;
import 'package:venue_data/src/mapper/coordinates_mapper.dart' as _i420;
import 'package:venue_data/src/mapper/opening_hours_mapper.dart' as _i336;
import 'package:venue_data/src/mapper/thing_to_do_mapper.dart' as _i306;
import 'package:venue_data/src/mapper/venue_image_mapper.dart' as _i346;
import 'package:venue_data/src/mapper/venue_mapper.dart' as _i18;
import 'package:venue_data/src/parser/category_parser.dart' as _i25;
import 'package:venue_data/src/parser/coordinates_parser.dart' as _i881;
import 'package:venue_data/src/parser/opening_hours_parser.dart' as _i463;
import 'package:venue_data/src/parser/thing_to_do_parser.dart' as _i136;
import 'package:venue_data/src/parser/venue_image_parser.dart' as _i543;
import 'package:venue_data/src/parser/venue_parser.dart' as _i1058;
import 'package:venue_data/src/repository/venue_repository.dart' as _i133;
import 'package:venue_domain/venue_domain.dart' as _i434;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i543.VenueImageParser>(
      () => _i543.VenueImageParserImplementation(),
    );
    gh.lazySingleton<_i463.OpeningHoursParser>(
      () => _i463.OpeningHoursParserImplementation(),
    );
    gh.lazySingleton<_i346.VenueImageMapper>(
      () => _i346.VenueImageMapperImplementation(),
    );
    gh.lazySingleton<_i117.VenueRemoteDataSource>(
      () => const _i117.VenueRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i25.CategoryParser>(
      () => _i25.CategoryParserImplementation(),
    );
    gh.lazySingleton<_i306.ThingToDoMapper>(
      () => _i306.ThingToDoMapperImplementation(),
    );
    gh.lazySingleton<_i258.CategoryMapper>(
      () => _i258.CategoryMapperImplementation(),
    );
    gh.lazySingleton<_i881.CoordinatesParser>(
      () => _i881.CoordinatesParserImplementation(),
    );
    gh.lazySingleton<_i136.ThingToDoParser>(
      () => _i136.ThingToDoParserImplementation(),
    );
    gh.lazySingleton<_i420.CoordinatesMapper>(
      () => _i420.CoordinatesMapperImplementation(),
    );
    gh.lazySingleton<_i336.OpeningHoursMapper>(
      () => _i336.OpeningHoursMapperImplementation(),
    );
    gh.lazySingleton<_i18.VenueMapper>(
      () => _i18.VenueMapperImplementation(
        coordinatesMapper: gh<_i420.CoordinatesMapper>(),
        venueImageMapper: gh<_i346.VenueImageMapper>(),
        categoryMapper: gh<_i258.CategoryMapper>(),
        openingHoursMapper: gh<_i336.OpeningHoursMapper>(),
        thingToDoMapper: gh<_i306.ThingToDoMapper>(),
      ),
    );
    gh.lazySingleton<_i1058.VenueParser>(
      () => _i1058.VenueParserImplementation(
        coordinatesParser: gh<_i881.CoordinatesParser>(),
        venueImageParser: gh<_i543.VenueImageParser>(),
        categoryParser: gh<_i25.CategoryParser>(),
        openingHoursParser: gh<_i463.OpeningHoursParser>(),
        thingToDoParser: gh<_i136.ThingToDoParser>(),
      ),
    );
    gh.lazySingleton<_i434.VenueRepository>(
      () => _i133.VenueRepositoryImplementation(
        remoteDataSource: gh<_i117.VenueRemoteDataSource>(),
        parser: gh<_i1058.VenueParser>(),
        mapper: gh<_i18.VenueMapper>(),
      ),
    );
    return this;
  }
}
