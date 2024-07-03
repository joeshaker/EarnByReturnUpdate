
import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/login/cubit/states.dart';
import 'package:earn_by_return/modules/register/cubit/states.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<Registerstates> {
  RegisterCubit() : super(RegisterInitalstate());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late LoginModel registerModel;

  void userRegister({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String phoneNumber
  }) {
    emit(RegisterLoadingstate());
    DioHelper.postData(url: REGISTER,
        data: {'email': email,
          'password': password,
          'name': name,
          'phoneNumber': phoneNumber,
          "passwordConfirm":passwordConfirm,

    })
        .then((value) {
      print(value.data);
      registerModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'token', value: value.data['token']);
      print( value.data['token']);
      print(CacheHelper.getData(key: 'token'));
      emit(RegisterSuccessstate(registerModel));
      print(value.statusCode );
    }).catchError((error) {

      print(error);

      emit(RegisterErrorstate(error.toString(),error.response.data["message"]));
    });
  }
  bool passwordVisable = true;
  bool ConfirmpasswordVisable = true;
  IconData Passwordsuffix = CupertinoIcons.eye_fill;
  IconData ConfirmPasswordsuffix = CupertinoIcons.eye_fill;


  void changePasswordVisiability( bool password )
  {
    if(password){
      passwordVisable =!passwordVisable;
      Passwordsuffix = passwordVisable? CupertinoIcons.eye_fill:CupertinoIcons.eye_slash_fill;
      emit(RegisterChangePasswordVisabilitystate());

    }else
      {
        ConfirmpasswordVisable =!ConfirmpasswordVisable;
        ConfirmPasswordsuffix = ConfirmpasswordVisable? CupertinoIcons.eye_fill:CupertinoIcons.eye_slash_fill;
        emit(RegisterChangeConfirmPasswordVisabilitystate());

      }


  }
  bool clickable = false;
  void Changebuttonclick(bool state)
  {
    clickable = state;
    emit(RegisterButtonClickablestate());

  }

}
