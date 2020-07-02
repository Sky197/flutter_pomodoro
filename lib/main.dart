import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        appBarTheme: AppBarTheme(
          color: Colors.grey[900],
        ),
        scaffoldBackgroundColor: Colors.redAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[900],
          splashColor: Colors.black26,
          elevation: 24,
          focusElevation: 24,
        ),
      ),
      home: Home(),
    );
  }
}
