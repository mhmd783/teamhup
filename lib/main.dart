import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart'; // استيراد path_provider
import 'package:teamhup/provider/prov.dart';
import 'package:teamhup/view/checkin_out/faceid.dart';
import 'package:teamhup/view/home/payslip/payslip.dart';
import 'package:teamhup/view/authentication/forgetpass1.dart';
import 'package:teamhup/view/authentication/forgetpass2.dart';
import 'package:teamhup/view/authentication/login.dart';
import 'package:teamhup/view/authentication/setnewpass.dart';
import 'package:teamhup/view/boarding/board.dart';
import 'package:teamhup/view/checkin_out/checkinout.dart';
import 'package:teamhup/view/home/calender/calender.dart';
import 'package:teamhup/view/home/combinedholiday/combinedholiday.dart';
import 'package:teamhup/view/home/counseling/counseling.dart';
import 'package:teamhup/view/home/departures/departures.dart';
import 'package:teamhup/view/home/holiday/holiday.dart';
import 'package:teamhup/view/home/payroll/payroll.dart';
import 'package:teamhup/view/home/resign/redignnext.dart';
import 'package:teamhup/view/home/resign/resign.dart';
import 'package:teamhup/view/home/timeoff/timeoff.dart';
import 'package:teamhup/view/home/planningholiday/planningholiday.dart';
import 'package:teamhup/view/mainapp.dart';
import 'package:teamhup/view/notification/notification.dart';
import 'package:teamhup/view/profile/address.dart';
import 'package:teamhup/view/profile/attachments.dart';
import 'package:teamhup/view/profile/bankinformation.dart';
import 'package:teamhup/view/profile/contactInformation.dart';
import 'package:teamhup/view/profile/hrlatter.dart';
import 'package:teamhup/view/profile/personalinformation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // الحصول على مسار المستندات
  Directory dir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(dir.path); // تهيئة Hive مع المسار الصحيح
  await Hive.openBox('language');
  await Hive.openBox('token');
  await Hive.openBox('id');
  await Hive.openBox('email');
  await Hive.openBox('mobile');
  await Hive.openBox('jobCategoryid');
  await Hive.openBox('managerId');
  await Hive.openBox('firstName');
  await Hive.openBox('lastName');
  await Hive.openBox('role');
  ////
  ///
  // قفل الشاشة على الوضع العمودي فقط
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Control();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'board': (context) => Board(),
          'login': (context) => Login(),
          'forgetpass1': (context) => ForgetPass1(),
          'forgetpass2': (context) => ForgetPass2(),
          'setnewpass': (context) => SetNewPass(),
          'mainapp': (context) => MainApp(),
          'payslip': (context) => PaySlip(),
          'checkinout': (context) => CheckInOut(),
          'payroll': (context) => Payroll(),
          'timeoff': (context) => TimeOff(),
          'counseling': (context) => Counseling(),
          'calendar': (context) => Calender(),
          'resign': (context) => Resign(),
          'resignnext': (context) => ResignNext(),
          'holiday': (context) => Holiday(),
          'depatures': (context) => Depatures(),
          'combinedholiday': (context) => CombinedHoliday(),
          'planninghoiday': (context) => PlanningHoiday(),
          'notification': (context) => Notificat(),
          'personalinformation': (context) => PersonalInformation(),
          'contactinformation': (context) => ContactInformation(),
          'address': (context) => Address(),
          'bankinformation': (context) => BankInformation(),
          'attachments': (context) => Attachments(),
          'hrlatter': (context) => HrLatter(),
          'faceid': (context) => FaceId(),
        },
        home:MainApp(),
      ),
    );
  }
}