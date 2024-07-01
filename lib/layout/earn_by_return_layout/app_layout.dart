import 'package:earn_by_return/modules/login/login_screen.dart';
import 'package:earn_by_return/shared/component/component/components.dart';
import 'package:flutter/material.dart';

import '../../modules/change_password/change_password_screen.dart';
import '../../modules/qr_code/qrcode_screen.dart';
import '../../shared/network/local/cache_helper.dart';

class EarnByReturnLayout extends StatelessWidget {
  const EarnByReturnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: TextStyle(color: Colors.red),
          "homeeee"
        ),
      ),
      body: Column(
        children: [


          TextButton(
            child: Text('log out'),
            onPressed: (){
              CacheHelper.clearData(key: 'token');
              navigateAndFinish(context, LoginScreen());
            },
          ),
          TextButton(
            child: Text('change pass '),
            onPressed: (){

              navigateAndFinish(context, ChangePasswordScreen());
            },
          ),
          TextButton(
            child: Text('qr scan  '),
            onPressed: (){

              navigateAndFinish(context, QRViewExample());
            },
          ),
        ],
      ),

    );
  }
}
