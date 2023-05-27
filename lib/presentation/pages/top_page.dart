import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobeee/core/util/common_util.dart';

import '../../core/_core.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'jobeee',
                    style: TextStyle(fontSize: 50,color: Colors.white),
                  ),
                )
              ],
            ),
            CommonUtil.gap(height: 30),
            Padding(
              padding:const EdgeInsets.all(10.0),
              child: Text(
                'あなたのキャリアに関する悩みを何でも相談できるAIチャットサービス',
                style: GoogleFonts.mochiyPopOne(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
                ),
              ), 
            ),
            CommonUtil.gap(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('使ってみる'),
                  ),
                ),
              ]
            ),
            CommonUtil.gap(height: 20),
          ]
        ),
      ),
    );
  }
}