import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FormEntry {
  final DateTime birthday;
  final String seniority;

  FormEntry(this.birthday, this.seniority);

  void toDatabase() {
    final db = FirebaseFirestore.instance;
    db.collection("entries").add(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'birthday': birthday.millisecondsSinceEpoch,
      'seniority': seniority,
    };
  }

  factory FormEntry.fromMap(Map<String, dynamic> map) {
    return FormEntry(
      DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      map['seniority'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FormEntry.fromJson(String source) => FormEntry.fromMap(json.decode(source));
}
