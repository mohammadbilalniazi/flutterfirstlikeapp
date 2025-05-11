import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
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
      home: const MyHomePage(title: 'FlutterLikeApp'),
    );
  }
}

class MyHomePage extends StatefulWidget { //A StatefulWidget because it needs to store changing values (_counter and _like).
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _like=0;
  final List<String> messages=[
    'He is good',
    'She is great',
    'He is smart',
  ];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      _counter++;
      _like++;
    });
  }
  void __decrementCounter(){
    setState((){
      _counter--;
      _like--;
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
            const Text('You Have Pressed'),
            Text('$_counter',style: Theme.of(context).textTheme.headlineMedium,),
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
          FloatingActionButton(onPressed: _incrementCounter,tooltip: 'Like/Increment',child: const Icon(Icons.thumb_up),),
          const SizedBox(width:8),
          FloatingActionButton(onPressed: __decrementCounter,tooltip: 'unLike/decrement',child: const Icon(Icons.thumb_down),),
        ]
      ),

    );

  }
}
