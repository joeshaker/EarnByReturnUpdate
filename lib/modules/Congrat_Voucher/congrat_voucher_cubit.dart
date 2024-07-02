import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/CongratVoucherModel.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'congrat_voucher_state.dart';

class CongratVoucherCubit extends Cubit<CongratVoucherState> {
  CongratVoucherCubit() : super(CongratVoucherInitial());
  static CongratVoucherCubit get(context) => BlocProvider.of(context);
  late VoucherModelDetail Detail;
  void userLogin({
    required String VoucherId,
  }) {
    emit(CongratVoucherLoding());
    DioHelper.postData(url: 'api/v1/wallet/transactions/useVoucher', data: {'VoucherID': "667de5aaa27dc91038c933e6"})
        .then((value) {
      Detail = VoucherModelDetail.fromJson(value.data);
      // CacheHelper.saveData(key: 'token', value: value.data['token']);
      print(Detail.code);
      // DioHelper.getData(url: 'api/v1/user/me');
      emit(CongratVoucherSuccessstate(Detail));
    },).catchError((error) {

      // if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(CongratVoucherErrorstate(error.toString(),error.response.data['message']));
    });

  }
}
