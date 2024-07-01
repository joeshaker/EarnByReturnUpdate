part of 'see_more_transaction_cubit.dart';

@immutable
abstract class SeeMoreTransactionState {}

class SeeMoreTransactionInitial extends SeeMoreTransactionState {}
class  SeeMoreTransactionLoding extends SeeMoreTransactionState {}
class SeeMoreTransactionSuccess extends SeeMoreTransactionState {
  final Seemoregift Gift;
  SeeMoreTransactionSuccess(this.Gift);
}
class SeeMoreTransactionError extends SeeMoreTransactionState {
  final String error;
  final String error_message;

  SeeMoreTransactionError(this.error, this.error_message) {
  }
}
