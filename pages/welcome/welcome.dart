import 'package:bloc_practice2/main.dart';
import 'package:bloc_practice2/pages/welcome/bloc/welcome_events.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state){
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      print("index value is ${index}");
                    },
                    children: [
                      _page(1,
                          context,
                          "Check it out!",
                          "First See Learning",
                          "All knowledge you need in a single platform!",
                          "assets/images/reading.png"),
                      _page(2,
                          context,
                          "See More",
                          "Connect With Everyone!",
                          "Sharing and keeping in touch is the best strategy!",
                          "assets/images/boy.png"),
                      _page(3,
                          context,
                          "Get Started!",
                          "Allow Yourself to be Fascinated",
                          "Learn about everything you want. Anywhere, anytime.",
                          "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                    bottom: 30.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 315.w,
          child: Image.asset(imagePath),
        ),
        Container(
          child: Text(title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        SizedBox(
          width: 50.0,
          height: 25.0,
        ),
        Container(
          child: Text(subtitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate
              );
            }else{
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(6, 10),
                  )
                ]
            ),
            child: Center(
              child: Text(buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
