import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/SeeMorePages/Seemore_transaction/see_more_transaction_cubit.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeemoreScreen extends StatelessWidget {
  const SeemoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SeeMoreTransactionCubit()..getuserData(),
  child: BlocConsumer<SeeMoreTransactionCubit, SeeMoreTransactionState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition:SeeMoreTransactionCubit.get(context).Gift!=null ,
      builder:(context)=>Scaffold(
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
                    Text('Gift',style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 30,),
                    Text('${SeeMoreTransactionCubit.get(context).Gift!.result.giftCoins}',style: TextStyle(
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
                      Text('${SeeMoreTransactionCubit.get(context).Gift!.result.createdAt}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      ),),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          Text('Transaction Id',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black
                          ),),
                          SizedBox(height: 5,),
                          Text('${Transaction_id}',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey[500]
                          ),),
                        ],
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
                                      width: 2
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
                                    Text('${SeeMoreTransactionCubit.get(context).Gift!.result.noOfCans}',
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
                                      width: 2
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
                                    Text('${SeeMoreTransactionCubit.get(context).Gift!.result.noOfBottles}',
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
                                      width: 2
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
                                    Text('${SeeMoreTransactionCubit.get(context).Gift!.result.giftCoins}',
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
                                      width: 2
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
                                    Text('${SeeMoreTransactionCubit.get(context).Gift!.result.giftMoney}',
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
                                      width: 2
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
                                    Text('0058',
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
      ),
      fallback:(context)=>Scaffold(
          // appBar:
          // AppBar(
          //   leading: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: Icon(
          //           Icons.keyboard_double_arrow_left_outlined, size: 32)),
          // ),
          body:
          Center(child: CircularProgressIndicator(),)

      ),
    );
  },
),
);
  }
}
