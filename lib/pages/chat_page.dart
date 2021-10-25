import 'package:chatss/constants/colors.dart';
import 'package:chatss/widgets/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  static String id = "Chatscreen";
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextEditingController = TextEditingController();
  String message = "";
  User? loggedInUser = auth.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 22,
          ),
        ),
        title: Text(
          "chat screen",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStream(),
            // Expanded(
            //     child: Container(
            //   child: ChatBubble(
            //       loggedInUser!.email.toString(), "hiiiiiiiii", false),
            // )),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: TextField(
                        onChanged: (str) {
                          message = str;
                        },
                        controller: messageTextEditingController,
                        cursorColor: textColor,
                        cursorHeight: 25,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  BorderSide(color: textColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  BorderSide(color: textColor, width: 2),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  BorderSide(color: textColor, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  BorderSide(color: textColor, width: 2),
                            ),
                            filled: true,
                            fillColor: ACcolor,
                            hintText: 'say something...',
                            hintStyle: TextStyle(
                              color: textColor,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 20, 10),
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            // function when send button is pressed
                            var now = DateTime.now();
                            print("send button pressed");
                            print(message);
                            messageTextEditingController.clear();
                            firestore.collection('messages').add({
                              'sender': loggedInUser!.email,
                              'text':  message,
                              'time': now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString()+"-"+now.hour.toString()+"-"+now.minute.toString()+"-"+now.second.toString()
                            });
                          },
                          icon: Icon(Icons.send_rounded),
                          color: BGcolor,
                          iconSize: 30,
                        ),
                        backgroundColor: ACcolor2,
                        radius: 25,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy("time").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<ChatBubble> messageBubbles = [];
        for (var message in messages) {

          final messageSender = message.get('sender');
          final messageText = message.get('text');

          final currentUser = auth.currentUser?.email;

          final messageBubble = ChatBubble(
            messageSender,messageText,currentUser != messageSender
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }

  }

