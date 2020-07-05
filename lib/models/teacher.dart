import 'package:flutter/material.dart';

class Teacher {
  int id;
  String description;
  String shortDescription;
  String createdAt;

  Teacher({
    @required this.id,
    @required this.description,
    @required this.shortDescription,
    @required this.createdAt,
  });

  factory Teacher.fromJson(Map<String, dynamic> teacherJSON) {
    return Teacher(
      id: teacherJSON['id'],
      description: teacherJSON['description'],
      shortDescription: teacherJSON['short_description'],
      createdAt: teacherJSON['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'description': this.description,
      'short_description': this.shortDescription,
      'created_at': this.createdAt,
    };
  }
}
