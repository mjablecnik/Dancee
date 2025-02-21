
import 'package:dancee_app/features/auth/auth_repository.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthGetUser extends AuthEvent {
  const AuthGetUser();
}

final class AuthLogin extends AuthEvent {
  const AuthLogin({
    required this.userName,
    required this.password,
    required this.type,
  });

  final String userName;
  final String password;
  final LoginType type;
}

final class AuthLogout extends AuthEvent {
  const AuthLogout();
}
