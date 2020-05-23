import 'package:vaz_cursos/models/user.dart';

class AuthUser {
  User user;
  String token; // jwt

  AuthUser({this.user, this.token});
}
