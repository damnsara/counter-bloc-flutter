import 'package:bloc_practice2/common/values/colors.dart';
import 'package:bloc_practice2/pages/application/application_widgets.dart';
import 'package:bloc_practice2/pages/application/bloc/application_blocs.dart';
import 'package:bloc_practice2/pages/application/bloc/application_events.dart';
import 'package:bloc_practice2/pages/application/bloc/application_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 2,
                    )
                  ]
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (value){
                  context.read<AppBloc>().add(TriggerAppEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,

                items: [
                  buildBottomBarIcons("Home", "home"),
                  buildBottomBarIcons("Search", "search2"),
                  buildBottomBarIcons("Courses", "play-circle1"),
                  buildBottomBarIcons("Chat", "message-circle"),
                  buildBottomBarIcons("Profile", "person2"),
                ],

              ),
            ),
          ),
        ),
      );
    });
  }
}
