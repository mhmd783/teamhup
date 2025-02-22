import 'package:flutter/material.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class ShowModalBottomSheet {
  ColorsApp colorsApp = new ColorsApp();
  bottomSheetCheck(BuildContext context, VoidCallback func) {
    showModalBottomSheet(
        backgroundColor: colorsApp.colorbody,
        context: context,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Container(
              width: double.infinity,
              child: val.data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          color: colorsApp.colorgreyapp.withOpacity(0.5),
                          height: 3,
                          width: 60,
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: val.data["status"] == true
                              ? Image.asset("assets/images/accept.png")
                              : Image.asset("assets/images/error.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            textAlign: TextAlign.center,
                            val.data["status"] == true
                                ? "Your request has been sent successfully"
                                : "Your request has been sent faild",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Text(
                            textAlign: TextAlign.center,
                            "${val.data["message"]}",
                            style: TextStyle(
                              color: colorsApp.colorgreyapp,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: val.data["status"] == true
                                ? ButtonApp(
                                    title: "ok",
                                    color: colorsApp.colorblackapp,
                                    colorfont: colorsApp.colorwhiteapp,
                                    width: double.infinity,
                                    height: 50,
                                    func: func)
                                : ButtonApp(
                                    title: "Back",
                                    color: colorsApp.colorblackapp,
                                    colorfont: colorsApp.colorwhiteapp,
                                    width: double.infinity,
                                    height: 50,
                                    func: () {
                                      Navigator.of(context).pop();
                                    }))
                      ],
                    ),
            );
          });
        });
  }

  bottomSheetPayslip(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: colorsApp.colorbody,
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  color: colorsApp.colorgreyapp.withOpacity(0.5),
                  height: 3,
                  width: 60,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Image.asset("assets/images/accept.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Your request has been sent successfully",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                      color: colorsApp.colorgreyapp,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ButtonApp(
                        title: "Back to Home",
                        color: colorsApp.colorblackapp,
                        colorfont: colorsApp.colorwhiteapp,
                        width: double.infinity,
                        height: 50,
                        func: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            "mainapp", // اسم الشاشة التي تريد الانتقال إليها
                            (Route<dynamic> route) =>
                                false, // تعني إزالة كل الشاشات السابقة
                          );
                        }))
              ],
            ),
          );
        });
  }

  bottomSheetCheckIn(BuildContext context, String message) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return message == "Authentication successful!"
              ? Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        color: colorsApp.colorgreyapp.withOpacity(0.5),
                        height: 3,
                        width: 60,
                      ),
                      Container(
                        height: 90,
                        //margin: EdgeInsets.all(0),
                        child: Image.asset("assets/images/accept.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          textAlign: TextAlign.center,
                          "You’re checked in!",
                          style: TextStyle(
                            fontSize: 22,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "07.58 AM",
                          style: TextStyle(
                              fontSize: 30, color: colorsApp.colorfontgreen),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:
                                      colorsApp.colorgreyapp.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    "Mike Cooper",
                                    style: TextStyle(
                                        color: colorsApp.colorblackapp,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    "Marketing Officer",
                                    style: TextStyle(
                                      color: colorsApp.colorgreyapp,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    "DE3824-MO4",
                                    style: TextStyle(
                                      color: colorsApp.colorgreyapp,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              child: Image.asset("assets/images/accept1.png"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Great job! Your attendance has been successfully logged. Hope you have a great day!",
                          style: TextStyle(
                            color: colorsApp.colorgreyapp,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ButtonApp(
                              title: "Back to Home",
                              color: colorsApp.colorblackapp,
                              colorfont: colorsApp.colorwhiteapp,
                              width: double.infinity,
                              height: 50,
                              func: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  "mainapp", // اسم الشاشة التي تريد الانتقال إليها
                                  (Route<dynamic> route) =>
                                      false, // تعني إزالة كل الشاشات السابقة
                                );
                              })),
                      Expanded(child: Container()),
                    ],
                  ),
                )
              : Container(
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        color: colorsApp.colorgreyapp.withOpacity(0.5),
                        height: 3,
                        width: 60,
                      ),
                      Container(
                        height: 90,
                        //margin: EdgeInsets.all(0),
                        child: Image.asset("assets/images/error.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Error",
                          style: TextStyle(
                            fontSize: 22,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ButtonApp(
                              title: "Back",
                              color: colorsApp.colorblackapp,
                              colorfont: colorsApp.colorwhiteapp,
                              width: double.infinity,
                              height: 50,
                              func: () {
                                Navigator.of(context).pop();
                              })),
                    ],
                  ),
                );
        });
  }

  bottomSheetCheckOut(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  color: colorsApp.colorgreyapp.withOpacity(0.5),
                  height: 3,
                  width: 60,
                ),
                Container(
                  height: 90,
                  //margin: EdgeInsets.all(0),
                  child: Image.asset("assets/images/accept.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "You’re checked out!",
                    style: TextStyle(
                      fontSize: 22,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "04.58 PM",
                    style: TextStyle(
                        fontSize: 30, color: colorsApp.colorfontgreen),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: colorsApp.colorgreyapp.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              "Mike Cooper",
                              style: TextStyle(
                                  color: colorsApp.colorblackapp,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              "Marketing Officer",
                              style: TextStyle(
                                color: colorsApp.colorgreyapp,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              textAlign: TextAlign.start,
                              "DE3824-MO4",
                              style: TextStyle(
                                color: colorsApp.colorgreyapp,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        child: Image.asset("assets/images/accept1.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Great job! Your attendance has been successfully logged. Hope you have a great day!",
                    style: TextStyle(
                      color: colorsApp.colorgreyapp,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ButtonApp(
                        title: "Back to Home",
                        color: colorsApp.colorblackapp,
                        colorfont: colorsApp.colorwhiteapp,
                        width: double.infinity,
                        height: 50,
                        func: () {
                          Navigator.of(context).pop();
                        })),
                Expanded(child: Container()),
              ],
            ),
          );
        });
  }

  bottomSheetHome(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    color: colorsApp.colorgreyapp.withOpacity(0.5),
                    height: 3,
                    width: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Choose the service you want to request",
                      style: TextStyle(
                          color: colorsApp.colorblackapp,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ///////
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // عدد الأعمدة في الشبكة
                            crossAxisSpacing: 2, // المسافة بين الأعمدة
                            mainAxisSpacing: 2, // المسافة بين الصفوف
                            childAspectRatio: 0.8, // نسبة العرض إلى الارتفاع
                          ),
                          itemCount:
                              val.homeButton2.length, // عدد العناصر في الشبكة
                          itemBuilder: (context, i) {
                            return ButtonHome(
                                title: val.homeButton2[i]['title'],
                                image: val.homeButton2[i]['image'],
                                color: colorsApp.colorwhiteapp,
                                colorfont: colorsApp.colorblackapp,
                                func: () {});
                          }),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  /////
  bottomSheetResign(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: colorsApp.colorbody,
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    color: colorsApp.colorgreyapp.withOpacity(0.5),
                    height: 3,
                    width: 60,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Read this carefully before submitting your resign letter",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_rounded),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "You are required to provide a notice period as stipulated in your contract.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: colorsApp.colorgreyapp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_rounded),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "You are encouraged to participate in an exit interview to provide valuable feedback",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: colorsApp.colorgreyapp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_rounded),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "You must return all company property, including but not limited to access cards, etc.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: colorsApp.colorgreyapp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_rounded),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "You are required to complete the clearance procedure as outlined by the HR department",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: colorsApp.colorgreyapp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                              value: false,
                              activeColor: colorsApp.colorblackapp,
                              side: BorderSide(width: 0.7),
                              onChanged: (valu) {}),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "By submitting your resignation, you acknowledge that you have read and understood the terms and conditions outlined above",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: colorsApp.colorblackapp),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: ButtonApp(
                                title: "Cancel",
                                color: colorsApp.colorblackapp,
                                colorfont: colorsApp.colorwhiteapp,
                                width: double.infinity,
                                height: 50,
                                func: () {
                                  Navigator.of(context).pop();
                                })),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: ButtonApp(
                                title: "Yes, I Will",
                                color: colorsApp.colorwhiteapp,
                                colorfont: colorsApp.colorblackapp,
                                width: double.infinity,
                                height: 50,
                                func: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    "board", // اسم الشاشة التي تريد الانتقال إليها
                                    (Route<dynamic> route) =>
                                        false, // تعني إزالة كل الشاشات السابقة
                                  );
                                })),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  List data = ['Attendence check', 'Attendence out', 'Payroll', 'Time off'];
  bottomsheetactive(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 350,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  color: colorsApp.colorgreyapp.withOpacity(0.5),
                  height: 3,
                  width: 60,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Activity Filter",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "${data[i]}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                      value: true,
                                      activeColor: colorsApp.colorblackapp,
                                      side: BorderSide(width: 0.7),
                                      onChanged: (valu) {}),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                ButtonApp(
                    title: "Save",
                    color: colorsApp.colorblackapp,
                    colorfont: colorsApp.colorwhiteapp,
                    width: double.infinity,
                    height: 50,
                    func: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  bottomsheetlangoage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  color: colorsApp.colorgreyapp.withOpacity(0.5),
                  height: 3,
                  width: 60,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Language",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(child: Image.asset("assets/images/en.png")),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "English",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                            value: true,
                            activeColor: colorsApp.colorblackapp,
                            side: BorderSide(width: 0.7),
                            onChanged: (valu) {}),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(child: Image.asset("assets/images/ar.png")),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "عربي",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                            value: false,
                            activeColor: colorsApp.colorblackapp,
                            side: BorderSide(width: 0.7),
                            onChanged: (valu) {}),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonApp(
                    title: "Save",
                    color: colorsApp.colorblackapp,
                    colorfont: colorsApp.colorwhiteapp,
                    width: double.infinity,
                    height: 50,
                    func: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }
}
