
import 'package:bloc/bloc.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:earn_by_return/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/UserModel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../login/cubit/states.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  ApiResponse ?users;
  List detailss=[];
  void getuserData(){
    emit(ProfileLoading());
    DioHelper.getData(url:'api/v1/user/me',token: token).then((value){
      print(value.data);
      print("frommmmm profileee");
      users = ApiResponse.fromJson(value.data);
      print(users.toString());
      // print(users.data[1]);
      print(users!.data);
      print(users!.data[0].name);
      // print(users!.data[0].gender);
      print(users!.data[0].wallet.money);
      emit(ProfileSuccess(users!));
      detailss.add(users!.data[0].wallet.coins);
      detailss.add(users!.data[0].wallet.money);
      detailss.add(users!.data[0].machineVisits);
      detailss.add(users!.data[0].wallet.canCount);
      detailss.add(users!.data[0].wallet.bottleCount);
    }).catchError((error) {
      print(error.toString()) ;// if(error.response.statusCode==401){
      //   emit(LoginErrorstate(error.toString(),));
      // }
      emit(ProfileError(error.toString(),error.response.data['message']));
    });

  }
}

class Homescreens{
  // late String text1;
  late dynamic text2;
  // late String img;

  Homescreens({
    required this.text2,});
}
