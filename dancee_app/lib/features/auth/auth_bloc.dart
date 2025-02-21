import 'package:dancee_app/entities/user.dart';
import 'package:vader_app/vader_app.dart';
import 'package:dancee_app/features/auth/auth_events.dart';
import 'package:dancee_app/features/auth/auth_state.dart';
import 'package:dancee_app/features/auth/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, UserState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(UserState.init()) {
    on<AuthGetUser>(_onGetUser);
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
  }

  late final AuthRepository _authRepository;

  Future<void> _onLogin(AuthLogin event, Emitter<UserState> emit) async {
    try {
      emit(UserState.loading());
      final User user = await _authRepository.login(
        userName: event.userName,
        password: event.password,
        type: event.type,
      );
      emit(UserState.loggedIn(user));
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }

  Future<void> _onGetUser(AuthGetUser event, Emitter<UserState> emit) async {
    try {
      emit(UserState.loading());
      final User user = await _authRepository.loggedUser();
      emit(UserState.success(user));
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }

  void _onLogout(AuthLogout event, Emitter<UserState> emit) {
    try {
      emit(UserState.loading());
      _authRepository.logout();
      emit(UserState.loggedOut());
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }
}
