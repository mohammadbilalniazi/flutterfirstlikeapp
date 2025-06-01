import 'package:firstapp/Pages/Home/my_home_page.dart';
import 'package:firstapp/myapp.dart';
import 'package:firstapp/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState()=>_LoginPageState();
}

class _LoginPageState  extends State<LoginPage>{
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

  void _login(){
    if(_formKey.currentState!.validate()){
      final email=_emailController.text;
      final password=_passwordController.text;
      //  TODO: Login check here (e.g., API call or dummy check)
      print("Login Attempt email:$email password:$password");

      if(email=="mohammad@gmail.com" && password=="123456"){
        // Navigate or show message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
        Navigator.pushReplacement(
            context,MaterialPageRoute(builder: (context)=>const NavBarPage())
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Not Success')));
      }
      //     // Navigate to home on success
    }
  } //_login

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: const Text("login")) ,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:Form(
            key:_formKey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Welcome",style:TextStyle(fontSize:15,fontWeight:FontWeight.bold)),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border:OutlineInputBorder(),
                  ),
                  validator: (value)=>value==null || !value.contains('@')?'Enter Valid Email':null,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller:_passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border:OutlineInputBorder(),
                  ),
                  validator: (value)=>value==null || value.length<6?'Password Must Be at least 6 character':null
                ),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: _login, child: const Text('Login',style: TextStyle(fontSize: 18)))
              ],
            )),
      ),
    );
  }

}