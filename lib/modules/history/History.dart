import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/model/HistoryModel.dart';
import 'package:earn_by_return/modules/history/Cubit/history_cubit.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../SeeMorePages/Seemore_transaction/Seemore.dart';
import '../SeeMorePages/Seemore_voucher/Seemore_voucher.dart';
// import 'package:whatsapps/components/components.dart';

class Historyscreen extends StatefulWidget {
  @override
  State<Historyscreen> createState() => _HistoryscreenState();
}

class _HistoryscreenState extends State<Historyscreen> {
  // const Historyscreen({super.key});
  @override
  int _selectedIndex = 0;
  History ? his;
  List<TextModel>Texts = [
    TextModel(
        text1: 'Recycled R03',
        text2: '12:00 AM',
        text3: '10 - 12 - 2023',
        text4: '+120',
        firist: Colors.green
    ),
    TextModel(
        text1: 'Order NO31',
        text2: '5:37 AM',
        text3: '10 - 12 - 2023',
        text4: '-200',
        firist: Colors.red
    ),
    TextModel(
        text1: 'Recycled R03',
        text2: '1:30 AM',
        text3: '10 - 12 - 2023',
        text4: '+545',
        firist: Colors.green
    ),
    TextModel(
        text1: 'Order NO31',
        text2: '7:50 AM',
        text3: '10 - 12 - 2023',
        text4: '-600',
        firist: Colors.red
    ),

  ];
  HistoryCubit historyCubit = HistoryCubit()..getuserData();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>historyCubit,
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition:historyCubit.vou!=null &&historyCubit.vou!=0,
            builder: (context)=>
                Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                          Icons.keyboard_double_arrow_left_outlined, size: 32)),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("History", style: TextStyle(
                          fontSize: 24,
                        )),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 640,
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                            buildContainerHistory(index),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20,),
                            itemCount: historyCubit.vou!.results
                        ),
                      )
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
                Center(child: CircularProgressIndicator(),)
            ),
          );
        },
      ),
    );
  }

  Widget buildContainerHistory(int index) {
    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          width: 375,
          height: 175,
          decoration: BoxDecoration(
              color: Colors.grey[200]
              ,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${HistoryCubit.get(context).label[index]}", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${HistoryCubit.get(context).vou!.transaction[index].id}", style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]
                        ),),
                        SizedBox(height: 10,),
                        Text('${HistoryCubit.get(context).vou!.transaction[index].time}', style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]
                        ),),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${HistoryCubit.get(context).sign[index]}'+'${HistoryCubit.get(context).vou!.transaction[index].transactionPoints}', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:HistoryCubit.get(context).colors[index]
                        ),),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            // print(HistoryCubit().vou!.transaction[index].id);
                            CacheHelper.saveData(key: '_id', value: HistoryCubit.get(context).vou!.transaction[index].id);
                            Transaction_id=CacheHelper.getData(key: '_id');
                            print(Transaction_id);
                            if(HistoryCubit.get(context).vou!.transaction[index].gift!=''){
                              navigateTo(context, SeemoreScreen());
                            }
                            else{
                              navigateTo(context, Seemore_voucher());

                            }
                          },
                          child: Text("See more", style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]
                          ),),
                        ),

                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
