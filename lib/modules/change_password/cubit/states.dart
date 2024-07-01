



abstract class ChangePassstates  {}

class  ChangePassInitalstate extends ChangePassstates {}

class  ChangePassLoadingstate extends ChangePassstates {}
class  ChangeModifyPasswordVisabilitystate  extends ChangePassstates {}
class  ChangeModifyConfirmPasswordVisabilitystate  extends ChangePassstates {}
class  ChangeModifyCurrentPasswordVisabilitystate  extends ChangePassstates {}

class  ChangePassSuccessstate extends ChangePassstates {
  final String message;
  ChangePassSuccessstate(this.message);

}



class  ChangePassErrorstate extends ChangePassstates {
  final String error;
  final String error_message;
  ChangePassErrorstate(this.error,this.error_message);


}
