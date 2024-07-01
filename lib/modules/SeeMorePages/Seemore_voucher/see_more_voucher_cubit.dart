import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/SeemoreVoucherModel.dart';
import '../../../shared/component/component/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'see_more_voucher_state.dart';

class SeeMoreVoucherCubit extends Cubit<SeeMoreVoucherState> {
  SeeMoreVoucherCubit() : super(SeeMoreVoucherInitial());
  static SeeMoreVoucherCubit get(context) => BlocProvider.of(context);
  Seemorevoucher ?voucher;
  void getuserData(){
    emit(SeeMoreVoucherLoding());
    DioHelper.getData(url:'api/v1/user/myTransactions/${Transaction_id}',token: token).then((value){
      print(value.data);
      voucher = Seemorevoucher.fromJson(value.data);
      // print(merchant.toString());
      // print(users.data[1]);
      print(voucher!.result.voucherName);
      // print(users!.data[0].name);
      // print(users!.data[0].wal);
      emit(SeeMoreVoucherSuccess(voucher!));
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(SeeMoreVoucherError(error.toString(),error.response.data['message']));
    });

  }
}
