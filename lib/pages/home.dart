import 'package:flutter/material.dart';

import 'package:vaz_cursos/mock/courses.dart';
import 'package:vaz_cursos/components/list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) => ListCard(
        course: courses[index],
      ),
    );
  }
}
