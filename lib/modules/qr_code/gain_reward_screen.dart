import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/bottomnavbar/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layout/earn_by_return_layout/app_layout.dart';
import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/styles/colorsEarn.dart';
import '../login/login_screen.dart';

class GainRewardScren extends StatelessWidget {
  var coins;
  var money;

  GainRewardScren({super.key, required this.coins, required this.money});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: closeIcon,
          onPressed: () {
            navigateTo(context, Bottonav());
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                    fit: BoxFit.scaleDown,
                    height: 350,
                    width: 300,
                    image: AssetImage('assets/images/coins.jpg')),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  style: TextStyle(
                      color: defaultColor,
                      fontWeight: FontWeight.bold, fontSize: 25),
                  "Reward Gain successfully"),

              SizedBox(
                height:50,
              ),
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[300]

                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Image(
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                              image: AssetImage('assets/images/coins.png')),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              '$coins',
                              style: TextStyle(
                                  color: defaultColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'coins',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
width:2,
                      height: 60,
                      decoration: BoxDecoration(

                        color: Colors.white,

                      ),




                    ),//divder as line
                    Row(
                      children: [
                        Center(
                          child: Image(
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                              image: AssetImage('assets/images/money.png')),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              '$money',
                              style: TextStyle(
                                  color: defaultColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Pounds',
                              style:
                              TextStyle(color: Colors.black, fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              // ConditionalBuilder(
              //
              //     // condition: state is! RegisterLoadingstate,
              //     condition: true,
              //     builder: (context) => defaultButton(
              //         // clickable: clickable,
              //         width: 320,
              //         // background: clickable
              //         //     ? defaultColor
              //         //     : Colors.grey,
              //         clickable: true,
              //         background: true ? defaultColor : Colors.grey,
              //         function: () {
              //
              //         },
              //         text: 'Go To Home'),
              //     fallback: (context) =>
              //         const Center(child: CircularProgressIndicator())),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
