import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/check_email/check_email_screen.dart';
import 'package:earn_by_return/modules/login/login_screen.dart';
import 'package:earn_by_return/modules/register/cubit/cubit.dart';
import 'package:earn_by_return/modules/register/cubit/states.dart';
import 'package:earn_by_return/shared/component/component/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/earn_by_return_layout/app_layout.dart';
import '../../shared/component/component/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colorsEarn.dart';
import '../login/cubit/cubit.dart';
import '../login/cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var NameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  bool clickable =false ;
  var fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty  ;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, Registerstates>(
        listener: (context, state) {
          if (state is RegisterSuccessstate) {
            if (state.registerModel.status=="success") {
              //هنا لما كانت البيانات تمام
              ShowToast(
                  text: state.registerModel.status,
                  state: ToastStates.SUCCESS);
              CacheHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then((value) {
                navigateTo(context, CheckEmailScreen(email: emailController.text,comeFrom: 'RegisterScreen',))
                ;
                print("${state.registerModel.message} from register heyyy");
              });
            } else {
              //هنا لما كانت البيانات مش  تمام
              print(state.registerModel.message);
              ShowToast(
                  text: state.registerModel.message, state: ToastStates.ERROR);
            }
          }
          if(state is RegisterErrorstate){
            ShowToast(
                text: state.error_message, state: ToastStates.ERROR);
          }

          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: backicon,
                onPressed: () {
                  navigateTo(context, LoginScreen());
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: verticalPadding, horizontal: horizontalPadding),
                child: Form(
                  key: fromKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                            "Register"),
                        SizedBox(
                          height: 45,
                        ),
                        defaultTextForm(
                            controller: NameController,
                            label: "Full Name",
                            hintText: '',
                            onSubmit: (value) {

                            },
                            type: TextInputType.text,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "name should not be empty";
                              }
                              return null;
                            },
                            onChange: (value) {
                              clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty
                                  && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty;
                              RegisterCubit.get(context).Changebuttonclick(clickable);

                            },
                            suffixPressed: () {}),
                        SizedBox(
                          height: 35,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            label: "Email Address",
                            hintText: '',
                            onSubmit: (value) {

                            },
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Email should not be empty";
                              }
                              return null;
                            },
                            onChange: (value) {
                              clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty
                                  && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty;
                              RegisterCubit.get(context).Changebuttonclick(clickable);

                            },
                            suffixPressed: () {}),
                        const SizedBox(
                          height: 35,
                        ),
                        defaultTextForm(
                            controller: mobileController,
                            label: "Mobile Number",
                            hintText: '',
                            onSubmit: (value) {

                            },
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "mobile should not be empty";
                              }
                              return null;
                            },
                            onChange: (value) {
                              clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty
                                  && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty;
                              RegisterCubit.get(context).Changebuttonclick(clickable);

                            },
                            suffixPressed: () {}),
                        const SizedBox(
                          height: 35,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          label: "Password",
                          hintText: '',
                          isPassword:
                              RegisterCubit.get(context).passwordVisable,
                          suffixicon: RegisterCubit.get(context).Passwordsuffix,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisiability(true);
                          },
                          onSubmit: (value) {

                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Password should not be empty";
                            }
                            if(ConfirmPasswordController.text !=
                                passwordController.text
                            ){
                              return " Password must be identical to Confirm password";
                            }
                            return null;
                          },
                          onChange: (value) {
                            clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty
                                && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty;
                            RegisterCubit.get(context).Changebuttonclick(clickable);

                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        defaultTextForm(
                          controller: ConfirmPasswordController,
                          label: "Confirm Password",
                          hintText: '',
                          onSubmit: (value) {
                            if (fromKey.currentState!.validate()) {}
                          },
                          isPassword:
                              RegisterCubit.get(context).ConfirmpasswordVisable,
                          suffixicon:
                              RegisterCubit.get(context).ConfirmPasswordsuffix,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisiability(false);
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password should not be empty";
                            }
                            if(ConfirmPasswordController.text !=
                                passwordController.text
                            ){
                              return "Confirm Password must be identical to password";
                            }
                            return null;
                          },
                          onChange: (value) {
                            clickable = emailController.text.isNotEmpty && NameController.text.isNotEmpty  && mobileController.text.isNotEmpty
                                && passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty;
                            RegisterCubit.get(context).Changebuttonclick(clickable);

                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        ConditionalBuilder(
                            condition: state is! RegisterLoadingstate,
                            builder: (context) => defaultButton(
                                clickable: clickable,
                                background: clickable
                                    ? defaultColor
                                    : Colors.grey,
                                function: () {
                                  if (fromKey.currentState!.validate()) {
                                    if (ConfirmPasswordController.text ==
                                        passwordController.text) {
                                      RegisterCubit.get(context).userRegister(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          passwordConfirm: ConfirmPasswordController.text,
                                          name: NameController.text,
                                          phoneNumber: mobileController.text);
                                      print('${emailController.text }${passwordController.text} ${NameController.text} ${mobileController.text} ');

                                    }else{

                                      ShowToast(text: "password and confirm password do\'nt match", state: ToastStates.ERROR);
                                    }


                                    ;
                                  }
                                  ;
                                },
                                text: 'Register'),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator())),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
