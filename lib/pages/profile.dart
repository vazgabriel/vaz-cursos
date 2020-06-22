import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/components/auth.dart';
import 'package:vaz_cursos/components/profile_info.dart';
import 'package:vaz_cursos/store/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Observer(
      builder: (_) => userStore.user != null
          ? ProfileInfo()
          : AuthComponent(
              instructions: 'Faça login ou crie sua conta',
            ),
    );
  }
}
