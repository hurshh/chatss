import 'package:chatss/functions/firebase_initialliztion.dart';
import 'package:chatss/pages/login_page.dart';
import 'package:chatss/pages/register_page.dart';
import 'package:chatss/widgets/ButtonCust.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'home page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Hero(child: Image(image: AssetImage('assests/kitty.png'),height: 300,width: 300,),tag: 'kitty',)),
          SizedBox(height: 10,),
          ButtonC(label: 'login',function: (){Navigator.pushNamed(context, LoginPage.id);},),
          ButtonC(label: 'register', function: (){Navigator.pushNamed(context, RegisterationPage.id);},)
        ],
      ),
    );
  }
}
