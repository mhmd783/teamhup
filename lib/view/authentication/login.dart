import 'package:flutter/material.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  ColorsApp colorsApp = new ColorsApp();

  GlobalKey<FormState> formstate = GlobalKey();
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
                          "Welcome Back!",
                          style: TextStyle(
                              color: colorsApp.colorwhiteapp,
                              fontSize: 28,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Let’s get you sign in and we will make your work life smoother, together.",
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
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            textAlign: TextAlign.start,
                            "Ensure that your account is associated with your company's email address to access our applications.",
                            style: TextStyle(
                                color: colorsApp.colorblackapp,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        InputApp(
                          hint: "example@gmail.com",
                          controler: val.api.emailSignin,
                          icon: Icon(
                            Icons.email_outlined,
                            color: colorsApp.colorbordernotactive,
                          ),
                          keyboard: TextInputType.emailAddress,
                        ),
                        InputAppPass(
                            hint: "•••••••••",
                            show: true,
                            controler: val.api.passSignin,
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
                            keyboard: TextInputType.visiblePassword),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("forgetpass1");
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: colorsApp.colorblackapp,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                        ButtonApp(
                            title: "Sign in",
                            color: colorsApp.colorblackapp,
                            colorfont: colorsApp.colorwhiteapp,
                            width: double.infinity,
                            height: 54,
                            func: () {
                              if (formstate.currentState!.validate()) {
                                val.Login();
                                //her wue api function before bottomSheet
                                showModalBottomSheet.bottomSheetCheck(context,
                                    () {
                                  Navigator.of(context)
                                      .pushReplacementNamed("mainapp");
                                });
                              }
                            }),
                        // Expanded(child: Container()),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: colorsApp.colorgreyapp,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "If you encounter issues, please contact your company's HR department for assistance.",
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: colorsApp.colorblackapp,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text("Enter With Face Id ")),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("faceid");
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            child: Image.asset("assets/images/face.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
