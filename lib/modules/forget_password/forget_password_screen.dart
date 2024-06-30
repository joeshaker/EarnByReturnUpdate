import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:earn_by_return/modules/forget_password/cubit/cubit.dart';
import 'package:earn_by_return/modules/forget_password/cubit/states.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component/components.dart';
import '../../shared/component/component/constants.dart';
import '../check_email/check_email_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  var fromKey = GlobalKey<FormState>();
  var EmailController = TextEditingController();

  bool clickable =false ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgetCubit(),
  child: BlocConsumer<ForgetCubit, Forgetstates>(
  listener: (context, state) {
    // TODO: implement listener

    if(state is ForgetSuccessstate){
      ShowToast(text: state.message,state: ToastStates.SUCCESS );
      navigateTo(context, CheckEmailScreen(email: EmailController.text,comeFrom: 'ForgetScreen',));
    }
    if(state is ForgetErrorstate){
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
                      "Forget Password"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                      ),
                      "Please enter your registered email to reset your password"),
                  SizedBox(
                    height: 90,
                  ),


                  defaultTextForm(
                    controller: EmailController,
                    label: "Email",
                    hintText: 'enter the email',
                    isPassword:false,


                    type: TextInputType.emailAddress,
                    suffixPressed: () {

                    },
                    onSubmit: (value) {

                    },
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Email should not be empty";
                      }

                      return null;
                    },
                    onChange: (value) {
                      clickable = EmailController.text.isNotEmpty;
                      //  RegisterCubit.get(context).Changebuttonclick(clickable);

                    },
                  ),
                  const SizedBox(
                    height: 250,
                  ),


                  ConditionalBuilder(

                      condition: state is! ForgetLoadingstate, 
                      builder: (context) => defaultButton(

                        // clickable: clickable,
                        // background: clickable
                        //     ? defaultColor
                        //     : Colors.grey,
                          clickable: true,
                          background:defaultColor,
                          function: () {
                            if (fromKey.currentState!.validate()) {

                                ForgetCubit.get(context).userForgetPass(
                                    email: EmailController.text,
                                   );



                              ;
                            }
                            ;
                          },
                          text: 'Recover Password'),
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
