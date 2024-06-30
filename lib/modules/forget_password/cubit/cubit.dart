import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/forget_password/cubit/states.dart';
import 'package:earn_by_return/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/remote/dio_helper.dart';

class ForgetCubit extends Cubit<Forgetstates> {
  ForgetCubit() : super(ForgetInitalstate());
  static ForgetCubit get(context) => BlocProvider.of(context);


  void userForgetPass({
    required String email,

  }) {
    emit(ForgetLoadingstate());
    DioHelper.postData(url: FORGETPASSWORD, data: {'email': email,})
        .then((value) {
      print(value.data);
      print(value.statusCode);
      if(value.statusCode==200){
        emit(ForgetSuccessstate(value.data['message']));
      }



    }).catchError((error) {
      print(error);
      emit(ForgetErrorstate(error.toString(),error.response.data["message"]));
    });
  }



}