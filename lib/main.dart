import 'package:flutter/material.dart';
import 'package:nail_app/screens/home/HomeScreen.dart';
import 'package:nail_app/screens/signin/EnterPhone.dart';
import 'package:nail_app/screens/signin/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      // routes: {"/": (context) => SignIn(), "/home": (context) => HomeScreen()},
      home: SignIn(),
    );
  }
}