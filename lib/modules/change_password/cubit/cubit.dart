import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/change_password/cubit/states.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';


class ChangePassCubit extends Cubit<ChangePassstates> {
  ChangePassCubit() : super(ChangePassInitalstate());
  static ChangePassCubit get(context) => BlocProvider.of(context);


  void userChangePass({
    required String password,
    required String currentPassword,
    required String confrimPassword,
    required String token,

  }) {
    emit(ChangePassLoadingstate());

    DioHelper.patchData(url: CHANGEPASS, data: {'password': password,'passwordConfirm':confrimPassword,'passwordCurrent':currentPassword},token: token)
        .then((value) {
      print(value.data);
      print(value.statusCode);
      if(value.statusCode==200){
        emit(ChangePassSuccessstate(value.data['status']));
      }



    }).catchError((error) {
      print(error);
      emit(ChangePassErrorstate(error.toString(),error.response.data["message"]));
    });
  }
  bool passwordVisable = true;
  bool ConfirmpasswordVisable = true;
  bool CurrentPasswordVisable = true;

  IconData Passwordsuffix = CupertinoIcons.eye_fill;
  IconData ConfirmPasswordsuffix = CupertinoIcons.eye_fill;
  IconData CurrentPasswordsuffix = CupertinoIcons.eye_fill;

  void changePasswordVisiability( String type ) {
    if (type == 'password') {
      passwordVisable = !passwordVisable;
      Passwordsuffix =
      passwordVisable ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill;
      emit(ChangeModifyPasswordVisabilitystate());
    }
    if (type == 'confirmPassword') {
      ConfirmpasswordVisable = !ConfirmpasswordVisable;
      ConfirmPasswordsuffix =
      ConfirmpasswordVisable ? CupertinoIcons.eye_slash_fill : CupertinoIcons
          .eye_fill;
      emit(ChangeModifyConfirmPasswordVisabilitystate());
    } if(type == 'currentPassword')  {
      CurrentPasswordVisable = !CurrentPasswordVisable;
      CurrentPasswordsuffix =
      CurrentPasswordVisable ? CupertinoIcons.eye_slash_fill : CupertinoIcons
          .eye_fill;
      emit(ChangeModifyCurrentPasswordVisabilitystate());
    }
  }}