import 'package:chatss/constants/colors.dart';
import 'package:chatss/pages/chat_page.dart';
import 'package:chatss/pages/home_page.dart';
import 'package:chatss/pages/loading_screen.dart';
import 'package:chatss/pages/login_page.dart';
import 'package:chatss/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: BGcolor,
      scaffoldBackgroundColor: BGcolor,
      appBarTheme: const AppBarTheme(
        backgroundColor: BGcolor,
        shadowColor: Colors.transparent,
      ),
      textTheme: const TextTheme(bodyText1: TextStyle(color: textColor),bodyText2: TextStyle(color: textColor),subtitle1: TextStyle(color: textColor),subtitle2: TextStyle(color: textColor)),
    ),
    initialRoute: HomePage.id,
    routes: {
      HomePage.id: (context) => HomePage(),
      LoginPage.id: (context) => LoginPage(),
      RegisterationPage.id: (context) => RegisterationPage(),
      ChatScreen.id: (context) => ChatScreen(),
    },
  ));
}

