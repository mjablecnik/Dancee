import 'package:dancee_app/features/events/event_list_cubit.dart';
import 'package:dancee_app/features/auth/auth_repository.dart';
import 'package:dancee_app/features/events/event_repository.dart';
import 'package:dancee_app/features/products/product_repository.dart';
import 'package:dancee_app/features/app/user_repository.dart';
import 'package:vader_app/vader_app.dart';

setupInjector({required HttpClient httpClient, required StorageClient storageClient}) {
  injector
    ..addInstance(httpClient)
    ..addInstance(storageClient)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(ProductRepository.new)
    ..addSingleton(EventRepository.new)
    ..addSingleton(EventListCubit.new)
    ..commit();
}
