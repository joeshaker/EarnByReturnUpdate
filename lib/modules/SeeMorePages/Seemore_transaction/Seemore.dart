import 'package:flutter/material.dart';

class SeemoreScreen extends StatelessWidget {
  const SeemoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.green),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Recycled 404',style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 30,),
                Text('120',style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                Text('coins',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
              ],
            ) ,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Gift details',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.green
                  ),),
                  SizedBox(height: 10,),
                  Text('10 - 12 - 2023  .  12:00 AM',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black
                  ),),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 200.0),
                    child: Column(
                      children: [
                        Text('Transaction Id',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black
                        ),),
                        SizedBox(height: 5,),
                        Text('6828828818',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey[500]
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 5
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/img_2.png'),height: 80,),
                                SizedBox(height: 3,),
                                Text('Recycled cans',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                ),),
                                SizedBox(height: 3,),
                                Text('9',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 5
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/img_3.png'),height: 80,),
                                SizedBox(height: 3,),
                                Text('Recycled bottles',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                                SizedBox(height: 3,),
                                Text('9',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 5
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/img.png'),height: 80,),
                                SizedBox(height: 3,),
                                Text('Coins',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                                SizedBox(height: 3,),
                                Text('9',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 5
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/money.png'),height: 80,),
                                SizedBox(height: 3,),
                                Text('Money',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                                SizedBox(height: 3,),
                                Text('9',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 5
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('assets/images/img_4.png'),height: 80,),
                                SizedBox(height: 3,),
                                Text('Machine ID',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  ),),
                                SizedBox(height: 3,),
                                Text('9',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
