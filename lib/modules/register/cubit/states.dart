

import '../../../model/login_model.dart';

abstract class Registerstates  {}

class  RegisterInitalstate extends Registerstates {}

class  RegisterLoadingstate extends Registerstates {}
class  RegisterChangePasswordVisabilitystate extends Registerstates {}
class  RegisterButtonClickablestate extends Registerstates {}
class  RegisterChangeConfirmPasswordVisabilitystate extends Registerstates {}

class  RegisterSuccessstate extends Registerstates {
  final LoginModel registerModel;
  RegisterSuccessstate(this.registerModel);
}

class  RegisterErrorstate extends Registerstates {
  final String error;
  final String error_message;
  RegisterErrorstate(this.error,this.error_message);


}
