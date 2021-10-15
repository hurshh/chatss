import 'package:chatss/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonC extends StatefulWidget {
  String label;
  void Function() function;
  ButtonC({required this.label,required this.function});
  @override
  _ButtonCState createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Material(
        color: ACcolor2,
        borderRadius: BorderRadius.circular(25),
        child: MaterialButton(
          onPressed: widget.function,
          minWidth: double.infinity,
          height: 40,
          child: Text(widget.label,style: TextStyle(fontSize: 18,color: BGcolor),),
        ),
      ),
    );
  }
}
