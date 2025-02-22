import 'package:flutter/material.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:provider/provider.dart';

class InputApp extends StatelessWidget {
  InputApp({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hint,
            hintStyle: TextStyle(color: colorsApp.colorgreyapp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}

class InputApp2 extends StatelessWidget {
  InputApp2({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hint,
            hintStyle: TextStyle(color: colorsApp.colorgreyapp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}

class InputAppDescription extends StatelessWidget {
  InputAppDescription({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          maxLines: 3,
          maxLength: 2000,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: colorsApp.colorgreyapp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}

class InputAppPass extends StatelessWidget {
  InputAppPass({
    super.key,
    required this.hint,
    required this.show,
    required this.controler,
    required this.iconp,
    required this.icons,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget iconp;
  final Widget icons;
  final bool show;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          obscureText: show,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            prefixIcon: iconp,
            suffixIcon: icons,
            hintText: hint,
            hintStyle: TextStyle(color: colorsApp.colorgreyapp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}

class InputCode extends StatelessWidget {
  InputCode({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 12,color: colorsApp.colorblackapp),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      );
    });
  }
}
class InputMessage extends StatelessWidget {
  InputMessage({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            fillColor: colorsApp.colorwhiteapp, // لون الخلفية
            filled: true,
            suffixIcon: icon,
            hintText: hint,
            hintStyle: TextStyle(
              color: colorsApp.colorblackapp,
              fontSize: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.1,
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.5,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}

class InputSearch extends StatelessWidget {
  InputSearch({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            fillColor: colorsApp.colorwhiteapp, // لون الخلفية
            filled: true,
            prefixIcon: icon,
            hintText: hint,
            hintStyle: TextStyle(
              color: colorsApp.colorgreyapp,
              fontSize: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorsApp.colorbordernotactive),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.1,
                  color:
                      colorsApp.colorbordernotactive), // لون الحافة عند التفعيل
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 0.5,
                  color: colorsApp.colorborderactive), // لون الحافة عند التركيز
            ),
          ),
        ),
      );
    });
  }
}
