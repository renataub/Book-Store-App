import 'package:book_app/model/model.dart';
import 'package:flutter/material.dart';
import 'screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleDarkMode() {
    setState(() {
      isDarkMode =!isDarkMode;
    });
  }

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: LoginPage(
        toggleDarkMode: toggleDarkMode,
        isDarkMode: isDarkMode,
      ),
    );
  }

}

List<Book> cart = [];
