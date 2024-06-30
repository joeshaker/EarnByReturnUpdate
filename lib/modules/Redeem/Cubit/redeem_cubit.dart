import 'package:bloc/bloc.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/RedeemModel.dart';
import '../../../shared/component/component/constants.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

part 'redeem_state.dart';

class RedeemCubit extends Cubit<RedeemState> {
  RedeemCubit() : super(RedeemInitial()){}
  static RedeemCubit get(context) => BlocProvider.of(context);
  ApiResponse ?merchant;
  UserData ?user;
  void getuserData(){
    emit(RedeemLoding());
    DioHelper.getData(url:'api/v1/merchant',token: token).then((value){
      print(value.data);
      merchant = ApiResponse.fromJson(value.data);
      // print(merchant.toString());
      // print(users.data[1]);
      print(merchant!.data[0].name);
      print(merchant!.data);
      print(merchant!.data[0].photos);
      print(merchant!.data[2].photos);
      // print(merchant!.data[0].convertBase64ToImage());
      // print(users!.data[0].name);
      // print(users!.data[0].wal);
      emit(RedeemSuccess(merchant!));
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(RedeemError(error.toString(),error.response.data['message']));
    });
  }

}
