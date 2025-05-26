import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget{
  const CommentsPage({super.key});
  @override
  State<CommentsPage> createState()=>_CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage>{
  final List<String> _comments=[];
  final TextEditingController _controller=TextEditingController();

  void _addComment(){
    final text=_controller.text.trim();
    if(text.isNotEmpty){
      setState((){
        _comments.add(text);
        _controller.clear();
      });
    }
  }

  void _deleteComment(int index){
    setState((){
      _comments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Column(children: [
          Padding(
            padding:const EdgeInsets.all(12.0),
            child:Row(
              children: [
                Expanded(
                  child:TextField(
                    controller:_controller,
                    decoration: const InputDecoration(
                      labelText:"Add A Comment",
                      border: OutlineInputBorder(),
                    ),
                  )
                ),
                IconButton(
                  icon:const Icon(Icons.add),
                  onPressed: _addComment,
                )
              ],
            )
          ),
          const Divider(),
          Expanded(
              child: _comments.isEmpty?const Center(child:Text("No Comments Yet")):ListView.builder(
                  itemCount:_comments.length ,
                  itemBuilder: (context,index){
                  return ListTile(
                      title: Text(_comments[index]),
                      trailing: IconButton(onPressed:()=> _deleteComment(index),
                      icon: const Icon(Icons.delete))
              );
          }))
        ],)
    );
  }
}