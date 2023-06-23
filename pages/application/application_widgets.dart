import 'package:bloc_practice2/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];

  return _widget[index];
}

BottomNavigationBarItem buildBottomBarIcons(String label, String iconName){
  String iconPath = "assets/icons/$iconName.png";
  return BottomNavigationBarItem(
    label: label,
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(iconPath),
    ),
    activeIcon: SizedBox(
        width: 20.w,
        height: 20.h,
        child: Image.asset(iconPath, color: AppColors.primaryElement)
    ),
  );
}
