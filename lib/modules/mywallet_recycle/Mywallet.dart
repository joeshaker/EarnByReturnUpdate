import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyWallet extends StatefulWidget {
  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  // const MyWallet({super.key});
  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProfileCubit()..getuserData(),
  child: BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition:ProfileCubit.get(context).users!=null,
      builder:(context)=>
        Scaffold(
      appBar: AppBar(
      leading: InkWell(
        onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.keyboard_double_arrow_left_outlined,size:32 )),
    ),
    body:
    Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Center(
    child: Text("My Wallet",style: TextStyle(
    fontSize: 24,
    )),
    ),
    SizedBox(height: 30,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image(image: AssetImage("assets/images/img.png"),width: 125,height: 134,),
    SizedBox(width: 70,),
    Image(image: AssetImage("assets/images/money.png"),width: 125,height: 134,)
    ],
    ),
    SizedBox(height: 30,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Column(
    children:[
    Container(
    width: 150,
    height: 200,
    decoration: BoxDecoration(
    color: Colors.grey[200]
    ,
    borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("${ProfileCubit.get(context).users!.data[0].wallet.coins.toString()}",style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700
    ),),
    // SizedBox(height: 10,),
    Text("points",style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500
    ),),
    ],
    ),
    ),
    SizedBox(height: 30,),
    Text("Points",style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    ),)
    ],
    ),
    SizedBox(width: 40,),
    Column(
    children:[
    Container(
    width: 150,
    height: 200,
    decoration: BoxDecoration(
    color: Colors.grey[200]
    ,
    borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("${ProfileCubit.get(context).users!.data[0].wallet.money.toString()}",style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700
    ),),
    // SizedBox(height: 10,),
    Text("pounds",style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500
    ),),
    ],
    ),
    ),
    SizedBox(height: 30,),
    Text("Coins",style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    ),)
    ],
    ),

    ],
    )
    ],
    )

    ),
      fallback:(context)=>Center(child: CircularProgressIndicator()) ,

    );
  },
),
);
  }
}
