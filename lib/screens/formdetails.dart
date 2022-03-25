import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/bottom_navigator.dart';
import 'package:flutter_dev/model/formJson.dart';
import "package:collection/collection.dart";
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FormDetials extends StatefulWidget {
  final AnyCollectForms anyCollectForms;

  const FormDetials({this.anyCollectForms}) : super();

  @override
  _FormDetialsState createState() => _FormDetialsState();
}

class _FormDetialsState extends State<FormDetials> {
  List<Sections> section = [];
  List<AnyCollectForms> tempFormArr = [
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
    AnyCollectForms(label: "AnyCollect", formId: "AnyCollect"),
    AnyCollectForms(label: "AnyCollectForm 3", formId: "AnyCollectForm3"),
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
  ];
  List<dynamic> fromGroups = [];

  @override
  void initState() {
    super.initState();
    // final fromGroups = generateGroup(tempFormArr);
  }

  generateGroup(tempFormArr) {
    final groups = groupBy(tempFormArr, (AnyCollectForms e) {
      return e.formId;
    });

    return groups;
  }

  List<Widget> buildFormDeatils(MediaQueryData queryData) {
    DateTime now = new DateTime.now();

    DateTime date = new DateTime(now.year, now.month, now.day);
    var currentDate = "${now.day} Mar ${now.year}";
    List<Widget> data = [];
    dynamic groupCollection = [];
    if (tempFormArr.isNotEmpty) {
      groupCollection =
          tempFormArr.where((res) => res.formId == "6sSoreCard").toList();
      groupCollection.asMap().forEach((key, value) {
        data.add(const SizedBox(
          height: 10,
        ));
        data.add(
          GestureDetector(
            onTap: () => {},
            child: SizedBox(
              height: 80,
              // width: queryData.size.width / 1.1,
              child: Align(
                child: Container(
                  //  alignment: Alignment.bottomCenter,
                  height: 80,
                  width: queryData.size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, right: 10, top: 0, bottom: 0),
                          child: Row(
                            children: <Widget>[
                              // Icon(
                              //   Icons.ballot_outlined,
                              // ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 14),
                                height: 35,
                                width: 100,
                                child: Text("Form #${key + 1}",
                                    // "${key+1}",
                                    // "${value.formId}",
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4c4c4c)),
                                    )),
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              Container(
                                height: 25,
                                width: key == 0 ? 80 : 80,
                                alignment: Alignment.centerRight,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: key == 0 ? 80 : 65,
                                  child: Text(
                                    key == 0 ? "Submitted" : "Draft",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  decoration: BoxDecoration(
                                     color: key == 0 ?  Color(0xFF81A489) : Color(0xFFF2c672),
                                    borderRadius: BorderRadius.circular(15),
                                    // border: Border.all(
                                    //     width: 1.0, color: Color(0xFF2c3c84)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        // blurRadius: 6.0,
                                        // spreadRadius : 2.0,
                                        // offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 0, bottom: 0),
                          child: Row(
                            children: <Widget>[
                              // Icon(
                              //   Icons.today_sharp,
                              // ),
                              const SizedBox(
                                width: 15,
                              ),
                              // Container(
                              //   alignment: Alignment.bottomCenter,
                              //   //  height: 25,
                              //   //         width: 80,
                              //   child: Icon(Icons.calendar_month, size: 15,),
                              // ),
                              //  const SizedBox(width: 7,),
                              Container(
                                alignment: Alignment.bottomCenter,
                                // height: 25,
                                //         width: 80,
                                child: Text(currentDate,
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(122, 76, 76, 76)),
                                    )),
                                // decoration: rTileTagDecorationStyles,
                              ),
                              // const SizedBox(width: 25,),
                              // Icon(
                              //   Icons.manage_search
                              // ),
                            ],
                          )),
                    ],
                  ),
                  decoration: rTileBoxDecorationStyles,
                ),
              ),
            ),
          ),
        );
      });

      return data;
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
        drawer: buildDrawer(true),
      backgroundColor: Color.fromRGBO(242, 242, 243, 5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3c84),
        title: Text(
          "6's Score Card",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(10),
          child: Center(
            child: Container(
              child: Column(
                children: this.buildFormDeatils(queryData),
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar:  BottomNavigator(Index: 0),
    
    );
  }
}
