import 'package:flutter/material.dart';

import 'package:vaz_cursos/pages/detail_course.dart';
import 'package:vaz_cursos/named_routes.dart';
import 'package:vaz_cursos/tab.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var arguments = settings.arguments;

  switch (settings.name) {
    case DetailCourseViewRoute:
      return MaterialPageRoute(
        builder: (context) => DetailCourse(
          id: (arguments as Map<String, dynamic>)['id'],
        ),
      );
    case HomeViewRoute:
    default:
      return MaterialPageRoute(builder: (context) => TabPage());
  }
}
