import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/detail_course/info.dart';
import 'package:vaz_cursos/mock/courses.dart';
import 'package:vaz_cursos/models/course.dart';

class DetailCourse extends StatelessWidget {
  const DetailCourse({Key key, this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final Course course = courses.firstWhere((element) => element.id == id, orElse: () => null);
    final Widget body = course != null
        ? DetailCourseInfo(
            course: course,
          )
        : Center(
            child: Text('Curso não encontrado'),
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(course != null ? course.name : 'Não encontrado'),
      ),
      body: body,
    );
  }
}
