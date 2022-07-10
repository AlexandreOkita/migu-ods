import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String name;
  final String surname;
  final String area;
  final String email;
  final String id;

  Employee(
      {required this.id,
      required this.name,
      required this.surname,
      required this.area,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'sobrenome': surname,
      'area': area,
      'email': email,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map, String id) {
    return Employee(
      name: map['nome'] ?? '',
      surname: map['sobrenome'] ?? '',
      area: map['area'] ?? '',
      email: map['email'] ?? '',
      id: id,
    );
  }

  String toJson() => json.encode(toMap());

}
