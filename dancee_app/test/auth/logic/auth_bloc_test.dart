import 'package:dancee_app/features/auth/logic/auth_bloc.dart';
import 'package:dancee_app/features/auth/logic/auth_events.dart';
import 'package:dancee_app/features/auth/logic/auth_state.dart';
import 'package:dancee_app/features/auth/auth_repository.dart';
import 'package:dancee_shared/entities.dart';
import 'package:vader_app/vader_app.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import '../repository/mock_response_data.dart';
import '../setup.dart';
import 'mock_entities_data.dart';

fakeData() {
  final httpClient = HttpClientMock();
  final secureStorage = StorageClientMock();
  setupInjector(httpClient: httpClient, storageClient: secureStorage);

  when(() => httpClient.setHeader('authorization', any())).thenReturn(true);

  when(() => secureStorage.saveMap(StorageKey.loggedUser.name, User.fromJson(userLoginResponse.data).toJson()))
      .thenAnswer((i) => Future.value());

  when(() => secureStorage.remove(StorageKey.loggedUser.name))
      .thenAnswer((i) => Future.value());

  when(
    () => httpClient.request(
      path: '/auth/login',
      method: HttpMethod.post,
      data: {'username': 'emilys', 'password': 'emilyspass'},
    ),
  ).thenAnswer((i) => Future.value(userLoginResponse));

  when(
    () => httpClient.request(
      path: '/auth/me',
      method: HttpMethod.get,
    ),
  ).thenAnswer((i) => Future.value(userDetailResponse));
}

void main() {
  late AuthBloc authBloc;

  group(AuthBloc, () {
    setUp(() {
      setupData(fakeData, useFakeData: true);
      authBloc = AuthBloc(authRepository: injector.use<AuthRepository>());
    });
    tearDown(() => injector.reset());

    blocTest(
      'Auth Login',
      build: () => authBloc,
      act: (bloc) => bloc.add(AuthLogin(
        userName: "emilys",
        password: "emilyspass",
        type: LoginType.token,
      )),
      expect: () => [
        UserState.loading(),
        UserState.loggedIn(expectedLoginUser),
      ],
    );

    blocTest(
      'Get logged user',
      build: () => authBloc,
      act: (bloc) => bloc.add(AuthGetUser()),
      expect: () => [
        UserState.loading(),
        UserState.success(expectedLoggedUser),
      ],
    );

    blocTest(
      'Logout user',
      build: () => authBloc,
      act: (bloc) => bloc.add(AuthLogout()),
      expect: () => [
        UserState.loading(),
        UserState.loggedOut(),
      ],
    );
  });
}
