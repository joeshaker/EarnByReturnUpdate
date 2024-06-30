import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../network/local/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool darkMode=false;

  void changThemeMode( { bool? fromShared})
  {
    if(fromShared !=null)
    {
      darkMode=fromShared;
      emit(AppChangeModeState());
    }else{
      darkMode =!darkMode;
      CacheHelper.putBoolean(key: 'darkMode', value: darkMode).then((value)
      {
        emit(AppChangeModeState()); //لما يخلص انه يعنل save اغير ال state

      });

    }






  }



}
