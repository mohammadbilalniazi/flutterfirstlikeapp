import 'package:firstapp/Pages/Comment/comment_page.dart';
import 'package:firstapp/Pages/Home/my_home_page.dart';
import 'package:firstapp/Pages/User/login.dart';
import 'package:firstapp/Pages/User/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget { //does not hold mutable state
  const MyApp({super.key,required this.title});
  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      // home: const MyHomePage(title: 'Like'),
      // home:const NavBarPage(),
      home:const LoginPage()
    );
  }
}

