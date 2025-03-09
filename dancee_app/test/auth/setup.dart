import 'dart:io';

import 'package:vader_app/vader_app.dart' hide setupInjector;
import 'package:dancee_app/features/auth/auth_repository.dart';
import 'package:dancee_app/features/app/user_repository.dart';
import 'package:vader_app/vader_app.dart';

setupData(Function() setupFakeData, {required bool useFakeData}) {
  final apiUrl = "https://dummyjson.com";
  if (useFakeData) {
    print('Using fake data..');
    setupFakeData();
  } else {
    print('Using real data from: $apiUrl');
    setupInjector(
      httpClient: HttpClient(
        apiUrl: apiUrl,
        enableLogs: true,
        preventLargeResponses: false,
      ),
      storageClient: StorageClient(path: Directory.systemTemp.path),
    );
  }
}

setupInjector({required HttpClient httpClient, required StorageClient storageClient}) {
  injector
    ..addInstance(httpClient)
    ..addInstance(storageClient)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..commit();
}
