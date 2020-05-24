import 'package:flutter/material.dart';

import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/models/course.dart';

class DetailCourseInfo extends StatefulWidget {
  const DetailCourseInfo({Key key, this.course}) : super(key: key);

  final Course course;

  @override
  _DetailCourseInfoState createState() => _DetailCourseInfoState();
}

class _DetailCourseInfoState extends State<DetailCourseInfo> {
  var _indexExpanded = -1;

  @override
  Widget build(BuildContext context) {
    final stars = [
      widget.course.rate >= 1 ? Icon(Icons.star) : Icon(Icons.star_border),
      widget.course.rate >= 2 ? Icon(Icons.star) : Icon(Icons.star_border),
      widget.course.rate >= 3 ? Icon(Icons.star) : Icon(Icons.star_border),
      widget.course.rate >= 4 ? Icon(Icons.star) : Icon(Icons.star_border),
      widget.course.rate == 5 ? Icon(Icons.star) : Icon(Icons.star_border),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                widget.course.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(widget.course.shortDescription,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                ...stars,
                Text(
                  ' (${widget.course.rate} por ${widget.course.totalReviews})',
                ),
                Text(
                  ' ${widget.course.students} alunos',
                ),
                Text(
                  ' ${(widget.course.minutes / 60).toStringAsFixed(1)} horas',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: CachedImage(
                  imageUrl: widget.course.thumbnailUrl,
                ),
              ),
            ),
            Text('O que voce precisa saber'),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                ...widget.course.requirements.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      label: Text(
                        e,
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text('O que voce vai aprender'),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                ...widget.course.learnship.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Chip(
                      label: Text(
                        e,
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('INSCREVER-SE'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
            Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: <Widget>[Text(widget.course.description)],
            ),
            SizedBox(height: 16.0,),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) => setState(() {
                if (panelIndex == _indexExpanded) {
                  _indexExpanded = -1;
                } else {
                  _indexExpanded = panelIndex;
                }
              }),
              children: widget.course.classes
                  .asMap()
                  .map(
                    (index, e) => MapEntry(
                      index,
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) => ListTile(
                                title: Text(e.title),
                              ),
                          body: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(e.description),
                              ],
                            ),
                          ),
                          isExpanded: _indexExpanded == index),
                    ),
                  )
                  .values
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

// id: 1,
// name: 'Curso Flutter',
// thumbnailUrl:
//     'https://i.ytimg.com/vi/lIF7yXNYa3o/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCCJX4KuI9cVWmc0ddJxwvn7TvIJQ',
// shortDescription:
//     'Aprenda a fazer aplicativos multiplataforma de alta performance',
// description:
//     'Aprenda a fazer aplicativos multiplataforma de alta performance, ...',
// requirements: ['Básico de programação', 'Básico de orientação a objeto'],
// learnship: ['Criação de aplicativos Flutter', 'Animações', 'API'],
// teacher: gabriel,
// minutes: 293,
// rate: 4.78,
// students: 135,
// totalReviews: 34,
// reviews: reviews,
// classes: classes,
