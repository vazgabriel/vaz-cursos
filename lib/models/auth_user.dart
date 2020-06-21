import 'package:flutter/material.dart';
import 'package:vaz_cursos/models/user.dart';

class AuthUser {
  User user;
  String token; // jwt

  AuthUser({
    @required this.user,
    @required this.token,
  });
}
