
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildBodyUI(BuildContext context,List<String> messages,int indexMessage,List<int> likes,int totalLikes,VoidCallback onNext,VoidCallback onPrevious){
  return
      Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(child:Text(messages[indexMessage],style:Theme.of(context).textTheme.headlineLarge)),
                  Text('❤️ ${likes[indexMessage]}',style:Theme.of(context).textTheme.headlineLarge)
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: onPrevious,tooltip:'Go Left',child: const Icon(Icons.arrow_left)),
                  const SizedBox(width: 15),
                  FloatingActionButton(onPressed: onNext,tooltip:'Go Right',child: const Icon(Icons.arrow_right)),
                ],
              ),
              Container(margin: EdgeInsets.only(top:20),
                child:Text('You Have Pressed',style:TextStyle(fontSize:20)) ,
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite,color:Colors.red),
                  const SizedBox(width: 8),
                  Text('$totalLikes likes',style:Theme.of(context).textTheme.headlineSmall,)
                ],
              )
            ],
          )
      );

}