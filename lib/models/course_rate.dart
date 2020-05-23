import 'package:vaz_cursos/models/user.dart';

class CourseRate {
  int id;
  double rate;
  String description;
  User ratedBy;
  DateTime createdAt;

  CourseRate({
    this.id,
    this.rate,
    this.description = '',
    this.ratedBy,
    this.createdAt,
  });
}
