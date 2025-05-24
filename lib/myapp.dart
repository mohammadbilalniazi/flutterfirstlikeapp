import 'package:firstapp/Pages/Comment/comment_page.dart';
import 'package:firstapp/Pages/Home/my_home_page.dart';
import 'package:firstapp/Pages/User/login.dart';
import 'package:firstapp/Pages/User/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget { //does not hold mutable state
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class NavBarPage extends StatefulWidget{
  const NavBarPage({super.key});
  @override
  State<NavBarPage> createState()=>_NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage>{
  int _selectedIndex=0;
  final List<Widget> _pages=const [
    MyHomePage(title: 'My App'),
    UserPage(),
    CommentsPage(),
  ];
  void _onNavTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onNavTap,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:'User'),
        BottomNavigationBarItem(icon: Icon(Icons.comment),label:'Comment'),
        ]),
    );
  }
}