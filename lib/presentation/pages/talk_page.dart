import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({super.key});

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {

  List<String> messages = [
    '△△さん、はじめまして！\n僕の名前は、〇〇といいます！\nこれからよろしくです！',
    'まずはじめに～～～～',
    'あなたの長所をおしてくれませんか？',
  ];

  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage() {
    setState(() {
      messages.add(_textEditingController.text);
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('トーク'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return CounselorTalk(index);
              },
            ),
          ),
          const Divider(height: 0.5,color: Colors.grey,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration.collapsed(
                        hintText: 'メッセージを入力',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.white, // アイコンの色を白に設定
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CounselorTalk(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black87,
            backgroundImage: AssetImage("images/character_blue.png"),
            radius: 24.0,
          ),
          SizedBox(width: 8.0,),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  messages[index],style: TextStyle(color: Colors.white),
                  softWrap: true,
                )
              )
            
            )
        ]
      ),
    );
  }
}