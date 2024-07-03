import 'package:bloc/bloc.dart';
import 'package:earn_by_return/model/HistoryModel.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/component/component/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../SeeMorePages/Seemore_transaction/Seemore.dart';
import '../../SeeMorePages/Seemore_voucher/Seemore_voucher.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(context) => BlocProvider.of(context);
  History ?vou;
  List sign=[] ;
  List label=[] ;
  List<Color> colors = [];
  String ?id;
  String ?time;
  List Screen=[];
  void getuserData(){
    emit(HistoryLoading());
    DioHelper.getData(url:'api/v1/user/myTransactions',token: token).then((value){
      print(value.data);
      vou = History.fromJson(value.data);
      // print(vou.toString());
      // print(vou!.results);
      // print(vou!.transaction[0].voucher!.voucherid);
      // print(vou!.transaction[1].id);
      // print(users.data[1]);
      // print(voucher!.data);
      // print(voucher!.data[0].name);
      // print(voucher!.data[0].wallet.money);
      emit(HistorySuccess(vou!));
      vou!.transaction.forEach((element) {
        if (element.gift != '') {
          sign.add('+');
          label.add('gift');
          colors.add(Colors.green);
          Screen.add(SeemoreScreen());
        } else {
          sign.add('-');
          label.add('order');
          colors.add(Colors.red);
          Screen.add(Seemore_voucher());
        }
      });
      print(label);
      print(sign);
      print(colors);
      print(Screen);
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(HistoryError(error.toString(),error.response.data['message']));
    });



  }

}
