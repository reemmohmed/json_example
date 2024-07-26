// lib/user_model.dart

import 'dart:convert';

class UserModel {
  final String name;
  final int age;
  final String email;

  UserModel({
    required this.name,
    required this.age,
    required this.email,
  });

  // تحويل من JSON إلى نموذج بيانات
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  // تحويل من نموذج بيانات إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}
