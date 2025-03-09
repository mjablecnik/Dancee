import 'package:dancee_app/features/app/app_module.dart';
import 'package:dancee_app/features/auth/auth_repository.dart';
import 'package:vader_app/vader_app.dart';

import 'logic/auth_bloc.dart';

class AuthModule extends AppModule {
  @override
  get routes => [];

  @override
  Injector? get services {
    return super.services!
      ..add(AuthRepository.new)
      ..add(AuthBloc.new)
      ..commit();
  }
}
