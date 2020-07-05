import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:vaz_cursos/components/auth.dart';
import 'package:vaz_cursos/components/dialogs/edit_password.dart';
import 'package:vaz_cursos/components/dialogs/edit_profile.dart';
import 'package:vaz_cursos/components/user_image.dart';
import 'package:vaz_cursos/models/user.dart';

import 'package:vaz_cursos/store/user.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    void closeDrawer() {
      Navigator.pop(context);
    }

    void editProfile() {
      showDialog(
        context: context,
        builder: (dialogCtx) => Dialog(
          child: EditProfile(dialogCtx: dialogCtx, onSuccess: closeDrawer),
        ),
      );
    }

    void editPassword() {
      showDialog(
        context: context,
        builder: (dialogCtx) => Dialog(
          child: EditPassword(dialogCtx: dialogCtx, onSuccess: closeDrawer),
        ),
      );
    }

    return Observer(
      builder: (_) {
        final User user = userStore.user?.user;
        final isLogged = user != null;

        void onLoginLogout() {
          if (isLogged) {
            userStore.logout();
            closeDrawer();
            return;
          }

          showDialog(
            context: context,
            builder: (dialogCtx) => Dialog(
              child: AuthComponent(
                dialogCtx: dialogCtx,
                onLoginSuccess: closeDrawer,
              ),
            ),
          );
        }

        final loggedItems = [
          ListTile(
            title: Text('EDITAR PERFIL'),
            leading: Icon(Icons.edit),
            onTap: editProfile,
          ),
          ListTile(
            title: Text('EDITAR SENHA'),
            leading: Icon(Icons.security),
            onTap: editPassword,
          ),
        ];

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Vaz Cursos',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                          UserImage(profileImage: user?.profileImage, size: 80),
                    )
                  ],
                ),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              if (isLogged) ...loggedItems,
              ListTile(
                title: Text(isLogged ? 'LOGOUT' : 'LOGIN'),
                leading: Icon(isLogged ? Icons.arrow_back : Icons.lock_open),
                onTap: onLoginLogout,
              )
            ],
          ),
        );
      },
    );
  }
}
