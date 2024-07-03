



abstract class Dashboardstates  {}

class  DashboardInitalstate extends Dashboardstates {}

class  DashboardLoadingstate extends Dashboardstates {}
class  DashboardDataCreatedstate extends Dashboardstates {}
class  DashboardChangSelectedstate extends Dashboardstates {}


class  DashboardSuccessstate extends Dashboardstates {
  final String message;
  DashboardSuccessstate(this.message);

}
////


class  DashboardErrorstate extends Dashboardstates {
  final String error;
  final String error_message;
  DashboardErrorstate(this.error,this.error_message);


}