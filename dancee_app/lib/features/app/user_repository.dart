import 'package:vader_app/vader_app.dart';
import 'package:dancee_app/entities/user.dart';

class UserRepository extends Repository {
  UserRepository({
    required super.httpClient,
    required super.storageClient,
  });

  Future<User> getLoggedUser() async {
    final response = await httpClient.request(
      path: '/auth/me',
      method: HttpMethod.get,
    );
    return User.fromJson(response.data);
  }

  Future<User> getUser(String userName) async {
    Future.delayed(const Duration(seconds: 1));
    return User(firstName: "John", lastName: "Doe", userName: userName);
  }

  Future<void> saveLoggedUser(User? user) {
    if (user != null) {
      return storageClient.saveMap(StorageKey.loggedUser.name, user.toJson());
    } else {
      return storageClient.remove(StorageKey.loggedUser.name);
    }
  }
}
