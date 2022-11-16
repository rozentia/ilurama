import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_type.freezed.dart';

@freezed
class AuthType with _$AuthType {
  const factory AuthType.authWithApple() = AuthWithApple;
  const factory AuthType.authWithGoogle() = AuthWithGoogle;
  // const factory AuthType.authWithFacebook() = AuthWithFacebook;
  // const factory AuthType.authWithTwitter() = AuthWithTwitter;
  // const factory AuthType.authWithGithub() = AuthWithGithub;
  // const factory Authtype.authWithYahoo() = AuthWithYahoo;
  const factory AuthType.authWithEmailAndPassword(String email, String password) = AuthWithEmailAndPassword;
  // const factory AuthType.authWithPhone() => AuthWithPhone;

}
