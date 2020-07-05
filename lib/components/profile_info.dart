import 'package:flutter/material.dart';
import 'package:vaz_cursos/components/dialogs/save_teacher.dart';

import 'package:vaz_cursos/components/user_image.dart';
import 'package:vaz_cursos/models/teacher.dart';
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

    void showSaveTeacher() {
      showDialog(
        context: context,
        builder: (dialogCtx) =>
            Dialog(child: SaveTeacher(dialogCtx: dialogCtx)),
      );
    }

    List<Widget> renderTeacherInfo(Teacher teacher) {
      if (teacher == null) {
        return [
          FlatButton(
            child: Text('TORNAR-SE PROFESSOR'),
            textColor: Theme.of(context).primaryColor,
            onPressed: showSaveTeacher,
          ),
        ];
      }

      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Detalhes Professor',
              style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: showSaveTeacher,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        Divider(),
        Text(
          'Descrição simples:',
          style: const TextStyle(fontSize: 16.0, decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(teacher.shortDescription),
        ),
        Divider(),
        Text(
          'Descrição completa:',
          style: const TextStyle(fontSize: 16.0, decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(teacher.description),
        ),
      ];
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
        ...renderTeacherInfo(user.teacher),
      ],
    );

    return this.onRefresh != null
        ? RefreshIndicator(child: list, onRefresh: onRefresh)
        : list;
  }
}
