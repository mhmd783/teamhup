import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:teamhup/view/activity/activity.dart';
import 'package:teamhup/view/analytics/analytics.dart';
import 'package:teamhup/view/home/home.dart';
import 'package:teamhup/view/profile/profile.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: colorsApp.colorwhiteapp.withOpacity(0.95),
        body: val.activeIndex == 0
            ? Home()
            : val.activeIndex == 1
                ? Analytics()
                : val.activeIndex == 2
                    ? Activity()
                    : Profile(),
        // resizeToAvoidBottomInset:
        //     false, // تعطيل تغيير حجم الواجهة بسبب ظهور الكيبورد
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).pushNamed("checkinout");
        //     //go to photo face
        //   },
        //   backgroundColor: Colors.black,
        //   child: Icon(Icons.fingerprint, color: Colors.white),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(20)), // انحناء الزوايا
          child: AnimatedBottomNavigationBar(
            icons: val.iconList,
            activeIndex: val.activeIndex,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.softEdge,
            backgroundColor: colorsApp.colorwhiteapp,
            activeColor: colorsApp.colorblackapp,
            inactiveColor: colorsApp.colorgreyapp,
            splashColor: colorsApp.colorblackapp,
            splashSpeedInMilliseconds: 300,
            onTap: (index) {
              val.changeScreenByNavBar(index);
            },
          ),
        ),
      );
    });
  }
}
