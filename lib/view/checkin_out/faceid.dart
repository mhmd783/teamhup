import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';

import 'package:local_auth/local_auth.dart';

class FaceId extends StatefulWidget {
  @override
  _FaceIdState createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {
  ColorsApp colorsApp = new ColorsApp();
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();

  final LocalAuthentication auth = LocalAuthentication();

  // تنفيذ المصادقة الحيوية باستخدام البصمة أو الوجه
  Future<void> _authenticate() async {
    bool isAuthenticated = false;
    try {
      // التحقق من الأنواع المتاحة من المصادقة الحيوية
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      // إذا كانت البصمة أو الوجه متاحة، حاول المصادقة
      if (availableBiometrics.isNotEmpty) {
        isAuthenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to access the app',
          // الرسالة للمستخدم
          options: AuthenticationOptions(
            biometricOnly: true, // تأكيد استخدام المصادقة الحيوية فقط
          ),
        );
      } else {
        // إذا لم تتوفر المصادقة الحيوية، أظهر رسالة
        _showMessage("No biometric authentication available.");
        return;
      }
    } catch (e) {
      print("Error during authentication: $e");
    }

    if (isAuthenticated) {
      _showMessage("Authentication successful!");
    } else {
      _showMessage("Authentication failed.");
    }
  }
  
  // عرض رسالة
  void _showMessage(String message) {
    print(message);//Authentication successful! //  Authentication failed.
    print(message);
    print(message);
    showBottomSheet.bottomSheetCheckIn(context,message);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        // appBar: AppBar(title: Text('الكاميرا')),
        backgroundColor: colorsApp.colorwhiteapp,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: AnimatedSwitcher(
                    duration: Duration(seconds: 1), // مدة الأنيميشن
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation, // تأثير الانتقال (تلاشي)
                        child: child,
                      );
                    },
                    child: val.showFirstImage
                        ? Image.asset(
                            "assets/images/face.png",
                            key: ValueKey(1), // مفتاح فريد للصورة الأولى
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/images/accept.png",
                            key: ValueKey(2), // مفتاح فريد للصورة الثانية
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  width: 110, // زيادة الحجم
                  height: 110, // زيادة الحجم
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: val.progress),
                    // الحركة من 0 إلى 100%
                    duration: Duration(seconds: 3),
                    // مدة الأنيميشن
                    builder: (context, value, child) {
                      return CircularProgressIndicator(
                        strokeWidth: 6, // سماكة الخط
                        value: value, // النسبة المتغيرة
                        color: colorsApp.colorfontgreen, // لون المؤشر
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  style:
                      TextStyle(fontSize: 13, color: colorsApp.colorwhiteapp),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: _authenticate,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: colorsApp.colorblackapp, width: 3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: colorsApp.colorblackapp,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
