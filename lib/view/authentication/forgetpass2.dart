import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class ForgetPass2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPass2();
  }
}

class _ForgetPass2 extends State<ForgetPass2> {
  ColorsApp colorsApp = new ColorsApp();
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
          return Container(
            // padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Check your email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text.rich(
                    TextSpan(
                      text: "We sent a reset link to ", // الجزء الأول من النص
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "${val.api.emailforgetpass.text}", // النص الغامق
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // نمط الغامق
                        ),
                        TextSpan(
                          text:
                              " enter the 5 digit code that is mentioned in the email.", // الجزء المتبقي من النص
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            child: InputCode(
                                hint: "*",
                                controler: val.api.code1,
                                keyboard: TextInputType.number),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "*",
                              controler: val.api.code2,
                              keyboard: TextInputType.number),
                        )),
                        Expanded(
                          child: Container(
                            child: InputCode(
                                hint: "*",
                                controler: val.api.code3,
                                keyboard: TextInputType.number),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "*",
                              controler: val.api.code4,
                              keyboard: TextInputType.number),
                        )),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "*",
                              controler: val.api.code5,
                              keyboard: TextInputType.number),
                        )),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "*",
                              controler: val.api.code6,
                              keyboard: TextInputType.number),
                        )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven’t got the email yet?",
                      style: TextStyle(
                          color: colorsApp.colorgreyapp, fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {
                          val.Forget();
                        },
                        child: Text(
                          "Resend email",
                          style: TextStyle(
                              color: colorsApp.colorblackapp,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
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
                        title: "Verify Code",
                        color: colorsApp.colorblackapp,
                        colorfont: colorsApp.colorwhiteapp,
                        width: double.infinity,
                        height: 50,
                        func: () {
                          val.VerfyForget();
                          
                          showModalBottomSheet.bottomSheetCheck(context,
                                    () {
                                  Navigator.of(context).pushNamed("setnewpass");
                                });
                          
                          }),


                  ),
                )
              ],
            ),
          );
        }));
  }
}
