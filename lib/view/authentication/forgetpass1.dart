import 'package:flutter/material.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class ForgetPass1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPass1();
  }
}

class _ForgetPass1 extends State<ForgetPass1> {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  ShowModalBottomSheet showModalBottomSheet = new ShowModalBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Forgot password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          backgroundColor: colorsApp.colorgreyapp.withOpacity(0.2),
        ),
        backgroundColor: colorsApp.colorbody,
        body: Consumer<Control>(builder: (context, val, child) {
          return Form(
            key: formstate,
            child: Container(
              // padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Forgot password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Please enter your email to reset the password",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: InputApp(
                        hint: "example@gmail.com",
                        controler: val.api.emailforgetpass,
                        icon: Icon(
                          Icons.email_outlined,
                          color: colorsApp.colorgreyapp,
                        ),
                        keyboard: TextInputType.emailAddress),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20),
                    color: colorsApp.colorgreyapp.withOpacity(0.2),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: colorsApp.colorwhiteapp),
                      child: ButtonApp(
                          title: "Reset Password",
                          color: colorsApp.colorblackapp,
                          colorfont: colorsApp.colorwhiteapp,
                          width: double.infinity,
                          height: 50,
                          func: () {
                            if (formstate.currentState!.validate()) {
                              val.Forget();
                              showModalBottomSheet.bottomSheetCheck(context,
                                    () {
                                  Navigator.of(context).pushNamed("forgetpass2");
                                });
                              
                            }
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
