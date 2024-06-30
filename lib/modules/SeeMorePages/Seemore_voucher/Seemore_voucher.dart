import 'package:flutter/material.dart';

class Seemore_voucher extends StatelessWidget {
  const Seemore_voucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
        body:
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
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
              height: 555,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Voucher Details',style: TextStyle(
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
                        Container(
                          width: 300,
                          height: 350,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.green,
                                width: 2
                            ),
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/images/mac.png'),height: 50,),
                                  SizedBox(width: 10,),
                                  Text('MacDonalds',style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19

                                  ),)
                                ],
                              ),
                              Image(image: AssetImage('assets/images/bigmac.png'),height: 220,),
                              SizedBox(height: 3,),
                              Text('Big Mac',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),),
                              SizedBox(height: 3,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/images/img.png'),height: 42,),
                                  SizedBox(width: 10,),
                                  Text('800',style:TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500
                                  ) ,),
                                  SizedBox(width: 30,),
                                  Text('|',style:TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                    color: Colors.green
                                  ) ,),
                                  SizedBox(width: 30,),
                                  Image(image: AssetImage('assets/images/money.png'),height: 42,),
                                  SizedBox(width: 10,),
                                  Text('295',style:TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500
                                  ) ,),
                                ],
                              )
                            ],
                          ),
                        ),
                          ],
                        ),
                      ],
                    ),
              ),
              ),
          ],
        )
    );
  }
}
