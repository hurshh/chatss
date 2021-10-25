import 'package:chatss/constants/colors.dart';
import 'package:chatss/pages/loading_screen.dart';
import 'package:chatss/pages/register_page.dart';
import 'package:chatss/widgets/ButtonCust.dart';
import 'package:chatss/widgets/text_field.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginEmail = "";
  String loginPassword = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> loginFirebase() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: loginEmail,
          password: loginPassword
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    auth.authStateChanges()
        .listen((User? user) {
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded,size: 22,),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Hero(child: Image(image: AssetImage('assests/kitty.png'),height: 300,width: 300,),tag: 'kitty',)),
          TextFieldCust(label: "E-mail",textChange: (string){loginEmail = string;print(loginEmail);},),
          TextFieldCust(label: "password",textChange: (string){loginPassword = string;print(loginPassword);},),
          ButtonC(label: 'login',function: (){
            //function when login button is triggered
            loginFirebase();
          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('not a user?',style: TextStyle(fontSize: 18)),
              FlatButton(onPressed: (){Navigator.pushNamed(context, RegisterationPage.id);}, child: Text('Register',style: TextStyle(fontSize: 18,color: ACcolor2)),padding: EdgeInsets.all(0),)
            ],
          )
        ],
      ),
    );
  }
}
