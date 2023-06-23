import 'package:bloc_practice2/pages/register/bloc/register_events.dart';
import 'package:bloc_practice2/pages/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_states.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Center(
                      child: reusableText("Enter your details and sign up for free")
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Username"),
                        buildTextField("Enter your username", "name", "user",
                                (value){
                              context.read<RegisterBloc>().add(UserNameEvent(value));
                            }),
                        reusableText("E-mail"),
                        buildTextField("Enter your e-mail address", "email", "user",
                                (value){
                              context.read<RegisterBloc>().add(EmailEvent(value));
                            }),
                        reusableText("Password"),
                        buildTextField("Enter your password", "password", "lock",
                                (value){
                              context.read<RegisterBloc>().add(PasswordEvent(value));
                            }),
                        reusableText("Confirm your password"),
                        buildTextField("Confirm your password", "password", "lock",
                                (value){
                              context.read<RegisterBloc>().add(RePasswordEvent(value));
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: reusableText("By creating an account, we assume you agree with our Terms and Policy."),
                  ),
                  buildLogAndRegisterButton("Sign Up", "login", (){
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context:context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
        }
  }
