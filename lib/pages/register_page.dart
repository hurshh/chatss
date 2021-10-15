import 'package:chatss/constants/colors.dart';
import 'package:chatss/widgets/ButtonCust.dart';
import 'package:chatss/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  onPressed: (){},
                  minWidth: double.infinity,
                  height: 40,
                  child: Text('send\n otp',style: TextStyle(fontSize: 15,color: BGcolor),),
                ),
              ),)
            ],
          ),
          TextFieldCust(label: "password",textChange: (string){regisPass = string;},),
          TextFieldCust(label: "OTP",textChange: (string){otp = string;},),
          ButtonC(label: "submit",function: (){},)
        ],
      ),
    );
  }
}
