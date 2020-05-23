class User {
  int id;
  String name;
  String email;
  String profileImage;
  DateTime createdAt;
  String shortDescription;
  String description;
  double rate;
  int reviews;
  int students;
  int courses;

  User({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.createdAt,
    this.shortDescription,
    this.description,
    this.rate,
    this.reviews,
    this.students,
    this.courses,
  });
}
