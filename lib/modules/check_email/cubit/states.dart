



abstract class CheckEmailstates  {}

class  CheckEmailInitalstate extends CheckEmailstates {}

class  CheckEmailLoadingstate extends CheckEmailstates {}
class  CheckEmailSuccessstate extends CheckEmailstates {
  final String message;
  CheckEmailSuccessstate(this.message);

}



class  CheckEmailErrorstate extends CheckEmailstates {
  final String error;
  final String error_message;
  CheckEmailErrorstate(this.error,this.error_message);


}
