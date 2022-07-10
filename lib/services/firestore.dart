import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:migu/models/employee.dart';

class Firestore {
  Future<List<List<String>>> getAllMentorships() async {
    return FirebaseFirestore.instance.collection("mentorship").get().then((value) => value.docs
        .map((e) => [e.data()["mentee"] as String, e.data()["mentor"] as String])
        .toList());
  }

  Future<List<String>> getAllPending() async {
    return FirebaseFirestore.instance
        .collection("pending")
        .get()
        .then((value) => value.docs.map((e) => e.data()["id"] as String).toList());
  }

  Future<List<Employee>> getAllEmployee() async {
    return FirebaseFirestore.instance
        .collection("entries")
        .get()
        .then((value) => value.docs.map((e) {
              return Employee.fromMap(e.data(), e.id);
            }).toList());
  }
}
