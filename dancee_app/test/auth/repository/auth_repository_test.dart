import 'package:dancee_app/entities/user.dart';
import 'package:dancee_app/global.dart';
import 'package:dancee_app/features/auth/auth_repository.dart';
import 'package:vader_app/vader_app.dart';
import 'package:test/test.dart';

import '../../setup.dart';
import 'mock_response_data.dart';

fakeData() {
  final httpClient = HttpClientMock();
  final secureStorage = StorageClientMock();
  setupInjector(httpClient: httpClient, storageClient: secureStorage);

  when(() => httpClient.setHeader('authorization', any())).thenReturn(true);

  when(() => secureStorage.saveMap(StorageKey.loggedUser.name, User.fromJson(userLoginResponse.data).toJson()))
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
  setupData(fakeData, useFakeData: true);

  final authRepository = injector.use<AuthRepository>();

  test('Auth login', () async {
    final loginUser = await authRepository.login(userName: "martin", password: "test123", type: LoginType.token);
    expect(loginUser.firstName, 'Emily');
    expect(loginUser.lastName, 'Johnson');
    expect(loginUser.userName, 'emilys');
    expect(loginUser.token, isNotNull);
    expect(loginUser.token, isNotEmpty);
    expect(loginUser.token, hasLength(360));
  });

  test('Get logged user', () async {
    final loggedUser = await authRepository.loggedUser();
    final user = User(firstName: 'Emily', lastName: 'Johnson', userName: 'emilys', token: null);
    expect(loggedUser, user);
  });
}
