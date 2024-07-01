import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/reset_password/cubit/states.dart';
import 'package:earn_by_return/modules/reset_password/reset_password_screen_done.dart';
import 'package:earn_by_return/shared/network/local/cache_helper.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import 'change_passsword_done_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  var fromKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var CurrentpasswordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  bool clickable =false ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePassCubit(),
      child: BlocConsumer<ChangePassCubit, ChangePassstates>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is ChangePassSuccessstate){
            ShowToast(text: state.message,state: ToastStates.SUCCESS );
            navigateTo(context, ChangePasswordDoneScreen());
          }
          if(state is ChangePassErrorstate){
            ShowToast(text: state.error_message, state: ToastStates.ERROR);

          }

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: backicon,
                onPressed: () {

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
                            "Change Password"),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                            ),
                            "Please enter your current password, new password and confirm the password"),
                        SizedBox(
                          height: 45,
                        ),
                        defaultTextForm(
                          controller: CurrentpasswordController,
                          label: "Current Password",
                          hintText: '',

                          isPassword: ChangePassCubit.get(context).CurrentPasswordVisable,
                          suffixicon: ChangePassCubit.get(context).CurrentPasswordsuffix,

                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            ChangePassCubit.get(context)
                                .changePasswordVisiability('currentPassword');
                          },
                          onSubmit: (value) {

                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "current Password should not be empty";
                            }
                            return null;
                          },
                          onChange: (value) {
                            clickable = passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty && CurrentpasswordController.text.isNotEmpty;
                            //  RegisterCubit.get(context).Changebuttonclick(clickable);

                          },
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        defaultTextForm(
                          controller: passwordController,
                          label: "Password",
                          hintText: '',

                          isPassword: ChangePassCubit.get(context).passwordVisable,
                          suffixicon: ChangePassCubit.get(context).Passwordsuffix,

                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            ChangePassCubit.get(context)
                                .changePasswordVisiability('password');
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
                            clickable = passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty && CurrentpasswordController.text.isNotEmpty;
                            //  RegisterCubit.get(context).Changebuttonclick(clickable);

                          },
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        defaultTextForm(
                          controller: ConfirmPasswordController,
                          label: "Confirm Password",
                          hintText: '',
                          onSubmit: (value) {
                            if (fromKey.currentState!.validate()) {}
                          },
                          isPassword:
                          ChangePassCubit.get(context).ConfirmpasswordVisable,
                          suffixicon:
                          ChangePassCubit.get(context).ConfirmPasswordsuffix,
                          type: TextInputType.visiblePassword,
                          suffixPressed: () {
                            ChangePassCubit.get(context)
                                .changePasswordVisiability('confirmPassword');
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
                            clickable = passwordController.text.isNotEmpty && ConfirmPasswordController.text.isNotEmpty && CurrentpasswordController.text.isNotEmpty;
                            // RegisterCubit.get(context).Changebuttonclick(clickable);

                          },
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        ConditionalBuilder(
                            condition: state is! ChangePassLoadingstate,

                            builder: (context) => defaultButton(

                              clickable: clickable,
                              background: clickable
                                  ? defaultColor
                                  : Colors.grey,
                                // clickable: true,
                                // background:defaultColor,
                                function: () {
                                  if (fromKey.currentState!.validate()) {
                                    if (ConfirmPasswordController.text ==
                                        passwordController.text) {

                                      ChangePassCubit.get(context).userChangePass(
                                        token: CacheHelper.getData(key: 'token').toString(),
                                        password: passwordController.text,
                                        confrimPassword:  ConfirmPasswordController.text, currentPassword: CurrentpasswordController.text,
                                      );

                                    }else{

                                      ShowToast(text: "password and confirm password do\'nt match", state: ToastStates.ERROR);
                                    }


                                    ;
                                  }
                                  ;
                                },
                                text: 'Update Password'),
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
