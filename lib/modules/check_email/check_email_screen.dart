import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/check_email/cubit/cubit.dart';
import 'package:earn_by_return/modules/check_email/cubit/states.dart';
import 'package:earn_by_return/modules/register/register_screen.dart';
import 'package:earn_by_return/modules/reset_password/reset_password_screen.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../login/login_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  String email;
  String comeFrom;
   late String code;
  CheckEmailScreen({super.key, required this.email, required this.comeFrom});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckEmailCubit(),
      child: BlocConsumer<CheckEmailCubit, CheckEmailstates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CheckEmailSuccessstate) {
            ShowToast(text: state.message, state: ToastStates.SUCCESS);
            if (comeFrom == 'RegisterScreen') {
              navigateTo(context, LoginScreen());
            } else {
              navigateTo(context, ResetPasswordScreen());
            }
          }
          if (state is CheckEmailErrorstate) {
            ShowToast(text: state.error_message, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(actions: [
              IconButton(
                icon: closeIcon,
                onPressed: () {
                  navigateTo(context, RegisterScreen());
                },
              ),
            ]),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                          fit: BoxFit.cover,
                          height: 250,
                          width: 250,
                          image: AssetImage('assets/images/check_email.jpg')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        "Check Your Email"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        "we sent 4 digit code to"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                        "$email"),
                    SizedBox(
                      height: 15,
                    ),
                    VerificationCode(

                      textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      keyboardType: TextInputType.number,
                      underlineColor:
                          defaultColor, // If this is null it will use primaryColor: Colors.red from Theme
                      length: 4,
                      margin: EdgeInsets.all(15),
                      cursorColor: Colors
                          .blue, // If this is null it will default to the ambient
                      // clearAll is NOT required, you can delete it
                      // takes any widget, so you can implement your design

                      onCompleted: (String value) {
                        code = value;
                      },
                      onEditing: (bool value) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(

                        condition: state is! CheckEmailLoadingstate,

                        builder: (context) => defaultButton(
                            // clickable: clickable,
                            width: 320,
                            // background: clickable
                            //     ? defaultColor
                            //     : Colors.grey,
                            clickable: true,
                            background: true ? defaultColor : Colors.grey,
                            function: () {

                                   print("helllooo this coddeeee $code");
                                  CheckEmailCubit.get(context).userCheckEmail(
                                      email: email,
                                    code: int.parse(code)
                                     );




                                ;

                              ;
                            },
                            text: 'Verify'),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator())),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        "Don’t receive a verification code?  "),
                    SizedBox(
                      height: 1,
                    ),
                    defaultTextButton(
                        function: () {},
                        text: "Resend code",
                        color: defaultColor,
                        fontSize: 14)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
