// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:prog_lang/data/language_database.dart' as _i841;
import 'package:prog_lang/data/language_repository.dart' as _i437;
import 'package:prog_lang/pages/home/bloc/home_bloc.dart' as _i645;
import 'package:prog_lang/theme/theme_cubit.dart' as _i919;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i919.ThemeCubit>(() => _i919.ThemeCubit());
    gh.lazySingleton<_i841.AppDatabase>(() => _i841.AppDatabase());
    gh.lazySingleton<_i437.LanguageRepository>(
      () => _i437.LanguageRepository(gh<_i841.AppDatabase>()),
    );
    gh.factory<_i645.HomeBloc>(
      () => _i645.HomeBloc(gh<_i437.LanguageRepository>()),
    );
    return this;
  }
}
