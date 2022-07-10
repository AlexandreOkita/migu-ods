// ignore_for_file: use_build_context_synchronously

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:migu/components/add_new_employee_button.dart';
import 'package:migu/components/employee_tile_list.dart';
import 'package:migu/firebase_options.dart';
import 'package:migu/pages/mentorships_page.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff263238),
          ),
          headline4: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff263238),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff263238),
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: Color(0xff263238),
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: Color(0xff767171),
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            color: Color(0xFF6200EE),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MentorshipsPage();
  }
}
