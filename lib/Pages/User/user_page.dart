import 'package:flutter/cupertino.dart';

class UserPage extends StatelessWidget{
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('👤 User Page',style: TextStyle(fontSize:24)),
    );
  }
}