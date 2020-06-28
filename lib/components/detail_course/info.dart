import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/components/auth.dart';
import 'package:vaz_cursos/components/cached_image.dart';
import 'package:vaz_cursos/components/detail_course/chip_info.dart';
import 'package:vaz_cursos/components/detail_course/classes_list.dart';
import 'package:vaz_cursos/components/detail_course/header.dart';
import 'package:vaz_cursos/components/detail_course/review_list.dart';
import 'package:vaz_cursos/models/course.dart';
import 'package:vaz_cursos/store/user.dart';

class DetailCourseInfo extends StatelessWidget {
  const DetailCourseInfo({Key key, this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    void showAuthDialog() {
      showDialog(
        context: context,
        builder: (dialogCtx) => Dialog(
          child: AuthComponent(
            instructions: 'Faça login para inscrever-se no curso',
            dialogCtx: dialogCtx,
          ),
        ),
      );
    }

    void subscribeCourse() {
      print("Inscrever-se");
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailCourseHeader(course: course),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: CachedImage(imageUrl: course.thumbnailUrl),
              ),
            ),
            ChipInfo(
              title: 'O que voce precisa saber',
              info: course.requirements,
            ),
            ChipInfo(
              title: 'O que voce vai aprender',
              info: course.learnship,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: Observer(
                  builder: (_) => RaisedButton(
                    onPressed: userStore.user == null
                        ? showAuthDialog
                        : subscribeCourse,
                    child: Text('INSCREVER-SE'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
            const Text('Descrição',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(children: <Widget>[Text(course.description)]),
            const SizedBox(height: 16.0),
            DetailCourseClassesList(classes: course.classes),
            DetailCourseReviewList(rates: course.reviews),
          ],
        ),
      ),
    );
  }
}
