import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:teamhup/view/home/componanthome.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ColorsApp colorsApp = new ColorsApp();
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                        radius: 23,
                      ),
                      subtitle: Text(
                        "Mike Cooper",
                        style: TextStyle(
                            color: colorsApp.colorwhiteapp,
                            fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "Marketing Officer,",
                        style: TextStyle(
                            color: colorsApp.colorwhiteapp,
                            fontWeight: FontWeight.w100),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: colorsApp.colorwhiteapp,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("notification");
                            },
                            icon: Icon(Icons.notifications_outlined)),
                      ),
                    ),
                  ),

                  ///
                  Appointments(),
                ],
              ),

              //feature home
              Container(
                width: double.infinity,
                height: 250,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // عدد الأعمدة في الشبكة
                      crossAxisSpacing: 2, // المسافة بين الأعمدة
                      mainAxisSpacing: 2, // المسافة بين الصفوف
                      childAspectRatio: 0.8, // نسبة العرض إلى الارتفاع
                    ),
                    itemCount: val.homeButton1.length, // عدد العناصر في الشبكة
                    itemBuilder: (context, i) {
                      return ButtonHome(
                          title: val.homeButton1[i]['title'],
                          image: val.homeButton1[i]['image'],
                          color: colorsApp.colorwhiteapp,
                          colorfont: colorsApp.colorblackapp,
                          func: () {
                            if (val.homeButton1[i]['title'] == "Payroll") {
                              Navigator.of(context).pushNamed("payroll");
                            } else if (val.homeButton1[i]['title'] ==
                                "Payslip") {
                              Navigator.of(context).pushNamed("payslip");
                            } else if (val.homeButton1[i]['title'] ==
                                "Counseling") {
                              Navigator.of(context).pushNamed("counseling");
                            } else if (val.homeButton1[i]['title'] ==
                                "Time Off") {
                              Navigator.of(context).pushNamed("timeoff");
                            } else if (val.homeButton1[i]['title'] ==
                                "Calendar") {
                              Navigator.of(context).pushNamed("calendar");
                            } else if (val.homeButton1[i]['title'] ==
                                "Holiday") {
                              Navigator.of(context).pushNamed("holiday");
                            } else if (val.homeButton1[i]['title'] ==
                                "Resign") {
                              Navigator.of(context).pushNamed("resign");
                            }
                            //دا تصميم قديم لعرض باقي المميزات
                            // if (val.homeButton1[i]['title'] == "Other") {
                            //   showBottomSheet.bottomSheetHome(context);
                            // }
                          });
                    }),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorsApp.colorwhiteapp,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                            "assets/images/map.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            print(val.managerIdbox.get("managerId"));
                            
                            // Navigator.of(context).pushNamed("checkinout");
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.5), // Shadow color with opacity
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset: Offset(0,
                                        3), // Changes position of shadow (x, y)
                                  ),
                                ],
                                color: colorsApp.colorblackapp,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  size: 27,
                                  Icons.fingerprint,
                                  color: colorsApp.colorwhiteapp,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Enter",
                                  style:
                                      TextStyle(color: colorsApp.colorwhiteapp),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Main branch Nasr",
                            style: TextStyle(
                              color: colorsApp.colorgreyapp,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "Out of range",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
