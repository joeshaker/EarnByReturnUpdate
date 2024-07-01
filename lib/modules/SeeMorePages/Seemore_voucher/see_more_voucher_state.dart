part of 'see_more_voucher_cubit.dart';

@immutable
abstract class SeeMoreVoucherState {}

class SeeMoreVoucherInitial extends SeeMoreVoucherState {}
class  SeeMoreVoucherLoding extends SeeMoreVoucherState {}
class SeeMoreVoucherSuccess extends SeeMoreVoucherState {
  final Seemorevoucher Voucherdetail;
  SeeMoreVoucherSuccess(this.Voucherdetail);
}
class SeeMoreVoucherError extends SeeMoreVoucherState {
  final String error;
  final String error_message;

  SeeMoreVoucherError(this.error, this.error_message) {
  }
}
