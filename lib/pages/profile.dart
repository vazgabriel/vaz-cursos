import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthComponent(
      instructions: 'Faça login ou crie sua conta',
    );
  }
}
