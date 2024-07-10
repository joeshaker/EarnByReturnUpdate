import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/check_email/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class CheckEmailCubit extends Cubit<CheckEmailstates> {
  CheckEmailCubit() : super(CheckEmailInitalstate());
  static CheckEmailCubit get(context) => BlocProvider.of(context);

  void userCheckEmail({
    required String email,
    required int code,
  }) {
    emit(CheckEmailLoadingstate());
    DioHelper.postData(
        url: CHECKEMAIL,
        data: {'email': email, 'verificationCode': code}).then((value) {
      print(value.data);
      print(value.statusCode);

      if (value.statusCode == 200) {
        print(value.data['resetToken']);
        CacheHelper.saveData(key: 'token',value: value.data['resetToken']);
        emit(CheckEmailSuccessstate(value.data['status']));

      }else{
        emit(CheckEmailErrorstate(value.data['message'],value.data['message']));
      }
    }).catchError((error) {
      print(error);
      emit(CheckEmailErrorstate(
          error.toString(), error.response.data["message"]));
    });
  }
}
