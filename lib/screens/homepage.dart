import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/controls/bottom_navigator.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/nav_drawer.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/screens/chooseforms.dart';
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/screens/formdetails.dart';
import 'package:flutter_dev/screens/login_screen.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {


  List<AnyCollectForms> tempFormArr = [
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
    AnyCollectForms(label: "AnyCollect", formId: "AnyCollect"),
    AnyCollectForms(label: "AnyCollectForm 3", formId: "AnyCollectForm3"),
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
  ];

  AnyCollectForms anyCollectForms;
  int Index = 1;
  @override
  void initState() {
    super.initState();
  }

  changeScreen(int index,AnyCollectForms anyCollectForms) {
    switch (index) {
      case 0:
        {
          return FormDetials();
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => FormDetials()));
          break;
        }
      case 1:
        {
          return ChooseForms();
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => ChooseForms()));

          break;
        }
      case 2:
        {
          return LoginScreen();
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    // int _string = 1;

    return Scaffold(
      // drawer: buildDrawer(true),
      backgroundColor: Color.fromRGBO(242, 242, 243, 5),
      // backgroundColor: const Color(0xFF2c3c84),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF2c3c84),
      //   title: Text(
      //     Index == 0 ? "6's Score Card" : "Forms",
      //     style: GoogleFonts.openSans(
      //       textStyle: TextStyle(
      //         color: Colors.white,
      //         fontSize: 25,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      
      body: changeScreen(Index, anyCollectForms),
      bottomNavigationBar: BottomNavigator(
          callback: (val) => {
            setState(() => Index = val)}),
    );
  }
}
