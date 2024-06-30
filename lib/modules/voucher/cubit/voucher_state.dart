part of 'voucher_cubit.dart';

@immutable
abstract class VoucherState {}

class VoucherInitial extends VoucherState {}
class  VoucherLoding extends VoucherState {}
class VoucherSuccess extends VoucherState {
  final ApiResponse Merchant;
  VoucherSuccess(this.Merchant);
}
class VoucherError extends VoucherState {
  final String error;
  final String error_message;

  VoucherError(this.error, this.error_message) {
  }
}
