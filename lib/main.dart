import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(GymApp());
}

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Store',
      theme: ThemeData(primarySwatch: Colors.red),
      home: LoginScreen(),
    );
  }
}
