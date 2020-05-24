import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/models/course.dart';
import 'package:vaz_cursos/named_routes.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key key, this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            CachedImage(
              imageUrl: course.thumbnailUrl,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListTile(
              title: Text('${course.name} por ${course.teacher.name}'),
              subtitle: Text(course.shortDescription),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailCourseViewRoute, arguments: {
                      "id": course.id,
                    });
                  },
                  child: const Text('DETALHES'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
