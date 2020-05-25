import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/star_score.dart';
import 'package:vaz_cursos/models/course.dart';

class DetailCourseHeader extends StatelessWidget {
  const DetailCourseHeader({Key key, this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            course.name,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            course.shortDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            StarScore(score: course.rate),
            Text(
              ' (${course.rate} por ${course.totalReviews})',
            ),
            Text(
              ' ${course.students} alunos',
            ),
            Text(
              ' ${(course.minutes / 60).toStringAsFixed(1)} horas',
            ),
          ],
        ),
      ],
    );
  }
}
