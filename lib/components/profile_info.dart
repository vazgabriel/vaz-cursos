import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/components/sized_circle.dart';
import 'package:vaz_cursos/models/user.dart';
import 'package:vaz_cursos/store/user.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final User user = userStore.user.user;

    if (user == null) {
      return Center(child: Text('Usuário não logado'));
    }

    final userImage = user.profileImage != null
        ? CachedImage(
            imageUrl: user.profileImage,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image(
                image: imageProvider,
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          )
        : SizedCircle(
            child: Icon(Icons.person, color: Colors.white, size: 134.0),
            elevation: 5.0,
          );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          userImage,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              user.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          RaisedButton(
            onPressed: () {
              userStore.logout();
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
