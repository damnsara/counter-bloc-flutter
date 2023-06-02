import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_in_blocs.dart';

class SignInController{

  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try{
      if(type=="email"){
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty){
            //warning message
        }
        if (password.isEmpty){
            //warning message
        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user==null){

          }
          if(!credential.user!.emailVerified){

          }
          var user = credential.user;
          if(user!=null){
            //got verified user from firebase
          }else{
            //error getting from user firebase
          }
        }catch(e){

        }
      }
    }catch(e){

    }
  }

}