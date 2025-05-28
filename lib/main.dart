import 'package:firstapp/States/comment.dart';
import 'package:firstapp/myapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(create: (_)=>CommentState(),child: const MyApp(title: 'My App'))
  );
}



