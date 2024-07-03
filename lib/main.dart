import 'package:earn_by_return/layout/earn_by_return_layout/app_layout.dart';
import 'package:earn_by_return/modules/Redeem/Cubit/redeem_cubit.dart';
import 'package:earn_by_return/modules/on_boarding/on_boarding.dart';
import 'package:earn_by_return/modules/profile/cubit/profile_cubit.dart';
import 'package:earn_by_return/shared/bloc_observer.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:earn_by_return/shared/cubit/app_cubit.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:earn_by_return/shared/network/remote/dio_helper.dart';
import 'package:earn_by_return/shared/styles/themesEarn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'modules/Admin/All transactions/TransactionAll.dart';
import 'modules/BottomnavAdmin/BottomnavAdmine.dart';
import 'modules/Congrat_Voucher/CongratVoucher.dart';
import 'modules/Homepage/Homescreen.dart';
import 'modules/Redeem/Redeem.dart';
import 'modules/SeeMorePages/Seemore_voucher/Seemore_voucher.dart';
import 'modules/bottomnavbar/bottomnav.dart';
import 'modules/check_email/check_email_screen.dart';
import 'modules/dashboard/dashboard_screen.dart';
import 'modules/forget_password/forget_password_screen.dart';
import 'modules/history/History.dart';
// import 'modules/map/mapTest.dart';
import 'modules/map/cubit/cubit.dart';
import 'modules/map/map_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/profile/Profile.dart';
import 'modules/reset_password/reset_password_screen.dart';
import 'modules/reset_password/reset_password_screen_done.dart';
import 'modules/voucher/voucher.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();// تتاكد ان الفانكنشن اللي هي كانت await تتنفذ الاول وبعد كده يعمل الباقي
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? darkMode = CacheHelper.getData(key: 'darkMode');
  bool? onBoarding =CacheHelper.getData(key: 'onBoarding');
  token =CacheHelper.getData(key: 'token');
  Role = CacheHelper.getData(key: 'role');
  selectedRole=Role;
  // Role=CacheHelper.getData(key: 'role');
  id=CacheHelper.getData(key: '_id');
  Widget widget=Text("data") ;

  //جزء ده انا بشوف انا في انهي مرحله في الابليكشن
  if(onBoarding !=null){
    // 3shan ashof ana 3mlt login aw shoft al onboarding abl keda wla la
    if(token !=null ) { // انا عديت من ال لوج ان مره خلاص
      widget = Bottonav();
    }else{
      widget = LoginScreen();
    }

  }else{
    // ana lesa fe al awll asln
    widget = OnBoardingScreen();

  }


  runApp  (MyApp( darkMode?? false,onBoarding??false,widget)  );
}

class MyApp extends StatelessWidget {

  final bool darkMode;
  final bool onBoarding;
  final Widget startWidget;
  MyApp(this.darkMode,this.onBoarding,this.startWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..changThemeMode(
          fromShared: darkMode,
        ),),
        BlocProvider( create: (context) => MapCubit()..getCurrentLocation()),

        // BlocProvider( create: (context) => NewsCubit()..getBusiness())
        // BlocProvider(create: (context)=>RedeemCubit()..getuserData())
      //
      ],

      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
              themeMode: AppCubit.get(context).darkMode? ThemeMode.dark:ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              home:startWidget

            // home: CheckEmailScreen(email: "Sohila123@gmail.com",),
            // home: CheckEmailScreen(email: 'sohila@gmail.com',comeFrom:'RegisterScreen' ),
          );
        },
      ),
    );
  }


}

//
// import 'package:flutter/material.dart';
//
// import 'layout/plants/screens/homepage.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
