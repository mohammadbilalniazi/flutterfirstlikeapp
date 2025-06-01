import 'package:firstapp/Pages/Comment/comment_page.dart';
import 'package:firstapp/Pages/Home/my_home_page.dart';
import 'package:firstapp/Pages/User/login.dart';
import 'package:firstapp/Pages/User/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final List<String> _titles=["Home","User","Comment"];
  final List<IconData> _titleIcons=[Icons.home,Icons.person,Icons.comment];
  void _onNavTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Row(
          children: [
            Image.asset('lib/Assets/Images/logo.jpg',height: 32,width: 32),
            const SizedBox(width:20),
            Icon(_titleIcons[_selectedIndex]),
            const SizedBox(width: 8),
            Text(_titles[_selectedIndex])
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions:[
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
          }, icon: Icon(Icons.logout))
        ],
      ),
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