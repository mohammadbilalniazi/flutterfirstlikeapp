import 'package:firstapp/Pages/Home/home_page_body.dart';
import 'package:firstapp/Pages/User/login.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget { //A StatefulWidget because it needs to store changing values (_counter and _like).
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _indexMessage = 0;
  List <int> _likes=[0,0,0];
  int totalLikes=0;

  final List<String> messages=[
    'Hello','Go','Run'
  ];

  void likePost() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      print("########before like $totalLikes  likes $_likes");
      totalLikes++;
      _likes[_indexMessage]++;
    });
  }
  void dislikePost(){
    setState((){
      totalLikes--;
      _likes[_indexMessage]--;
    });
  }
  void onNext(){
    setState((){
      if(_indexMessage==messages.length-1){
        return;
      }
      _indexMessage++;
      
    });
  }
  void onPrevious(){
    setState((){
      if(_indexMessage==0 ){
        return;
      }
      _indexMessage--;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions:[
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
          }, icon: Icon(Icons.logout))
        ],
      ),
      // body: Center( previously it was there
      //     )
      // ),//Body
      body:buildBodyUI(context, messages, _indexMessage, _likes, totalLikes, onNext, onPrevious),
      floatingActionButton: Column(
          mainAxisAlignment:MainAxisAlignment.end,
          children:[
            FloatingActionButton(onPressed: likePost,tooltip: 'Like/Increment',child: const Icon(Icons.thumb_up),),
            const SizedBox(width:8),
            FloatingActionButton(onPressed: dislikePost,tooltip: 'unLike/decrement',child: const Icon(Icons.thumb_down),),
          ]
      ),

    );

  }
}