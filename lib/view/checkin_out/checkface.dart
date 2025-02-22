import 'package:flutter/material.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';

class CheckFace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckFace();
  }
}

class _CheckFace extends State<CheckFace> {
  ColorsApp colorsApp = new ColorsApp();
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30),
        height: 200,
        width: double.infinity,
        color: colorsApp.colorwhiteapp.withOpacity(0.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorsApp.colorgreyapp.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                textAlign: TextAlign.center,
                "Click this button to start, and ensure your camera is set up and ready",
                style: TextStyle(fontSize: 13, color: colorsApp.colorwhiteapp),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                showBottomSheet.bottomSheetCheckIn(context,"Authentication successful!");
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: colorsApp.colorwhiteapp, width: 3),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: colorsApp.colorwhiteapp,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
