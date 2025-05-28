import 'package:firstapp/Pages/Home/home_page_body.dart';
import 'package:firstapp/States/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget { //A StatefulWidget because it needs to store changing values (_counter and _like).
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _indexComment = 0;
  void likePost(CommentState commentState) {
    commentState.likePost(_indexComment);
  }
  void dislikePost(CommentState commentState){
    commentState.dislikePost(_indexComment);
  }
  void onNext(CommentState commentState) {
    if (_indexComment == commentState.comments.length - 1) {
      return;
    }
    else {
      setState(() {
        _indexComment++;
      });
    }
  }
  void onPrevious(){
      if(_indexComment==0 ){
        return;
      }
      else{
        setState((){
          _indexComment--;
        });
      }
  }

  @override
  Widget build(BuildContext context){
    final commentState=Provider.of<CommentState>(context);
    final commentIsNotEmpty=commentState.comments.isNotEmpty;
    return Scaffold(
      body:commentIsNotEmpty?buildBodyUI(context, commentState.comments, _indexComment, commentState.likes, commentState.totalLikes, ()=>onNext(commentState), ()=>onPrevious()):const Center(child:Text("No Comments")),
      floatingActionButton: Column(
          mainAxisAlignment:MainAxisAlignment.end,
          children:[
            FloatingActionButton(onPressed: ()=>likePost(commentState),tooltip: 'Like/Increment',child: const Icon(Icons.thumb_up),),
            const SizedBox(width:8),
            FloatingActionButton(onPressed: ()=>dislikePost(commentState),tooltip: 'unLike/decrement',child: const Icon(Icons.thumb_down),),
          ]
      ),
    );
  }
}