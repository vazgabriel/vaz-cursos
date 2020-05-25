import 'package:flutter/material.dart';

import 'package:vaz_cursos/models/course_class.dart';
import 'package:vaz_cursos/utils/map_index.dart';

class DetailCourseClassesList extends StatefulWidget {
  DetailCourseClassesList({Key key, this.classes}) : super(key: key);

  final List<CourseClass> classes;

  @override
  _DetailCourseClassesListState createState() =>
      _DetailCourseClassesListState();
}

class _DetailCourseClassesListState extends State<DetailCourseClassesList> {
  var _indexExpanded = -1;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) => setState(() {
        if (panelIndex == _indexExpanded) {
          _indexExpanded = -1;
        } else {
          _indexExpanded = panelIndex;
        }
      }),
      children: mapIndex(
        widget.classes,
        (e, index) => ExpansionPanel(
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
          isExpanded: _indexExpanded == index,
        ),
      ),
    );
  }
}
