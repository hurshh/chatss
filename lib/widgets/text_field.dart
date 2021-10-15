import 'package:chatss/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCust extends StatefulWidget {
  String label;
  void Function(String str) textChange;
  TextFieldCust({required this.label,required this.textChange});
  @override
  _TextFieldCustState createState() => _TextFieldCustState();
}

class _TextFieldCustState extends State<TextFieldCust> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        onChanged: widget.textChange,
        style: TextStyle(color: textColor),
        cursorColor: textColor,
        cursorHeight: 25,
        decoration: InputDecoration(
          labelText: widget.label,
          focusColor: ACcolor,
          labelStyle: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: textColor,width: 2),

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: textColor,width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: textColor,width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: textColor,width: 2),
          ),
          filled: true,
          fillColor: ACcolor,
        ),

      ),
    );
  }
}
