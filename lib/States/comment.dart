import 'package:flutter/cupertino.dart';

class CommentState extends ChangeNotifier{
  final List<String> _comments=[];
  List<String> get comments=>_comments;
  final List<int> _likes=[];
  List<int> get likes=>_likes;
  int get totalLikes=>_likes.fold(0,(sum,item)=>sum+item);
  void addComment(String comment){
    _comments.add(comment);
    _likes.add(0); // each comment starts with 0
    notifyListeners();
  }
  void removeComment(int index){
    _comments.removeAt(index);
    _likes.removeAt(index);
    notifyListeners();
  }

  void likePost(int index) {
      print("########before like $totalLikes  likes $_likes");
      _likes[index]++;
      notifyListeners();
  }
  void dislikePost(int index){
      _likes[index]--;
      notifyListeners();
  }
}