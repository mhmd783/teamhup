import 'package:flutter/material.dart';
import 'package:teamhup/componant/appbarsimple.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class PaySlip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaySlip();
  }
}

class _PaySlip extends State<PaySlip> {
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarSimple(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: "Payslip",
          backgroundColor: colorsApp.colorwhiteapp,
        ),
        backgroundColor: colorsApp.colorwhiteapp,
        body: Consumer<Control>(builder: (context, val, child) {
          return Container(
            child: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Set Financial Payslip needed",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: InputApp2(
                          hint: "00.00",
                          controler: val.api.advancemony,
                          icon: Icon(
                            Icons.money_off_outlined,
                            color: colorsApp.colorgreyapp,
                          ),
                          keyboard: TextInputType.number),
                    ),
                    Divider(
                      thickness: 7,
                      height: 30,
                      color: colorsApp.colorgreyapp.withOpacity(0.2),
                    ),
                    //celender
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "When do you want to receive it?",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        "Set date",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: InputApp2(
                          hint: "29 September 2023",
                          controler: val.api.advancemony,
                          icon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              color: colorsApp.colorgreyapp,
                            ),
                          ),
                          keyboard: TextInputType.number),
                    ),
                    Divider(
                      thickness: 7,
                      height: 30,
                      color: colorsApp.colorgreyapp.withOpacity(0.2),
                    ),
                    //description
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Description",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: InputAppDescription(
                          hint: "write your complete reason here...",
                          controler: val.api.advancemony,
                          keyboard: TextInputType.text),
                    ),
                    Divider(
                      thickness: 7,
                      height: 30,
                      color: colorsApp.colorgreyapp.withOpacity(0.2),
                    ),
                    //attachment
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Attachment",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "(optional)",
                            style: TextStyle(
                                fontSize: 12, color: colorsApp.colorgreyapp),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: colorsApp.colorblueapp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: colorsApp.colorblueapp,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Upload files",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: colorsApp.colorblueapp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 50,
                      height: 50,
                      color: colorsApp.colorgreyapp.withOpacity(0.2),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          color: colorsApp.colorgreyapp.withOpacity(0.2),
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: colorsApp.colorwhiteapp,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: ButtonApp(
                              title: "Submit Payslip request",
                              color: colorsApp.colorblackapp,
                              colorfont: colorsApp.colorwhiteapp,
                              width: double.infinity,
                              height: 50,
                              func: () {
                                if (formstate.currentState!
                                        .validate() &&
                                    val.imageFilePaySlip != null) {
                                  val.AddPaySlip(context);
                                  showBottomSheet.bottomSheetPayslip(context);
                                  print("valied");
                                } else {
                                  print("not valied");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(child: Text("اكمل البيانات")),
                                      duration: Duration(
                                          seconds: 2), // مدة الرسالة (ثانيتين)
                                    ),
                                  );
                                }
                                
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
