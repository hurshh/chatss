import 'package:chatss/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  String user;
  String Message;
  bool others;

  ChatBubble(this.user,this.Message, this.others);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: widget.others ? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Text(widget.user,style: TextStyle(fontSize: 14),),
          Material(
            elevation: 10,

            borderRadius:widget.others ? BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20)):BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: widget.others ? textColor:ACcolor2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(widget.Message,style: TextStyle(fontSize: 20,color: widget.others ?ACcolor2:BGcolor),),
            ),
          )
        ],
      ),
    );
  }
}
