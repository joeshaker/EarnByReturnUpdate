import 'dart:io' as Io;
import 'dart:convert';

import 'package:earn_by_return/modules/voucher/voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../../model/RedeemModel.dart'; // Import UserData and ApiResponse if not already imported
import 'package:earn_by_return/modules/Redeem/Cubit/redeem_cubit.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/local/cache_helper.dart';

class Redeemscreen extends StatefulWidget {
  @override
  State<Redeemscreen> createState() => _RedeemscreenState();
}

class _RedeemscreenState extends State<Redeemscreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedeemCubit()..getuserData(),
      child: BlocConsumer<RedeemCubit, RedeemState>(
        listener: (context, state) {
          // TODO: Implement listener if needed
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.keyboard_double_arrow_left_outlined, size: 32, color: Colors.black),
            ),
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RedeemCubit, RedeemState>(
      builder: (context, state) {
        if (state is RedeemLoding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RedeemSuccess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Redeem points",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.53,

                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GridView.builder(
                      itemCount: state.Merchant.results, // Assuming this is the correct property
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          CacheHelper.saveData(key: '_id', value: RedeemCubit.get(context).merchant!.data[index].id);
                          CacheHelper.saveData(key: 'merchantPhoto', value: RedeemCubit.get(context).merchant!.data[index].photos);
                          merchant_id= CacheHelper.getData(key: '_id');
                          merchant_photo= CacheHelper.getData(key: 'merchantPhoto');
                          print(merchant_id);
                          print(Role);
                          navigateTo(context,VoucherScreen());
                        },
                          child: _buildItem(context, state.Merchant.data[index])),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is RedeemError) {
          return Center(child: Text("Error: ${state.error_message}"));
        } else {
          return Center(child: Text("Unknown state"));
        }
      },
    );
  }

  Widget _buildItem(BuildContext context, UserData userData) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 190,
            height: 140,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
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
}