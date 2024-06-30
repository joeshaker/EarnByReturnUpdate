part of 'all_transaction_cubit.dart';

@immutable
abstract class AllTransactionState {}

class AllTransactionInitial extends AllTransactionState {}
class  AllTransactionLoding extends AllTransactionState {}
class AllTransactionSuccess extends AllTransactionState {
  final AllTransaction Alltrans;
  AllTransactionSuccess(this.Alltrans);
}
class AllTransactionError extends AllTransactionState {
  final String error;
  final String error_message;

  AllTransactionError(this.error, this.error_message) {
  }
}