import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/styles/colorsEarn.dart';
import '../register/register_screen.dart';

class ResetPasswordDoneScreen extends StatelessWidget {
  const ResetPasswordDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions:  [
            IconButton(
              icon: closeIcon,
              onPressed: () {
                navigateTo(context, LoginScreen());
              },
            ),

          ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                    fit: BoxFit.cover,
                    height: 350,
                    width: 300,
                    image: AssetImage('assets/images/resetPassword.jpg')),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25

                  ),
                  "Password reset successful"
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                  style: TextStyle(

                      fontSize: 14,
                      color: Colors.grey

                  ),
                  "you have successfully reset your password"


              ),


              Text(
                  style: TextStyle(

                      fontSize: 14,
                      color: Colors.grey

                  ),
                  "please use your new password when logging in."
              ),
              SizedBox(
                height: 60,
              ),


              ConditionalBuilder(

                // condition: state is! RegisterLoadingstate,
                  condition: true,

                  builder: (context) => defaultButton(
                    // clickable: clickable,
                      width: 320,
                      // background: clickable
                      //     ? defaultColor
                      //     : Colors.grey,
                      clickable: true,
                      background: true
                          ? defaultColor
                          : Colors.grey,
                      function: () {
                        navigateTo(context, LoginScreen())
                        // if (fromKey.currentState!.validate()) {
                        //   if (ConfirmPasswordController.text ==
                        //       passwordController.text) {
                        //     RegisterCubit.get(context).userRegister(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //         passwordConfirm: ConfirmPasswordController.text,
                        //         name: NameController.text,
                        //         phoneNumber: mobileController.text);
                        //     print('${emailController.text }${passwordController.text} ${NameController.text} ${mobileController.text} ');
                        //
                        //   }else{
                        //
                        //     ShowToast(text: "password and confirm password do\'nt match", state: ToastStates.ERROR);
                        //   }
                        //
                        //
                        //   ;
                        // }
                        ;
                      },
                      text: 'Log in'),
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator())),
              SizedBox(
                height: 15,
              ),




            ],

          ),
        ),
      ),


    );
  }
}
