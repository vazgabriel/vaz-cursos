import 'package:flutter/material.dart';
import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/mock/courses.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) => Card(
        elevation: 5.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              CachedImage(
                imageUrl: courses[index].thumbnailUrl,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text('${courses[index].name} por ${courses[index].teacher.name}'),
                subtitle: Text(courses[index].shortDescription),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: const Text('DETALHES'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
