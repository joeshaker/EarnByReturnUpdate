import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/RedeemModel.dart';
import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../Redeem/Cubit/redeem_cubit.dart';
import '../profile/cubit/profile_cubit.dart';
import '../../../model/RedeemModel.dart'; // Import UserData and ApiResponse if not already imported
import 'dart:io' as Io;

import '../voucher/voucher.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});


  @override
  State<Homescreen> createState() => _HomescreenState();

}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  List<Details> detail=[
    Details(text1: 'Coins',  img: 'assets/images/img.png'),
    Details(text1: 'Money',  img: 'assets/images/money.png'),
    Details(text1: 'Machine Visits',  img: 'assets/images/img_4.png'),
    Details(text1: 'Recycled Cans',  img: 'assets/images/img_2.png'),
    Details(text1: 'Recycled Bottles', img: 'assets/images/img_3.png'),
  ];
  List<mapItems>item=[
    mapItems(name:'Tanta University',distance: 30),
    mapItems(name:'Stadium ST.',distance: 60)
  ];
  late UserData user_Data;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => ProfileCubit()..getuserData(),
),
    BlocProvider(
      create: (context) => RedeemCubit()..getuserData(),
    ),
  ],
  child: BlocConsumer<RedeemCubit, RedeemState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition: ProfileCubit.get(context)!.users!=null && RedeemCubit.get(context)!.merchant!=null ,
      builder: (context)=>Scaffold(
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 440,

                // color: Colors.green,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Text('Hello',style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize:15,
                                color: Colors.black

                            ),),
                          ),
                          Text('${ProfileCubit.get(context).users!.data[0].name}',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:22,
                              color: Colors.black

                          ),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(Icons.notifications_none_outlined,color: Colors.green,)),
                    ),
                    SizedBox(width: 20,),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0,right: 20),
                      child:
                      CircleAvatar(
                        backgroundImage: AssetImage(ProfileCubit.get(context).users!.data[0].gender=='female'?'assets/images/Person.png':'assets/images/img_7.png'),
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width:double.infinity,

                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 300,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              color: Colors.grey[100]
                          ),
                          child: Center(child: Text('Ads..')),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          // color: Colors.white,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index)=>
                                  buildContainerdetail(detail[index],index), separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 20,)
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Nearest Machines",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: 160,
                        // color: Colors.white,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: item.length,
                            itemBuilder: (BuildContext context, int index)=>
                                mapItemm(itemName: item[index].name, itemDistance:item[index].distance, context: context, currentLat: 20, currentLang: 30, itmeLat: 20, itemLang: 10),
                            separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 5,)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Nearest Redeems",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      // SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: 300,
                        // color: Colors.white,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: RedeemCubit.get(context).merchant!.results,
                            itemBuilder: (BuildContext context, int index)=>
                                InkWell(
                                    onTap: (){
                                      CacheHelper.saveData(key: '_id', value: RedeemCubit.get(context).merchant!.data[index].id);
                                      CacheHelper.saveData(key: 'merchantPhoto', value: RedeemCubit.get(context).merchant!.data[index].photos);
                                      merchant_id= CacheHelper.getData(key: '_id');
                                      merchant_photo= CacheHelper.getData(key: 'merchantPhoto');
                                      // print(merchant_id);
                                      navigateTo(context,VoucherScreen());
                                    },
                                child: BuildItemRedeem(context, RedeemCubit.get(context).merchant!.data[index])),
                            separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 1,)
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  },
);
  },
),
);
  }

  Widget buildContainerdetail(Details det,int index) {
    return BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                  width: 2
                              ),
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(det.text1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800
                                  ),),
                                SizedBox(height: 10,),
                                Image(image: AssetImage(det.img),height: 60,),
                                SizedBox(height: 10,),
                                Center(
                                  child: Text("${ProfileCubit.get(context).detailss[index]}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600
                                    ),),
                                ),
                              ],
                            ),
                          );
  },
);
  }
}

Widget BuildItemRedeem(BuildContext context, UserData userData) {
  return Container(
    width: 200,
    height: 215,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
            Image.network(
              userData.photos!=''?userData.photos:"https://www.iconpacks.net/icons/2/free-store-icon-2017-thumb.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Text(
            userData.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            userData.address,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}



// Widget BuildItemRedeem(int index) {
//   return BlocConsumer<RedeemCubit, RedeemState>(
//     listener: (context, state) {
//       // TODO: implement listener
//     },
//     builder: (context, state) {
//       UserData userData = RedeemCubit
//           .get(context)
//           .merchant!
//           .data[index];
//       return FutureBuilder<List<String>>(
//         future: userData.convertBase64ToImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // Show loading indicator while waiting for the result
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}'); // Handle error
//           } else if (snapshot.hasData) {
//             List<String> imagePaths = snapshot.data!;
//             return Container(
//               width: 100,
//               height: 215,
//               margin: EdgeInsets.all(10),
//               // Adjust margins as needed
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 170,
//                       height: 155,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 4.0,
//                           mainAxisSpacing: 4.0,
//                         ),
//                         itemCount: imagePaths.length,
//                         itemBuilder: (context, index) {
//                           return CircleAvatar(
//                             backgroundImage: imagePaths[index].isNotEmpty
//                                 ? FileImage(Io.File(imagePaths[index]))
//                                 : null,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '${RedeemCubit.get(context).merchant!.data[index].name}',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     '${RedeemCubit.get(context).merchant!.data[index].address}',
//                     style: TextStyle(
//                       fontSize: 9,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Text('No data available'); // Handle no data case
//           }
//         },
//       );
//     },
//   );
// }


