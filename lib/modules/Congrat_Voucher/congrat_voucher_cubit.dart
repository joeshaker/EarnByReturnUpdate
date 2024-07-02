import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/CongratVoucherModel.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'congrat_voucher_state.dart';

class CongratVoucherCubit extends Cubit<CongratVoucherState> {
  CongratVoucherCubit() : super(CongratVoucherInitial());
  static CongratVoucherCubit get(context) => BlocProvider.of(context);
  VoucherModelDetail ?Detail;
  void getuserData(){
    emit(CongratVoucherLoding());
    DioHelper.getData(url:'api/v1/wallet/transactions/useVoucher/${Voucher_id}',token: token).then((value){
      print(value.data);
      Detail = VoucherModelDetail.fromJson(value.data);

      emit(CongratVoucherSuccessstate(Detail!));
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(CongratVoucherErrorstate(error.toString(),error.response.data['message']));
    });

  }
}
