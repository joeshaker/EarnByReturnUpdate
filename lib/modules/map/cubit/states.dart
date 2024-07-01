

import '../../../model/login_model.dart';

abstract class Mapstates  {}

class  MapInitalstate extends Mapstates {}

class  MapGettingPermissionErrorstate extends Mapstates {}
class  MapLoadingstate extends Mapstates {}
class  MapCalculateDistancestate extends Mapstates {}
class  MapSelectedMachineButtonstate extends Mapstates {}

class  MapSelectedRedeemButtonstate extends Mapstates {}


class  MapGetCurrentLocationstate extends Mapstates {}
class  MapGetCurrentLocationInitstate extends Mapstates {}

class  MapSuccessstate extends Mapstates {

}

class  MapErrorstate extends Mapstates {
  final String error;
  final String error_message;
  MapErrorstate(this.error , this.error_message);


}
