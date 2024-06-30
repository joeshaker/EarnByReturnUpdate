import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/Redeem/Cubit/redeem_cubit.dart';
import 'package:earn_by_return/modules/voucher/cubit/voucher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../profile/cubit/profile_cubit.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  int _selectedIndex = 0;
  List<ImageModel>Images=[
    ImageModel(
        text1: 'Big Mac',
        text2: '800 points',
        img: 'assets/images/bigmac.png'
    ),
    ImageModel(
        text1: 'McChicken',
        text2: '800 points',
        img: 'assets/images/mcchicken.png'

    ),
    ImageModel(
        text1: 'Share Box',
        text2: '1200 points',
        img: 'assets/images/share.png'

    ),
    ImageModel(
        text1: 'Nuggets Box',
        text2: '800 points',
        img: 'assets/images/nuggets.jpg'

    ),
    // ImageModel(
    //     text1: 'Pizza hut',
    //     text2: 'Start from 20 points',
    //     img: 'assets/images/hut.jpg'
    // ),
    // ImageModel(
    //     text1: 'Spinneys',
    //     text2: 'Start from 20 points',
    //     img: 'assets/images/spines.png'
    // ),

  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => VoucherCubit()..getuserData(),
),
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
    return BlocConsumer<VoucherCubit, VoucherState>(
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
      condition:VoucherCubit.get(context).voucher!=null&&ProfileCubit.get(context).users!=null&& RedeemCubit.get(context).merchant!=null ,
      builder:(context)=>Scaffold(
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 490,
                    height: 250,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Image.network(
                          '${merchant_photo}',
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Image.asset('assets/images/mac.png',width: 200,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0,left: 40),
                    child: Container(
                      width: 300.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 205.0,left: 45),
                    child: Container(
                      width: 290.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(child: Text("Your Balance",style: TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white
                          ),),),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0,),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.monetization_on_rounded,size: 20,color: Colors.yellow[600],),
                                SizedBox(width: 10,),
                                Text("${ProfileCubit.get(context).users!.data[0].wallet.coins}",style: TextStyle(
                                    fontWeight:FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height:MediaQuery.of(context).size.height/1.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: VoucherCubit.get(context).voucher!.results,
                    itemBuilder: (context, index) => BuildItem(index),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height/1.1 ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      fallback:(context)=>Center(child:CircularProgressIndicator(),) ,
    );
  },
);
  },
);
  },
),
);
  }
}
Widget BuildItem(int index) {
  return BlocConsumer<VoucherCubit, VoucherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Container(
    width: 150,
    height: 500,
    margin: EdgeInsets.all(10), // Adjust margins as needed
    decoration: BoxDecoration(
      border: Border.all(
        width: 3,
        color: Colors.green,
      ),
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 170,
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child:
              // Image.asset('assets/images/bigmac.png')
            Image.network("${VoucherCubit.get(context).voucher!.data[index].voucherPhoto}")
            // CircleAvatar(
            //   backgroundImage: AssetImage(
            //       '${image.img}'),
            // ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            '${VoucherCubit.get(context).voucher!.data[index].voucherName}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${VoucherCubit.get(context).voucher!.data[index].voucherPoints}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.green[500],
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text("Redeem",style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),),
          ),
        )
      ],
    ),
  );
  },
);
}
