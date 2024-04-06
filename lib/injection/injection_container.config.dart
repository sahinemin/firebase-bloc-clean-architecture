// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:study/core/logger/logger.dart' as _i5;
import 'package:study/features/authentication/data/datasources/authentication_datasource.dart'
    as _i6;
import 'package:study/features/authentication/data/datasources/firebase_authentication.dart'
    as _i7;
import 'package:study/features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i9;
import 'package:study/features/authentication/domain/repositories/authentication_repository.dart'
    as _i8;
import 'package:study/features/authentication/domain/usecases/login_usecase.dart'
    as _i13;
import 'package:study/features/authentication/domain/usecases/register_usecase.dart'
    as _i12;
import 'package:study/features/authentication/presentation/bloc/authentication_bloc.dart'
    as _i17;
import 'package:study/features/home/data/datasources/firebase_user_profile_datasource.dart'
    as _i4;
import 'package:study/features/home/data/datasources/user_profile_datasource.dart'
    as _i3;
import 'package:study/features/home/data/repositories/user_profile_repositorty_impl.dart'
    as _i11;
import 'package:study/features/home/domain/repositories/user_profile_repository.dart'
    as _i10;
import 'package:study/features/home/domain/usecases/add_hobby_usecase.dart'
    as _i15;
import 'package:study/features/home/domain/usecases/create_user_profile_usecase.dart'
    as _i16;
import 'package:study/features/home/domain/usecases/get_user_profile_usecase.dart'
    as _i14;
import 'package:study/features/home/presentation/bloc/home_bloc.dart'
    as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.UserProfileDataSource>(
        () => _i4.FirebaseUserProfileDataSource());
    gh.lazySingleton<_i5.BaseLogger>(() => _i5.CustomLogger());
    gh.lazySingleton<_i6.AuthenticationDataSource>(
        () => _i7.FirebaseAuthentication());
    gh.lazySingleton<_i8.AuthenticationRepository>(() =>
        _i9.AuthenticationRepositoryImpl(gh<_i6.AuthenticationDataSource>()));
    gh.lazySingleton<_i10.UserProfileRepository>(() =>
        _i11.UserProfileRepositoryImpl(
            userProfileDataSource: gh<_i3.UserProfileDataSource>()));
    gh.factory<_i12.RegisterUseCase>(
        () => _i12.RegisterUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(gh<_i8.AuthenticationRepository>()));
    gh.factory<_i14.GetUserProfileUseCase>(
        () => _i14.GetUserProfileUseCase(gh<_i10.UserProfileRepository>()));
    gh.factory<_i15.AddHobbyUseCase>(
        () => _i15.AddHobbyUseCase(gh<_i10.UserProfileRepository>()));
    gh.factory<_i16.CreateUserProfileUseCase>(
        () => _i16.CreateUserProfileUseCase(gh<_i10.UserProfileRepository>()));
    gh.factory<_i17.AuthenticationBloc>(() => _i17.AuthenticationBloc(
          gh<_i12.RegisterUseCase>(),
          gh<_i13.LoginUseCase>(),
        ));
    gh.factory<_i18.HomeBloc>(() => _i18.HomeBloc(
          gh<_i14.GetUserProfileUseCase>(),
          gh<_i16.CreateUserProfileUseCase>(),
          gh<_i15.AddHobbyUseCase>(),
        ));
    return this;
  }
}
