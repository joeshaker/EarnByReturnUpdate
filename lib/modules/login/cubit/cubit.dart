import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/login/cubit/states.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<Loginstates> {
  LoginCubit() : super(LoginInitalstate());
  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;


  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingstate());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
          print("hpeen");
          print(value);
          if(value.statusCode==200){
            loginModel = LoginModel.fromJson(value.data);
            CacheHelper.saveData(key: 'token', value: value.data['token']);
            CacheHelper.saveData(key: 'role', value: value.data['role']);
            emit(LoginSuccessstate(loginModel));
          }else{

            emit(LoginErrorstate(value.data["message"],value.data["message"]));

          }



    },).catchError((error) {


      emit(LoginErrorstate(error.toString(),error.response.data['message']));
    });

  }
  bool passwordVisable = true;
  IconData suffix = CupertinoIcons.eye_fill;
  void changePasswordVisiability()
  {
    passwordVisable =!passwordVisable;
    suffix = passwordVisable? CupertinoIcons.eye_fill:CupertinoIcons.eye_slash_fill;
    emit(LoginChangePasswordVisabilitystate());

  }
  bool clickable = false;
  void makebuttonUnclickable(bool state)
  {
    clickable =state;
    emit(LoginButtonClickablestate());

  }

}
