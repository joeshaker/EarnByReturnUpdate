import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/SeeMorePages/Seemore_voucher/see_more_voucher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/component/constants.dart';

class Seemore_voucher extends StatelessWidget {
  const Seemore_voucher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SeeMoreVoucherCubit()..getuserData(),
  child: BlocConsumer<SeeMoreVoucherCubit, SeeMoreVoucherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition:SeeMoreVoucherCubit.get(context).voucher!=null,
      builder:(context)=> Scaffold(
          backgroundColor: Colors.green,
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Order',style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: 30,),
                      Text('${SeeMoreVoucherCubit.get(context).voucher!.result.voucherPoints}',style: TextStyle(
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
                        Text('${SeeMoreVoucherCubit.get(context).voucher!.result.redeemTime}',style: TextStyle(
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
                                      Image(image: NetworkImage('${SeeMoreVoucherCubit.get(context).voucher!.result.merchantPhoto}'),height: 50,),
                                      SizedBox(width: 10,),
                                      Text('${SeeMoreVoucherCubit.get(context).voucher!.result.merchant}',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19
                                      ),)
                                    ],
                                  ),
                                  Image(image: NetworkImage('${SeeMoreVoucherCubit.get(context).voucher!.result.voucherPhoto}',
                                  ),fit: BoxFit.cover,height: 180,),
                                  SizedBox(height: 3,),
                                  Text('${SeeMoreVoucherCubit.get(context).voucher!.result.voucherName}',
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
                                      Text('${SeeMoreVoucherCubit.get(context).voucher!.result.voucherPoints}',style:TextStyle(
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
                                      Text('${SeeMoreVoucherCubit.get(context).voucher!.result.voucherMoney}',style:TextStyle(
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
            ),
          )
      ),
      fallback:(context)=>
          Scaffold(
          // appBar: AppBar(
          //   leading: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: Icon(
          //           Icons.keyboard_double_arrow_left_outlined, size: 32)),
          // ),
          body:
          Center(child: CircularProgressIndicator(
          ),)

      ),
    );
  },
),
);
  }
}
