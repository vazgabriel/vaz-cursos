class CourseClass {
  int id;
  String title;
  String youtubeId;
  String description;
  bool watched;

  CourseClass({
    this.id,
    this.title,
    this.youtubeId,
    this.description = '',
    this.watched = false,
  });
}
