import 'package:flutter/material.dart';

import 'package:vaz_cursos/named_routes.dart';
import 'package:vaz_cursos/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaz Cursos',
      theme: ThemeData(
        primaryColor: Colors.orange,
        primaryTextTheme: Theme.of(context)
            .primaryTextTheme
            .copyWith(headline6: TextStyle(color: Colors.white)),
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: HomeViewRoute,
    );
  }
}
