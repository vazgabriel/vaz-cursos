import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vaz_cursos/named_routes.dart';
import 'package:vaz_cursos/route.dart';
import 'package:vaz_cursos/store/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(MyApp(preferences));
}

class MyApp extends StatelessWidget {
  const MyApp(this.preferences);

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(
          create: (_) => UserStore(preferences),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
