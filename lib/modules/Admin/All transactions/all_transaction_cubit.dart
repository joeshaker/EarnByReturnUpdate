import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/AllTransactionModel.dart';
import '../../../shared/component/component/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'all_transaction_state.dart';

class AllTransactionCubit extends Cubit<AllTransactionState> {
  AllTransactionCubit() : super(AllTransactionInitial());
  static AllTransactionCubit get(context) => BlocProvider.of(context);
  AllTransaction ?All_trans;
  List sign=[] ;
  List label=[] ;
  List<Color> colors = [];
  String ?id;
  String ?time;
  List Iconss=[];
  void getuserData(){
    emit(AllTransactionLoding());
    DioHelper.getData(url:'api/v1/wallet/transactions',token: token).then((value){
      print(value.data);
      All_trans = AllTransaction.fromJson(value.data);
      print(All_trans.toString());
      print(All_trans!.results);
      // print(All_trans!.transaction);
      print(All_trans!.transaction);
      // print(users.data[1]);
      // print(voucher!.data);
      // print(voucher!.data[0].name);
      // print(voucher!.data[0].wallet.money);
      emit(AllTransactionSuccess(All_trans!));
      All_trans!.transaction.forEach((element) {
        if (element.gift != '') {
          sign.add('+');
          label.add('Gift');
          colors.add(Colors.green);
          Iconss.add(Icons.wallet_giftcard_outlined);
        } else {
          sign.add('-');
          label.add('Voucher');
          colors.add(Colors.red);
          Iconss.add(Icons.monetization_on_outlined);
        }
      });
      print(label);
      print(sign);
      print(colors);
      print(Iconss);
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(AllTransactionError(error.toString(),error.response.data['message']));
    });



  }
}
