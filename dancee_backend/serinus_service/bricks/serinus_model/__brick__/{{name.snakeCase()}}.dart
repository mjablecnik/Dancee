import 'package:vader_core/vader_core.dart';

part '{{name.snakeCase()}}.freezed.dart';

part '{{name.snakeCase()}}.g.dart';

@freezed
class {{name.pascalCase()}} extends VaderEntity with _${{name.pascalCase()}} {
  const {{name.pascalCase()}}._();

  const factory {{name.pascalCase()}}({
    @JsonKey(name: "username") required String userName,
    /*
      Add other properties here..
     */
  }) = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json) => _${{name.pascalCase()}}FromJson(json);
}
