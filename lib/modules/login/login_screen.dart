import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/layout/earn_by_return_layout/app_layout.dart';
import 'package:earn_by_return/modules/Redeem/Redeem.dart';
import 'package:earn_by_return/modules/bottomnavbar/bottomnav.dart';
import 'package:earn_by_return/modules/forget_password/forget_password_screen.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../BottomnavAdmin/BottomnavAdmine.dart';
import '../history/History.dart';
import '../profile/Profile.dart';
import '../register/register_screen.dart';
import '../voucher/voucher.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, Loginstates>(
        listener: (context, state) {
          if (state is LoginSuccessstate) {
            //احنا  عاملنا هنا ال Check جوا حاله ال Success عمتا
            // لان هو كده معناه تمام ان سيرفر شغال ولكن مش عارف بقي حاله البيانات جواه عامله ازاي
            if (state.loginModel.status=="success") {
              //هنا لما كانت البيانات تمام
              ShowToast(
                  text: state.loginModel.message, state: ToastStates.SUCCESS);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.token)
                  .then((value) {
                    if(state.loginModel.data!.role=="admin"){
                     selectedRole=state.loginModel.data!.role;
                     Role=state.loginModel.data!.role;

                      CacheHelper.saveData(key: 'role', value: state.loginModel.data!.role);
                      navigateAndFinish(context, BottomNavAdmin());

                    }else{
                      selectedRole=state.loginModel.data!.role;
                      Role=state.loginModel.data!.role;
                      CacheHelper.saveData(key: 'role', value: state.loginModel.data!.role);

                      navigateAndFinish(context,  Bottonav());
                    }


              });
            }
            else {
              //هنا لما كانت البيانات مش  تمام
              ;
              ShowToast(
                  text: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
          if(state is LoginErrorstate){
            ShowToast(
                text: state.error_message, state: ToastStates.ERROR);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width*0.7,
                            child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/logo.png'))),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            elevatedButtonWithPic(
                                context: context,

                                text: "Facebook",
                                image: "assets/images/facebook.jpg"),
                            elevatedButtonWithPic(
                              context: context,
                                text: "Google",
                                image: "assets/images/google.jpg"),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            label: "Email Id or Mobile Phone",
                            hintText: '',
                            onSubmit: (value) {
                               if (fromKey.currentState!.validate()) {}
                            },
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Email should not be empty";
                              }
                              return null;
                            },
                            onChange: (value) {
                              if (value!.isEmpty ||
                                  passwordController.text.isEmpty) {
                                LoginCubit.get(context)
                                    .makebuttonUnclickable(false);
                              }
                              if (value!.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                LoginCubit.get(context)
                                    .makebuttonUnclickable(true);
                              }
                            },
                            suffixPressed: () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          label: "Password",
                          hintText: '',
                          isPassword: LoginCubit.get(context).passwordVisable,
                          suffixicon: LoginCubit.get(context).suffix,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisiability();
                          },
                          onSubmit: (value) {
                            if (fromKey.currentState!.validate()) {}
                            //   LoginCubit.get(context).userLogin(
                            //     email: emailController.text,
                            //     password: passwordController.text,
                            //   );
                            // }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "password should not ne empty";
                            }
                          },
                          onChange: (value) {
                            if (value!.isEmpty ||
                                emailController.text.isEmpty) {
                              LoginCubit.get(context)
                                  .makebuttonUnclickable(false);
                            }
                            if (value!.isNotEmpty &&
                                emailController.text.isNotEmpty) {
                              LoginCubit.get(context)
                                  .makebuttonUnclickable(true);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultTextButton(
                                color: defaultColor,
                                fontSize: 12,
                                function: () {
                                  navigateTo(context,  ForgetPasswordScreen());
                                },
                                decoration: TextDecoration.underline,
                                text: 'Forget Password')
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingstate,
                            builder: (context) => defaultButton(
                                clickable: LoginCubit.get(context).clickable,
                                background: LoginCubit.get(context).clickable
                                    ? defaultColor
                                    : Colors.grey,
                                function: () {
                                  if(LoginCubit.get(context).clickable){
                                    if (fromKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }

                                  }


                                },
                                text: 'Login'),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator())),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                'Don\'t have an account?'),
                            defaultTextButton(
                                color: defaultColor,
                                fontSize: 12,
                                function: () {
                                  navigateTo(context,  RegisterScreen());
                                },
                                text: 'Register Now')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
