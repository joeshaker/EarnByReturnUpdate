import 'package:bloc/bloc.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/VoucherModel.dart';
import '../../../shared/component/component/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  VoucherCubit() : super(VoucherInitial());
  static VoucherCubit get(context) => BlocProvider.of(context);
  ApiResponse ?voucher;
  void getuserData(){
    emit(VoucherLoding());
    DioHelper.getData(url:'api/v1/merchant/${merchant_id}/vouchers?active=true',token: token).then((value){
      print(value.data);
      voucher = ApiResponse.fromJson(value.data);
      // print(merchant.toString());
      // print(users.data[1]);
      print(voucher!.data[0].id);
      // print(users!.data[0].name);
      // print(users!.data[0].wal);
      emit(VoucherSuccess(voucher!));
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(VoucherError(error.toString(),error.response.data['message']));
    });

  }
}
