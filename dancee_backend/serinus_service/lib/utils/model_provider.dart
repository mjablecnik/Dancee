import 'package:serinus/serinus.dart';

import '../todo/todo.dart';

class ServiceModelProvider extends ModelProvider {
  @override
  Map<Type, Function> get toJsonModels {
    return {};
  }

  @override
  Map<Type, Function> get fromJsonModels {
    return {
      Todo: (json) => Todo.fromJson(json),
    };
  }

  @override
  Object from(
    Type model,
    Map<String, dynamic> json,
  ) {
    if (fromJsonModels.containsKey(model)) {
      return fromJsonModels[model]!(json);
    }
    throw UnsupportedError('Model $model not supported');
  }

  @override
  Map<String, dynamic> to<T>(T model) {
    if (toJsonModels.containsKey(T)) {
      return toJsonModels[T]!(model) as Map<String, dynamic>;
    }
    throw UnsupportedError('Model $T not supported');
  }
}
