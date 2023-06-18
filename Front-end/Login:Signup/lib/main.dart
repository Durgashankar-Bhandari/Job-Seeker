//ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:job_seeker/Welcome.dart';
import 'package:job_seeker/Login.dart';
import 'package:job_seeker/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
