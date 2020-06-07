import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/auth.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthComponent(
      instructions: 'Faça login ou crie uma conta para ver seus cursos',
    );
  }
}
