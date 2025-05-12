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
  int _like=0;

  final List<String> messages=[
    'Hello','Go','Run'
  ];

  void likePost() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      print("########before like $_like  likes $_likes");
      _like++;
      _likes[_indexMessage]++;
    });
  }
  void dislikePost(){
    setState((){
      _like--;
      _likes[_indexMessage]--;
    });
  }
  void _incrementMessageIndex(){
    setState((){
      if(_indexMessage==messages.length-1){
        return;
      }
      _indexMessage++;
      
    });
  }
  void _decrementMessageIndex(){
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
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(child:Text(messages[_indexMessage],style:Theme.of(context).textTheme.headlineLarge)),
                  Text('❤️ ${_likes[_indexMessage]}',style:Theme.of(context).textTheme.headlineLarge)
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: _decrementMessageIndex,tooltip:'Go Left',child: const Icon(Icons.arrow_left)),
                const SizedBox(width: 15),
                FloatingActionButton(onPressed: _incrementMessageIndex,tooltip:'Go Right',child: const Icon(Icons.arrow_right)),
              ],
              ),
              Container(margin: EdgeInsets.only(top:20),
                child:Text('You Have Pressed',style:TextStyle(fontSize:20)) ,
              ),
              Text('$_indexMessage',style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite,color:Colors.red),
                  const SizedBox(width: 8),
                  Text('$_like likes',style:Theme.of(context).textTheme.headlineSmall,)
                ],
              )
            ],
          )
      ),//Body
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