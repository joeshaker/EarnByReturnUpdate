import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/Congrat_Voucher/congrat_voucher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';

class CongVoucher extends StatefulWidget {
  const CongVoucher({super.key});

  @override
  State<CongVoucher> createState() => _CongVoucherState();
}

class _CongVoucherState extends State<CongVoucher> {
  List<CongTexts>Texts = [
    CongTexts(text1: 'Congratulations'),
    CongTexts(text1: 'You used a Voucher Successfully'),
    CongTexts(text1: 'Please Check Your Wallet and give this'),
    CongTexts(text1: 'The code is '),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CongratVoucherCubit()..getuserData(),
      child: BlocConsumer<CongratVoucherCubit, CongratVoucherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: CongratVoucherCubit.get(context).Detail!=null,
            builder:(context)=>Scaffold(
              appBar:
              AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Icon(Icons.clear, color: Colors.black,),
                ),
              ),
              body: Column(
                children: [
                  Stack(
                      children: [
                        Center(
                          child: Container(
                            width: 400,
                            height: 400,
                            child: Image.asset('assets/images/img_5.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Center(
                            child: Container(
                              width: 180,
                              height: 140,
                              child: Image.network(
                                '${Voucher_photo}',
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ]
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: ListView.builder(
                      shrinkWrap: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Center(
                            child: buildText(Texts[index]),
                          ),
                      itemCount: Texts.length,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      width: 276,
                      height: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]
                      ),
                      child: Center(
                        child: Text('${CongratVoucherCubit.get(context).Detail!.code}', style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        ),),
                      ),
                    ),
                  )
                ],
              ),

            ),
            fallback:(context)=> Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildText(CongTexts t) {
    return Text('${t.text1}', style:
    TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: Colors.green
    ),);
  }
}
