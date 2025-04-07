import 'package:vader_core/vader_core.dart';

part 'todo.freezed.dart';

part 'todo.g.dart';

@freezed
class Todo extends VaderEntity with _$Todo {
  const Todo._();

  const factory Todo({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "is_done") @Default(false) bool isDone,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
