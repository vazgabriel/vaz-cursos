import 'package:vaz_cursos/models/course_class.dart';
import 'package:vaz_cursos/models/course_rate.dart';
import 'package:vaz_cursos/models/user.dart';

class Course {
  int id;
  String name;
  String thumbnailUrl;
  String shortDescription;
  String description;
  List<String> requirements;
  List<String> learnship;
  User teacher;
  int minutes;
  double rate;
  int students;
  int totalReviews;
  List<CourseRate> reviews;
  List<CourseClass> classes;

  Course({
    this.id,
    this.name,
    this.thumbnailUrl,
    this.shortDescription,
    this.description,
    this.requirements,
    this.learnship,
    this.teacher,
    this.minutes,
    this.rate,
    this.students,
    this.totalReviews,
    this.reviews,
    this.classes,
  });
}
