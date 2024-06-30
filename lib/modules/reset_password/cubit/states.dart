



abstract class ResetPassstates  {}

class  ResetPassInitalstate extends ResetPassstates {}

class  ResetPassLoadingstate extends ResetPassstates {}
class  ResetChangePasswordVisabilitystate  extends ResetPassstates {}
class  ResetChangeConfirmPasswordVisabilitystate  extends ResetPassstates {}

class  ResetPassSuccessstate extends ResetPassstates {
  final String message;
  ResetPassSuccessstate(this.message);

}



class  ResetPassErrorstate extends ResetPassstates {
  final String error;
  final String error_message;
  ResetPassErrorstate(this.error,this.error_message);


}
