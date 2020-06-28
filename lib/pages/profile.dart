import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:vaz_cursos/api.dart';

import 'package:vaz_cursos/components/auth.dart';
import 'package:vaz_cursos/components/profile_info.dart';
import 'package:vaz_cursos/models/auth_user.dart';
import 'package:vaz_cursos/models/user.dart';
import 'package:vaz_cursos/store/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Observer(
      builder: (_) {
        Future<void> updateUser() async {
          if (userStore.user == null) return Future.value();

          try {
            var options = Options(
              headers: {'Authorization': userStore.user.token},
            );
            var response = await api.get("/auth/renew-token", options: options);
            final String token = response.data['token'];
            final User user = User.fromJson(response.data['user']);
            userStore.setAuthUser(AuthUser(token: token, user: user));
          } on DioError catch (e) {
            // Verify if the error is a forbidden error
            if (e.response.statusCode == 403) {
              userStore.logout();
            }
          } catch (e) {
            // Internet error
          }
        }

        return userStore.user != null
            ? ProfileInfo(user: userStore.user.user, onRefresh: updateUser)
            : AuthComponent(
                instructions: 'Faça login ou crie sua conta',
              );
      },
    );
  }
}
