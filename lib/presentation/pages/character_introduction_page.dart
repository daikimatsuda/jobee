import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/_core.dart';

class CharacterIntroductionPage extends StatefulWidget {
  const CharacterIntroductionPage({super.key});

  @override
  State<CharacterIntroductionPage> createState() => _CharacterIntroductionPageState();
}

class _CharacterIntroductionPageState extends State<CharacterIntroductionPage> {

  int activeIndex = 0;

  List<String> characterImgList = [
    "images/character_red.png",
    "images/character_blue.png",
    "images/character_yellow.png",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('キャラクター選択'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 400,
                initialPage: 0,
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
              itemCount: characterImgList.length, 
              itemBuilder: (context, index, realIndex) {
                final path = characterImgList[index];
                return buildImage(path, index);
              }, 
            ),
            SizedBox(height:  20,),
            buildIndicator(),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 0), // 横幅200を指定
              ),
              onPressed: activeIndex >= 0 ? () {
                Navigator.pushNamed(context, Routes.characterIntroduction);
              } : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('選択',style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex, 
    count: characterImgList.length,
    effect: JumpingDotEffect(
      activeDotColor: Colors.green,
      dotHeight: 20,
      dotWidth: 20,
      dotColor: Colors.white
    ),
  );

  Widget buildImage(path, index) => Container(
    //画像間の隙間
    margin: EdgeInsets.symmetric(horizontal: 13),
    color: Colors.grey,
    child: Column(
      children: [
        Image.asset(
          path,
          fit: BoxFit.cover,
        ),
        SizedBox(height:  20,),
        ClipRect(
          child: Container(
            width: 200,
            child: Text('説明～～～～')
          )
        )
      ],
    ),
  );
}





