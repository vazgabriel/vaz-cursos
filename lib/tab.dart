import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaz_cursos/api.dart';
import 'package:vaz_cursos/components/app_drawer.dart';
import 'package:vaz_cursos/models/auth_user.dart';
import 'package:vaz_cursos/models/user.dart';

import 'package:vaz_cursos/pages/courses.dart';
import 'package:vaz_cursos/pages/home.dart';
import 'package:vaz_cursos/pages/profile.dart';
import 'package:vaz_cursos/store/user.dart';

class TabPage extends StatefulWidget {
  TabPage({Key key, @required this.routeCtx}) : super(key: key);

  final BuildContext routeCtx;

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  var _currentIndex = 0;
  final _children = [
    HomePage(),
    CoursesPage(),
    ProfilePage(),
  ];

  _onTap(int tab) {
    if (_currentIndex != tab) {
      setState(() {
        _currentIndex = tab;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.routeCtx == null) return;

    final userStore = Provider.of<UserStore>(widget.routeCtx);
    userStore.getUser().then((value) async {
      if ((value?.token ?? '').isEmpty) {
        return;
      }

      try {
        var options = Options(headers: {'Authorization': value.token});
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaz Cursos'),
      ),
      body: _children[_currentIndex],
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Cursos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
        ],
      ),
    );
  }
}
