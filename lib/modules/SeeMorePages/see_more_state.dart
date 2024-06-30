part of 'see_more_cubit.dart';

@immutable
abstract class SeeMoreState {}

class SeeMoreInitial extends SeeMoreState {}
class  SeeMoreLoding extends SeeMoreState {}
class SeeMoreSuccess extends SeeMoreState {

  SeeMoreSuccess();
}
class SeeMoreError extends SeeMoreState {
  final String error;
  final String error_message;

  SeeMoreError(this.error, this.error_message) {
  }
}