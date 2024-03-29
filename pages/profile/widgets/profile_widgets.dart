import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 18.w,
              height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp
             ),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      )
    ),
  );
}

Widget profileIconAndEditButton(){
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 12.w),
    width: 120.w,
    height: 120.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage(
                "assets/icons/headpic.png"
            )
        )

    ),
    child: Image(
      width: 35.w,
      height: 35.h,
      image: AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

var imagesInfo = <String, String>{
  "Settings":"settings.png",
  "Payment details":"credit-card.png",
  "Achievements":"award.png",
  "Love":"heart(1).png",
  "Daily reminders":"cube.png",
};

Widget buildListView(){
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                imagesInfo.keys.elementAt(index),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                ),
              ),
            ],
          ),
        ),
      ))
    ],
  );
}

