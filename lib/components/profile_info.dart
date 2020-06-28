import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/user_image.dart';
import 'package:vaz_cursos/models/user.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key key, @required this.user, this.onRefresh})
      : super(key: key);

  final User user;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(child: Text('Usuário não logado'));
    }

    Widget renderProperty(String content, Icon leading) => ListTile(
          title: Text(content, style: TextStyle(fontSize: 18)),
          leading: leading,
        );

    final list = ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Center(child: UserImage(profileImage: user.profileImage)),
        renderProperty(user.name, const Icon(Icons.person)),
        renderProperty(user.email, const Icon(Icons.email)),
      ],
    );

    return this.onRefresh != null
        ? RefreshIndicator(child: list, onRefresh: onRefresh)
        : list;
  }
}
