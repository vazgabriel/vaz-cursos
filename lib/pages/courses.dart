import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/components/auth.dart';
import 'package:vaz_cursos/store/user.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Observer(
      builder: (_) => userStore.user != null
          ? Center(
              child: Text('Meus cursos'),
            )
          : AuthComponent(
              instructions: 'Faça login ou crie uma conta para ver seus cursos',
            ),
    );
  }
}
