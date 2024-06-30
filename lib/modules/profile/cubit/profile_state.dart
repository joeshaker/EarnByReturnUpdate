part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class  ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
   final ApiResponse user;
  ProfileSuccess(this.user);
}
class ProfileError extends ProfileState {
  final String error;
   final String error_message;
  ProfileError(this.error , this.error_message){
  }


}

