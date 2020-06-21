import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String email;
  String profileImage;
  String createdAt;
  String shortDescription;
  String description;
  double rate;
  int reviews;
  int students;
  int courses;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.createdAt,
    this.profileImage,
    this.shortDescription,
    this.description,
    this.rate,
    this.reviews,
    this.students,
    this.courses,
  });

  factory User.fromJson(Map<String, dynamic> userJSON) {
    return User(
      id: userJSON['id'],
      name: userJSON['name'],
      email: userJSON['email'],
      createdAt: userJSON['created_at'],
      profileImage: userJSON['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'created_at': this.createdAt,
      'profile_image': this.profileImage,
    };
  }
}
