import 'package:firstapp/States/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget{
  const CommentsPage({super.key});
  @override
  State<CommentsPage> createState()=>_CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage>{
  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final commentState=Provider.of<CommentState>(context);
    return Scaffold(
        body:Column(children: [
          Padding(
            padding:const EdgeInsets.all(12.0),
            child:Row(
              children: [
                Expanded(
                  child:TextField(
                    controller:controller,
                    decoration: const InputDecoration(
                      labelText:"Add A Comment",
                      border: OutlineInputBorder(),
                    ),
                  )
                ),
                IconButton(
                  icon:const Icon(Icons.add),
                  onPressed: (){
                    String comment=controller.text.trim();
                    if(comment.isNotEmpty){
                      commentState.addComment(comment);
                      controller.clear();
                    }
                  },
                )
              ],
            )
          ),
          const Divider(),
          Expanded(
              child: commentState.comments.isEmpty?const Center(child:Text("No Comments Yet")):ListView.builder(
                  itemCount:commentState.comments.length ,
                  itemBuilder: (context,index){
                  return ListTile(
                      title: Text(commentState.comments[index]),
                      trailing: IconButton( onPressed: ()=>commentState.removeComment(index),
                      icon: const Icon(Icons.delete))
              );
          }))
        ],)
    );
  }
}