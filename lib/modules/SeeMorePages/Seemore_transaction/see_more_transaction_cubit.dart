import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/SeeMoreGiftModel.dart';
import '../../../shared/component/component/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'see_more_transaction_state.dart';

class SeeMoreTransactionCubit extends Cubit<SeeMoreTransactionState> {
  SeeMoreTransactionCubit() : super(SeeMoreTransactionInitial());
  static SeeMoreTransactionCubit get(context) => BlocProvider.of(context);
  Seemoregift ?Gift;
  void getuserData(){
    emit(SeeMoreTransactionLoding());
    DioHelper.getData(url:'api/v1/user/myTransactions/${Transaction_id}',token: token).then((value){
      print(value.data);
      Gift = Seemoregift.fromJson(value.data);
      // print(merchant.toString());
      // print(users.data[1]);
      print(Gift!.result.id);
      // print(users!.data[0].name);
      // print(users!.data[0].wal);
      emit(SeeMoreTransactionSuccess(Gift!));
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(SeeMoreTransactionError(error.toString(),error.response.data['message']));
    });

  }
}
