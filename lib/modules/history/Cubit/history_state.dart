part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class  HistoryLoading extends HistoryState {}
class HistorySuccess extends HistoryState {
  final History voucher;
  HistorySuccess(this.voucher);
}
class HistoryError extends HistoryState {
  final String error;
  final String error_message;

  HistoryError(this.error, this.error_message) {
  }
}