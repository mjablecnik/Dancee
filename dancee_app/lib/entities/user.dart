import 'package:vader_app/vader_app.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User extends VaderEntity with _$User {
  const User._();

  const factory User({
    required String firstName,
    required String lastName,
    @JsonKey(name: "username") required String userName,
    @JsonKey(name: "accessToken") String? token,
  }) = _User;

  String? get fullName => "$firstName $lastName";

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
