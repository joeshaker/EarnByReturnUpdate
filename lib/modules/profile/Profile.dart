import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/BottomnavAdmin/BottomnavAdmine.dart';
import 'package:earn_by_return/modules/Redeem/Redeem.dart';
import 'package:earn_by_return/modules/login/cubit/cubit.dart';
import 'package:earn_by_return/modules/login/login_screen.dart';
import 'package:earn_by_return/modules/voucher/voucher.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/UserModel.dart';
import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../bottomnavbar/bottomnav.dart';
import '../history/History.dart';
import '../mywallet_recycle/Mywallet.dart';
import 'cubit/profile_cubit.dart';

class ProflieScreen extends StatefulWidget {
  const ProflieScreen({super.key});

  @override
  State<ProflieScreen> createState() => _ProflieScreenState();
}

class _ProflieScreenState extends State<ProflieScreen> {
  int _selectedIndex = 0;
  List Screens = [
    Historyscreen(),
    MyWallet(),
    VoucherScreen(),
    MyWallet(),
    Historyscreen(),
    MyWallet(),
    MyWallet(),
    MyWallet(),
    BottomNavAdmin(),
    LoginScreen(),

  ];

  List<ProfileModel> Profile = [
    ProfileModel(
      text1: 'Personal info',
      icon: Icons.person_pin,
      shouldNavigate: false,
    ),
    ProfileModel(
      text1: 'My Wallet',
      icon: Icons.wallet_travel_outlined,
      shouldNavigate: true,
    ),
    ProfileModel(
      text1: 'Setting',
      icon: Icons.settings_outlined,
      shouldNavigate: false,
    ),
    ProfileModel(
      text1: 'Language',
      icon: Icons.language_outlined,
      shouldNavigate: false,
    ),
    ProfileModel(
      text1: 'History',
      icon: Icons.history_outlined,
      shouldNavigate: true,
    ),
    ProfileModel(
      text1: 'Rate App',
      icon: Icons.star_border_rounded,
      shouldNavigate: false,
    ),
    ProfileModel(
      text1: 'Refer a friend',
      icon: Icons.face_2_outlined,
      shouldNavigate: false,
    ),
    ProfileModel(
      text1: 'Contact us',
      icon: Icons.wifi_calling_3_outlined,
      shouldNavigate: false,
    ),

    ProfileModel(
      text1:selectedRole=="admin"? 'Act as user':"Act as admin",
      icon: Icons.swap_horiz_rounded,
      shouldNavigate: Role=="admin"?true:false,
    ),

    ProfileModel(
      text1: 'Logout',
      icon: Icons.logout_outlined,
      shouldNavigate: true,
    ),


  ];
  // void _updateProfileList() {
  //   if (Role == "admin") {
  //     Profile.insert(Profile.length - 1, // Insert before the last item
  //       ProfileModel(
  //         text1: 'Admin',
  //         icon: Icons.admin_panel_settings_outlined,
  //         shouldNavigate: true,
  //       ),
  //     );
  //     Screens.insert(Screens.length - 1, BottomNavAdmin()); // Add your Admin screen here
  //   }
  // }
  // void initState() {
  //   super.initState();
  //   _updateProfileList();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProfileCubit()..getuserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ProfileCubit.get(context).users != null,
            builder: (context) => Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.keyboard_double_arrow_left_outlined, size: 32),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: 100,
                      color: Colors.grey[300],
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/Person.png'),
                            radius: 40,
                          ),
                          SizedBox(width: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${ProfileCubit.get(context).users!.data[0].name}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: defaultColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 500,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 20),
                          child: InkWell(
                            onTap: () {
                              if (Profile[index].shouldNavigate??true) {

                                if(Profile[index].text1=="Logout"){
                                  CacheHelper.clearData(key: 'token');
                                }
                                if(index==Profile.length-2){
                                  if(selectedRole!="admin"){
                                    selectedRole="admin";
                                    navigateTo(context, BottomNavAdmin());
                                  }else{
                                    selectedRole="user";
                                    navigateTo(context, Bottonav());

                                  }

                                }else{
                                  navigateTo(context, Screens[index]);
                                }

                              }
                            },
                            child: buildCenter(Profile[index]),
                          ),
                        ),
                        itemCount: Profile.length,
                        separatorBuilder: (context, index) => SizedBox(height: 5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildCenter(ProfileModel model) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            model.icon,
            size: 30,
            color: model.text1=='Logout'?Colors.red:defaultColor,
          ),
          SizedBox(width: 30),
          Text(
            "${model.text1}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: model.text1=='Logout'?Colors.red:Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}