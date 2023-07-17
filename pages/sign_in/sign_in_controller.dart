import 'package:bloc_practice2/common/values/constant.dart';
import 'package:bloc_practice2/common/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../global.dart';
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
          toastInfo(msg: "E-mail field cannot be empty");
          return;
        }
        if (password.isEmpty){
            //warning message
          toastInfo(msg: "Password field cannot be empty");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "This user does not exist");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "User not verified");
          }
          var user = credential.user;
          if (user != null) {
            //got verified user from firebase
            print("user exists");
            Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //error getting from user firebase
            toastInfo(msg: "You're not a user of this app");
          }

        } on FirebaseAuthException catch(e){
          if (e.code == 'user-not-found'){
            toastInfo(msg: "No user found for this e-mail");
          } else if (e.code == 'wrong-password'){
            toastInfo(msg: "Wrong password for this user");
          } else if (e.code == 'invalid-email'){
            toastInfo(msg: "Wrong e-mail format");
          }
        }
      }
    } catch(e){
        print(e.toString());
    }
  }

}