part of 'redeem_cubit.dart';

@immutable
abstract class RedeemState {}
class RedeemInitial extends RedeemState {}
class  RedeemLoding extends RedeemState {}
class RedeemSuccess extends RedeemState {
  final ApiResponse Merchant;

  RedeemSuccess(this.Merchant);
}
class RedeemError extends RedeemState {
  final String error;
  final String error_message;

  RedeemError(this.error, this.error_message) {
  }
}

