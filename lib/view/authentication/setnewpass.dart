import 'package:flutter/material.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class SetNewPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SetNewPass();
  }
}

class _SetNewPass extends State<SetNewPass> {
  ColorsApp colorsApp = new ColorsApp();
  ShowModalBottomSheet showModalBottomSheet = new ShowModalBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorsApp.colorbody,
        body: Consumer<Control>(builder: (context, val, child) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 70),
                        child: Text(
                          "Set a new password",
                          style: TextStyle(
                              color: colorsApp.colorwhiteapp,
                              fontSize: 28,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Create a new password. Ensure it differs from previous ones for security",
                        style: TextStyle(
                            color: colorsApp.colorwhiteapp,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
///////////////////////
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: colorsApp.colorbody,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          textAlign: TextAlign.start,
                          "Create a new password. Ensure it differs from previous ones for security",
                          style: TextStyle(
                              color: colorsApp.colorblackapp,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      InputAppPass(
                          hint: "•••••••••",
                          show: true,
                          controler: val.api.newpass,
                          iconp: Icon(
                            Icons.lock,
                            color: colorsApp.colorbordernotactive,
                          ),
                          icons: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off_outlined,
                                color: colorsApp.colorbordernotactive,
                              )),
                          keyboard: TextInputType.number),
                      InputAppPass(
                          hint: "•••••••••",
                          show: true,
                          controler: val.api.confirmnewpass,
                          iconp: Icon(
                            Icons.lock,
                            color: colorsApp.colorbordernotactive,
                          ),
                          icons: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off_outlined,
                                color: colorsApp.colorbordernotactive,
                              )),
                          keyboard: TextInputType.number),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonApp(
                          title: "Update Password",
                          color: colorsApp.colorblackapp,
                          colorfont: colorsApp.colorwhiteapp,
                          width: double.infinity,
                          height: 54,
                          func: () {
                            val.ResetPass();
                            // showModalBottomSheet.bottomSheetCheck(context,
                            //         () {
                            //        Navigator.of(context).pushNamedAndRemoveUntil(
                            //   "login", // اسم الشاشة التي تريد الانتقال إليها
                            //   (Route<dynamic> route) =>
                            //       false, // تعني إزالة كل الشاشات السابقة
                            // );
                            //     });
                           
                          }),
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
