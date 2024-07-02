part of 'congrat_voucher_cubit.dart';

@immutable
abstract class CongratVoucherState {}

class CongratVoucherInitial extends CongratVoucherState {}
class CongratVoucherLoding extends CongratVoucherState {}
class  CongratVoucherButtonClickablestate extends CongratVoucherState {}
class  CongratVoucherSuccessstate extends CongratVoucherState {
  final VoucherModelDetail Cograt;
  CongratVoucherSuccessstate(this.Cograt);
}

class  CongratVoucherErrorstate extends CongratVoucherState {
  final String error;
  final String error_message;
  CongratVoucherErrorstate(this.error , this.error_message);


}
