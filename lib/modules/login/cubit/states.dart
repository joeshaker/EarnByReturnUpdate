

import '../../../model/login_model.dart';

abstract class Loginstates  {}

class  LoginInitalstate extends Loginstates {}

class  LoginLoadingstate extends Loginstates {}
class  LoginChangePasswordVisabilitystate extends Loginstates {}
class  LoginButtonClickablestate extends Loginstates {}

class  LoginSuccessstate extends Loginstates {
  final LoginModel loginModel;
  LoginSuccessstate(this.loginModel);
}

class  LoginErrorstate extends Loginstates {
  final String error;
  final String error_message;
  LoginErrorstate(this.error , this.error_message);


}
