import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/_core.dart';
import 'package:jobeee/presentation/_presentation.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {

  int _currentIndex = 0;
  String selectedImagePath = "images/character_red.png";

  List<String> characterImgList = [
    "images/character_red.png",
    "images/character_blue.png",
    "images/character_yellow.png",
  ];

  final List<String> descriptionList = [
    'キャラクター名：紅雨 翔太\n性格：翔太は情熱的で行動的な性格です。決断力があり、リーダーシップを発揮することができます。しかし、時には熱くなりすぎて周囲との協調性に欠けることがあるため、周囲とのコミュニケーションを大切にしています。',
    '青の説明',
    '黄色の説明',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('キャラクター選択'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 600,
                initialPage: 0,
                onPageChanged:(index, reason) {
                  setState(() {
                    _currentIndex = index;
                    selectedImagePath = characterImgList[index];
                  });
                },
              ),
              items: characterImgList.asMap().entries.map((e) {
                int index = e.key;
                String image = e.value;
                return Builder(
                  builder: (context) {
                    return Container(
                      height: 400,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(image,height: 300,fit: BoxFit.contain,)
                            )
                          ),
                          SizedBox(height: 50.0),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0,right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 2),
                                  )
                                ]
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                descriptionList[index],
                                style: TextStyle(fontSize: 16.0,color: Colors.white),
                              ),
                            ),
                          )
                        ]
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: characterImgList.length, // 画像の数に合わせて設定
            effect: JumpingDotEffect(
              activeDotColor: Colors.green,
              dotHeight: 20,
              dotWidth: 20,
              dotColor: Colors.white
            ),// インジケータのデザインを指定
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              jobeeConfilmDialog(
                context, 
                imagePath: selectedImagePath,
                content: "選択したキャラクターでいいですか", 
                onApproved: () {
                  Navigator.pushNamed(context, Routes.talk);
                },
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 137, 166, 216), 
                    Color.fromARGB(255, 81, 106, 187), 
                    Color.fromARGB(255, 42, 68, 151)
                    ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: const Text('選択',style:TextStyle(fontSize: 20)),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
