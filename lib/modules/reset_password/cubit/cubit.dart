import 'package:bloc/bloc.dart';
import 'package:earn_by_return/modules/reset_password/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';


class ResetPassCubit extends Cubit<ResetPassstates> {
  ResetPassCubit() : super(ResetPassInitalstate());
  static ResetPassCubit get(context) => BlocProvider.of(context);


  void userResetPass({
    required String password,
    required String confrimPassword,
    required String token,

  }) {
    emit(ResetPassLoadingstate());
    print(RESETPASS+token);
    DioHelper.patchData(url: RESETPASS+token, data: {'password': password,'passwordConfirm':confrimPassword})
        .then((value) {
      print(value.data);
      print(value.statusCode);
      if(value.statusCode==200){
        emit(ResetPassSuccessstate(value.data['status']));
      }



    }).catchError((error) {
      print(error);
      emit(ResetPassErrorstate(error.toString(),error.response.data["message"]));
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
      Passwordsuffix = passwordVisable? CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_fill;
      emit(ResetChangePasswordVisabilitystate());

    }else
    {
      ConfirmpasswordVisable =!ConfirmpasswordVisable;
      ConfirmPasswordsuffix = ConfirmpasswordVisable? CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_fill;
      emit(ResetChangeConfirmPasswordVisabilitystate());

    }



}}