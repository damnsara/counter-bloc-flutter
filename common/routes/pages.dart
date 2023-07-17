
import 'package:bloc_practice2/common/routes/names.dart';
import 'package:bloc_practice2/global.dart';
import 'package:bloc_practice2/pages/application/application_page.dart';
import 'package:bloc_practice2/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_practice2/pages/register/register.dart';
import 'package:bloc_practice2/pages/sign_in/sign_in.dart';
import 'package:bloc_practice2/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_practice2/pages/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/application/bloc/application_blocs.dart';
import '../../pages/home/home_page.dart';
import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/sign_in/bloc/sign_in_blocs.dart';

class AppPages{
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_)=>SignInBloc(),)
      ),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_)=>RegisterBloc(),)
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_)=>AppBloc(),)
      ),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_)=>HomePageBlocs(),)
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()){
      blocProviders.add(bloc.bloc);

    }
    return blocProviders;
  }
// a model that covers the entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      // check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_)=>const SignIn(), settings:settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}

//unify bloc provider and pages
class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}