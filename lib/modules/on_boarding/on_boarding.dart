import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../shared/component/component/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colorsEarn.dart';
import '../login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.body,
    required this.image,
    required this.title,
  }) {}
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/page1.jpg',
      body: 'collect the empty bottles, and put them in the nearest machine.',
      title: 'Recycle',
    ),
    BoardingModel(
      image: 'assets/images/page2.jpg',
      body: 'You will earn points that will be converted to cash.',
      title: 'Cash Back',
    ),
    BoardingModel(
      image: 'assets/images/page3.jpg',
      body: 'Save tha planet and keep it clean.',
      title: 'Save the planet',
    ),
  ];

  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigateAndFinish(context, LoginScreen());
                CacheHelper.saveData(key: 'onBoarding',value: true);
              },
              child: Text(style: TextStyle(color: Colors.black), "skip"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemCount: boarding.length,
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index])),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ColorTransitionEffect(
                      activeDotColor: defaultColor,
                      dotColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
                      color: defaultColor,
                    ),

                    child: TextButton(
                      onPressed: () {
                        if (isLast) {
                          navigateAndFinish(context, LoginScreen());
                          CacheHelper.saveData(key: 'onBoarding',value: true);
                        } else
                          (boardController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.fastEaseInToSlowEaseOut));
                      },
                      child: Text(
                          style:TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                          ),
                          isLast?"Get Started":"Next"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(top:30),
        child: Text(
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            '${model.title}'),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        // width: 300,
        child:
        Image(fit: BoxFit.cover, image: AssetImage('${model.image}')),
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 40),
        alignment: AlignmentDirectional.center,
        child: Text(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14,
              color: HexColor('#9B9B9B'),

            ),
            '${model.body}'
        ),
      )
    ],
  );
}
