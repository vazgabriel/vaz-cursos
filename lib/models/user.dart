import 'package:flutter/material.dart';
import 'package:vaz_cursos/models/teacher.dart';

class User {
  int id;
  String name;
  String email;
  String profileImage;
  String createdAt;
  Teacher teacher;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.createdAt,
    this.profileImage,
    this.teacher,
  });

  factory User.fromJson(Map<String, dynamic> userJSON) {
    return User(
      id: userJSON['id'],
      name: userJSON['name'],
      email: userJSON['email'],
      createdAt: userJSON['created_at'],
      profileImage: userJSON['profile_image'],
      teacher: userJSON.containsKey('teacher')
          ? Teacher.fromJson(userJSON['teacher'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userJSON = {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'created_at': this.createdAt,
      'profile_image': this.profileImage,
    };

    if (this.teacher != null) {
      userJSON['teacher'] = this.teacher.toJson();
    }

    return userJSON;
  }
}
