import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  //all TextEditingController use in new file to apis
  String ip = "https://teamhup.net"; //to domain server

  TextEditingController emailSignin = TextEditingController();
  TextEditingController passSignin = TextEditingController();

  var loginUser;
  Future LoginUser() async {
    loginUser = null;
    String uri = "$ip/api/auth/login";
    try {
      var respons = await http.post(
        Uri.parse(uri),
        body: jsonEncode({
          "email": "${emailSignin.text}",
          "password": "${passSignin.text}",
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      var responsbody = jsonDecode(respons.body);
      print(responsbody);
      if (responsbody.isNotEmpty) {
        loginUser = responsbody;
      }
    } catch (e) {
      print(e);
      loginUser = {"status": false, 'message': "error server or internet"};
      print(loginUser);
    }
    return loginUser;
  }

  TextEditingController emailforgetpass = TextEditingController();
  var forget;
  Future Forget() async {
    forget = null;
    String uri = "$ip/api/forget-password/request-pin";
    try {
      var respons = await http.post(
        Uri.parse(uri),
        body: jsonEncode(
            {"email": "${emailforgetpass.text}", "userType": "Employee"}),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      var responsbody = jsonDecode(respons.body);
      print(responsbody);
      if (responsbody.isNotEmpty) {
        forget = responsbody;
      }
    } catch (e) {
      print(e);
      forget = {"status": false, 'message': "error server or internet"};
      print(forget);
    }
    return forget;
  }

  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();
  var verfyforget;
  Future VerfyForget() async {
    verfyforget = null;
    String uri = "$ip/api/forget-password/verify-pin";
    try {
      var respons = await http.post(
        Uri.parse(uri),
        body: jsonEncode({
          "email": "${emailforgetpass.text}",
          "userType": "Employee",
          "pin":
              "${code1.text}${code2.text}${code3.text}${code4.text}${code5.text}${code6.text}"
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      var responsbody = jsonDecode(respons.body);
      print(responsbody);
      if (responsbody.isNotEmpty) {
        verfyforget = responsbody;
      }
    } catch (e) {
      print(e);
      verfyforget = {"status": false, 'message': "error server or internet"};
      print(forget);
    }
    return verfyforget;
  }

  TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();
  var resetpass;
  Future ResetPass() async {
    resetpass = null;
    print("new pass ${newpass.text}");
    print("new pass ${newpass.text}");
    print("new pass ${newpass.text}");
    String uri = "$ip/api/forget-password/reset-password";
    try {
      var respons = await http.post(
        Uri.parse(uri),
        body: jsonEncode({
          "email": "${emailforgetpass.text}",
          "userType": "Employee",
          "pin":
              "${code1.text}${code2.text}${code3.text}${code4.text}${code5.text}${code6.text}",
          "newPassword": "Pe123@#123", //${newpass.text}
        }),

        // headers: {
        //   "Content-Type": "application/json",
        //   "Accept": "application/json",
        // },
      );
      var responsbody = jsonDecode(respons.body);
      print(responsbody);
      if (responsbody.isNotEmpty) {
        resetpass = responsbody;
      }
    } catch (e) {
      print(e);
      resetpass = {"status": false, 'message': "error server or internet"};
      print(forget);
    }
    return resetpass;
  }

  TextEditingController amountpayslip = new TextEditingController();
  TextEditingController descriptionpayslip = new TextEditingController();
  var addPaySlip;
  Future AddPaySlip(File imageFilePaySlip, int idCatogery) async {
    addPaySlip = null;
    final dio = Dio();
    FormData formData = FormData.fromMap({
      'amount': amountpayslip.text,
      'description': descriptionpayslip.text,
      'dueDate': "date",
      'attachment': await MultipartFile.fromFile(
        imageFilePaySlip.path,
        filename: imageFilePaySlip.path.split('/').last,
      ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/request/payslip', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        addPaySlip = jsonDecode(response.toString());
        print('تم إضافة السائق بنجاح: ${response.data}');
      } else {
        print('فشل في إضافة السائق: ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return addPaySlip;
  }
  TextEditingController advancemony = TextEditingController();

  TextEditingController message = TextEditingController();

  String statusInMedia = '';
}





































// var loginUser;
//   Future LoginUser(String tokendevice) async {
//     loginUser = null;
//     String uri = "$ip/api/user/login";
//     try {
//       var respons = await http.post(Uri.parse(uri), body: {
//         "phone_number": "+966${phoneSignin.text}",
//         "password": "+966${passSignin.text}",
//         "fcm_token": tokendevice,
//       }, headers: {
//         "Accept": "application/json"
//       });
//       var responsbody = jsonDecode(respons.body);
//       if (responsbody.isNotEmpty) {
//         loginUser = responsbody;
//       }
//       print("login user : ${responsbody}");
//     } catch (e) {
//       print(e);
//     }
//     return loginUser;
//   }



//  var homeUser = null;
//   Future HomeUser(int id, String token, String lang) async {
//     homeUser = null;
//     String url = "$ip/api/user/products/$id";
//     try {
//       var response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'Accept': 'application/json',
//           'Authorization': '$token',
//           'Accept-Language': '$lang'
//         },
//       );
//       if (!response.body.isEmpty) {
//         var responsebody = jsonDecode(response.body);
//         homeUser = responsebody;
//         print(responsebody.length);
//         print(responsebody.length);
//         print(responsebody);
//         print(responsebody);
//       }
//     } catch (e) {
//       print(e);
//     }

//     return homeUser;
//   }


// var addDriver;
//   AddDriver(File imageFile) async {
//     var addDriver; // تعريف المتغير لتخزين نتيجة العملية
//     final dio = Dio();

//     // تجهيز بيانات النموذج
//     FormData formData = FormData.fromMap({
//       'name': nameDriver.text,
//       'phone_number': "+966${phoneDriver.text}",
//       'address': addressDriver.text,
//       'license_number': licenseNumberDriver.text,
//       'vehicle_number': vehicleNumberDriver.text,
//       'vehicle_license': vehicleLicenseNumberDriver.text,
//       'image': await MultipartFile.fromFile(
//         imageFile.path,
//         filename: imageFile.path.split('/').last,

//       ),
//     });

//     try {
//       // إرسال الطلب إلى الخادم
//       Response response = await dio.post(
//         '$ip/api/add-driver', // تأكد من تحديث الرابط بما يناسب واجهتك الخلفية
//         data: formData,
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'User-Agent':
//                 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
//           },
//         ),
//       );

//       // التحقق من حالة الرد
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         addDriver = jsonDecode(response.toString());
//         print('تم إضافة السائق بنجاح: ${response.data}');
//       } else {
//         print('فشل في إضافة السائق: ${response.statusCode}');
//         print('الرد من الخادم: ${response.data}');
//       }
//     } on DioError catch (dioError) {
//       if (dioError.response != null) {
//         // خطأ مع استجابة من الخادم
//         print('خطأ من الخادم: ${dioError.response?.statusCode}');
//         print('تفاصيل الخطأ: ${dioError.response?.data}');
//       } else {
//         // خطأ في الاتصال بالخادم
//         print('فشل الاتصال بالخادم: ${dioError.message}');
//       }
//     } catch (e) {
//       // لأي خطأ غير متوقع
//       print('حدث خطأ غير متوقع: $e');
//     }

//     return addDriver;
//   }
