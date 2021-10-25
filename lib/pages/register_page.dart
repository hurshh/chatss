import 'package:chatss/constants/colors.dart';
import 'package:chatss/pages/chat_page.dart';
import 'package:chatss/widgets/ButtonCust.dart';
import 'package:chatss/widgets/text_field.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({Key? key}) : super(key: key);
  static String id = 'register_page';
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  String regisEmail="";
  String regisPass="";
  String otp="";
  late EmailAuth emailAuth;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }
  bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: regisEmail,
        userOtp: otp));
    return emailAuth.validateOtp(
        recipientMail: regisEmail,
        userOtp: otp);
  }
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: regisEmail, otpLength: 5);
    if (result) {
      // using a void function because i am using a
      // stateful widget and seting the state from here.
      setState(() {
      });
    }
  }
  Future<void> regisFirebase() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: regisEmail,
          password: regisPass
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    auth.authStateChanges().listen((User? user) {
      if(user!=null){
        Navigator.pushNamed(context, ChatScreen.id);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_rounded,size: 22,),),
        title: Text("Register",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Hero(child: Image(image: AssetImage('assests/kitty.png'),height: 300,width: 300,),tag: 'kitty',)),
          Row(
            children: [
              Expanded(child: TextFieldCust(label: "E-mail",textChange: (string){regisEmail = string;print(regisEmail);},),flex: 4,),
              Expanded(child: Material(
                color: ACcolor2,
                borderRadius: BorderRadius.circular(35),
                child: MaterialButton(
                  onPressed: (){
                    // send otp button function
                    sendOtp();
                  },
                  minWidth: double.infinity,
                  height: 40,
                  child: Text('send\n otp',style: TextStyle(fontSize: 15,color: BGcolor),),
                ),
              ),)
            ],
          ),
          TextFieldCust(label: "password",textChange: (string){regisPass = string;},),
          TextFieldCust(label: "OTP",textChange: (string){otp = string;},),
          ButtonC(label: "submit",function: (){
            bool otpverified = verify();
            if(otpverified==true){
              regisFirebase();
            }
          },)
        ],
      ),
    );
  }
}
