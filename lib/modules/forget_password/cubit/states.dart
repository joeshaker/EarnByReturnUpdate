



abstract class Forgetstates  {}

class  ForgetInitalstate extends Forgetstates {}

class  ForgetLoadingstate extends Forgetstates {}
class  ForgetSuccessstate extends Forgetstates {
  final String message;
  ForgetSuccessstate(this.message);

}



class  ForgetErrorstate extends Forgetstates {
  final String error;
  final String error_message;
  ForgetErrorstate(this.error,this.error_message);


}
