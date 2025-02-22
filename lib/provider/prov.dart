import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/api.dart';

class Control extends ChangeNotifier {
  //all variablse and function her use in new statemangment 
  Api api = new Api();
  double sliderValue = 30.0;
  int screenBoard = 1;
  switchboard() {
    screenBoard += 1;
    sliderValue += 30.0;
    notifyListeners();
  }

  late Box languagebox = Hive.box("language");
  choseLanguage(String lan) {
    languagebox.put("language", "$lan");
    notifyListeners();
  }

  List homeButton1 = [
    {"title": "Payroll", "image": "assets/images/home1.png"},
    {"title": "Payslip", "image": "assets/images/home2.png"},
    {"title": "Counseling", "image": "assets/images/home3.png"},
    {"title": "Time Off", "image": "assets/images/home4.png"},
    {"title": "Calendar", "image": "assets/images/home5.png"},
    {"title": "Holiday", "image": "assets/images/home9.png"},
    {"title": "Resign", "image": "assets/images/home7.png"},
  ];
  List homeButton2 = [
    {"title": "Payroll", "image": "assets/images/home1.png"},
    {"title": "Payslip", "image": "assets/images/home2.png"},
    {"title": "Counseling", "image": "assets/images/home3.png"},
    {"title": "Time Off", "image": "assets/images/home4.png"},
    {"title": "Calendar", "image": "assets/images/home5.png"},
    {"title": "Advance", "image": "assets/images/home6.png"},
    {"title": "Resign", "image": "assets/images/home7.png"},
    // {"title": "Other", "image": "assets/images/home8.png"},
    {"title": "Holiday", "image": "assets/images/home9.png"},
    {"title": "Departures", "image": "assets/images/home10.png"},
    {"title": "Combined hday", "image": "assets/images/home11.png"},
    {"title": "Planning", "image": "assets/images/home12.png"},
  ];
  //bottom nav bar
  int activeIndex = 0;
  List<IconData> get iconList => [
        activeIndex == 0 ? Icons.home : Icons.home_outlined,
        activeIndex == 1 ? Icons.pie_chart : Icons.pie_chart_outline,
        activeIndex == 2 ? Icons.access_time : Icons.access_time_outlined,
        activeIndex == 3 ? Icons.person : Icons.person_outline,
      ];

  changeScreenByNavBar(int valu) {
    activeIndex = valu;
    notifyListeners();
  }

  List timeOff = ["Sick", "Vacation", "Maternity", "Personal Matters"];
  int category = 0;
  selectaCategory(int index) {
    category = index;
    notifyListeners();
  }

  String date = '';
  changedatepationt() {
    date = date;
    notifyListeners();
  }

  bool showvote = false;
  showVote(bool value) {
    showvote = value;
    notifyListeners();
  }

  String selectedValue = "Select";
  List<dynamic> dropdownItems = [
    'Select holiday tybe1',
    'Select holiday tybe2',
    'Select holiday tybe3',
    'Select holiday tybe4',
    'Select holiday tybe5',
    'Select holiday tybe6'
  ];

  String holiday = "unpaid";
  changeHoliday(int value) {
    if (value == 0) {
      holiday = 'paid';
    } else {
      holiday = 'unpaid';
    }
    notifyListeners();
  } 
  

  bool showFirstImage = true;
  double progress = 0.0;
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();
  animatFaceId(BuildContext context) async {
    progress = 1.0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    showFirstImage = !showFirstImage;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    showBottomSheet.bottomSheetCheckIn(context,"Authentication successful!");
    notifyListeners();
    progress = 0.0;
    showFirstImage = !showFirstImage;
  }
  ///apis 
  var data;

  late Box tokenbox = Hive.box("token");
  late Box idbox = Hive.box("id");
  late Box emailbox = Hive.box("email");
  late Box mobilebox = Hive.box("mobile");
  late Box jobCategoryIdbox = Hive.box("jobCategoryid");
  late Box managerIdbox = Hive.box("managerId");
  late Box firstNamebox = Hive.box("firstName");
  late Box lastNamebox = Hive.box("lastName");
  late Box rolebox = Hive.box("role");
  

  var login ;
  Login()async{
    login=null;
    data=null;
    login = await api.LoginUser();
    print(login);
    print(login);
    print(login);
    data=login;
    if(login!=null)
    {
      if(login['status']== true){
        tokenbox.put("toke", "${login['data']['token']}");
        idbox.put("id", "${login['data']['employee']['_id']}");
        emailbox.put("email", "${login['data']['employee']['email']}");
        mobilebox.put("mobile", "${login['data']['employee']['mobile']}");
        jobCategoryIdbox.put("jobCategoryId", "${login['data']['employee']['jobCategory']}");
        managerIdbox.put("managerId", "${login['data']['employee']['managerId']}");
        firstNamebox.put("firstName", "${login['data']['employee']['firstName']}");
        lastNamebox.put("lastName", "${login['data']['employee']['lastName']}");
        rolebox.put("role", "${login['data']['employee']['role']}");
        print(rolebox.get("role"));
      }
    }
    notifyListeners();
  }
  var forget ;
  Forget()async{
    forget=null;
    data=null;
    forget = await api.Forget();
    print(forget);
    print(forget);
    print(forget);
    data=forget;
    
    notifyListeners();
  }
  var verfyforget ;
  VerfyForget()async{
    verfyforget=null;
    data=null;
    verfyforget = await api.VerfyForget();
    print(verfyforget);
    print(verfyforget);
    print(verfyforget);
    data=verfyforget;
    
    notifyListeners();
  }var resetpass ;
  ResetPass()async{
    resetpass=null;
    data=null;
    resetpass = await api.ResetPass();
    print(resetpass);
    print(resetpass);
    print(resetpass);
    data=resetpass;
    
    notifyListeners();
  }


  File ?imageFilePaySlip ;
  void uploadImageProdect() async {
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFilePaySlip = File(result.files.single.path!);

        print(imageFilePaySlip!.path);
        print("image$imageFilePaySlip");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }
  var addprodect;
  AddPaySlip(BuildContext context) async {
    addprodect = null;
    data = null;
    addprodect = await api.AddPaySlip(imageFilePaySlip!, tokenbox.get("token"));
    
    if (context.mounted) {
      Navigator.of(context).pop();
      
      print(addprodect);
    }
    data = addprodect;
    print("end");
    notifyListeners();
  }
}
