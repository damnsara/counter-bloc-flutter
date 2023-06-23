import 'package:bloc_practice2/pages/register/bloc/register_blocs.dart';
import 'package:bloc_practice2/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_practice2/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(
      create: (context) => WelcomeBloc(),
    ),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegisterBloc())
  ];
}