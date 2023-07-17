import 'package:bloc_practice2/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_practice2/pages/home/bloc/home_page_events.dart';
import 'package:bloc_practice2/pages/home/bloc/home_page_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/icons/person.png"
                  )
                ),
              ),
            ),
          ),
        ],
      )
    )
  );
}
//reusable big text widget
Widget homePageText(String text, {Color color=AppColors.primaryText, int top=20}){
 return Container(
   margin: EdgeInsets.only(top: top.h),
   child: Text(
     text,
     style: TextStyle(
         color: color,
         fontSize: 24.sp,
         fontWeight:FontWeight.bold
     ),
   ),
 );
}

Widget searchView(){
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText),
        ),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 17.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(7, 5, 0, 5),
                  hintText: "Search for your course",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),

                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp
                ),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 5.w),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageStates state){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 180.h,
        child: PageView(
          onPageChanged: (value){
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/icons/Art.png"),
            _slidersContainer(path: "assets/icons/Image(1).png"),
            _slidersContainer(path: "assets/icons/Image(2).png")
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            )
          ),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}){
  return Container(
    margin: EdgeInsets.only(right: 5.w),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView(){
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText("Choose your course"),
            GestureDetector(
                child: _reusableText("See all", color: AppColors.primaryThirdElementText, fontSize: 14)
            ),
          ],
        )
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular", textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
            _reusableMenuText("Newest",textColor: AppColors.primaryThirdElementText, backgroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableText(String text, {Color color=AppColors.primaryText,
                        double fontSize = 16, FontWeight fontWeight = FontWeight.bold}){
  return Text(text,
    style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize
    ),
  );
}

//reusable text for the menu buttons
Widget _reusableMenuText(String text, {Color textColor = AppColors.primaryElementText,
                          Color backgroundColor = AppColors.primaryElement}){
       return Container(
         margin: EdgeInsets.only(right: 20.w),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: backgroundColor)
          ),
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 5.h,
            bottom: 5.h,
          ),
          child: _reusableText(text, color: textColor, fontSize: 11,
              fontWeight: FontWeight.normal)
        );
}

Widget courseGrid(){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                "assets/icons/Image(2).png"
            )
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Software Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.normal,
              fontSize: 11.sp
          ),
        )
      ],
    ),
  );
}