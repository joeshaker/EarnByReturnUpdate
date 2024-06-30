import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_transaction_cubit.dart';

class All_transaction extends StatefulWidget {
  const All_transaction({super.key});

  @override
  State<All_transaction> createState() => _All_transactionState();
}

class _All_transactionState extends State<All_transaction> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AllTransactionCubit()
        ..getuserData(),
      child: BlocConsumer<AllTransactionCubit, AllTransactionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition:AllTransactionCubit.get(context).All_trans!=null ,
            builder:(context)=> Scaffold(
              appBar: AppBar(
                leading: Icon(
                  Icons.keyboard_double_arrow_left_outlined, size: 32,
                  color: Colors.black,),
              ),
              body:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20),
                    child: Text(
                      "All Transactions",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 800,
                      child:
                      ListView.builder(
                        itemCount: AllTransactionCubit.get(context).All_trans!.results,
                        itemBuilder: (BuildContext context, int index) =>
                            buildPaddingTrans(index),
                      ),
                    ),
                  )

                ],
              ),
            ),
            fallback:(context)=>Center(child: CircularProgressIndicator(),) ,
          );
        },
      ),
    );
  }

  Widget buildPaddingTrans(int index) {
    return BlocConsumer<AllTransactionCubit, AllTransactionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
              border: Border.all(
                  color:AllTransactionCubit.get(context).colors[index],
                  width: 2
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${AllTransactionCubit.get(context).All_trans!.transaction[index].id}', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),),
                      SizedBox(height: 10,),
                      Text('${AllTransactionCubit.get(context).All_trans!.transaction[index].user.name}', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),),
                      SizedBox(height: 10,),
                      Text('${AllTransactionCubit.get(context).All_trans!.transaction[index].time}', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),),

                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AllTransactionCubit.get(context).colors[index],
                        ),
                        child: Center(
                          child: Text('${AllTransactionCubit.get(context).label[index]}', style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white
                          ),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(
                            AllTransactionCubit.get(context).Iconss[index], color: AllTransactionCubit.get(context).colors[index]
                              ),
                          Text('${AllTransactionCubit.get(context).All_trans!.transaction[index].transactionPoints}', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
