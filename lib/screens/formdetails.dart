import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/FadeRouteBuilder.dart';
import 'package:flutter_dev/controls/bottom_navigator.dart';
import 'package:flutter_dev/model/formJson.dart';
import "package:collection/collection.dart";
import 'package:flutter_dev/model/request_response.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rect_getter/rect_getter.dart';

class FormDetials extends StatefulWidget {
  RequestResponse request;
  int index;

  // ignore: prefer_const_constructors_in_immutables
  FormDetials(this.request, this.index, {Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _FormDetialsState createState() => _FormDetialsState(request);
}

class _FormDetialsState extends State<FormDetials> {
     GlobalKey rectGetterKey = RectGetter.createGlobalKey(); //<--Create a key
  Rect rect; 
    RequestResponse request;
      final BaseService _bs = BaseService();
  List<Sections> section = [];

  RequestResponse tempFormArr = RequestResponse();
  List<dynamic> fromGroups = [];

  _FormDetialsState(RequestResponse request);

  // _FormDetialsState(RequestResponse request);

  @override
  void initState() {
    super.initState();
    getSelectedForms();
    // final fromGroups = generateGroup(tempFormArr);
  }

  generateGroup(tempFormArr) {
    final groups = groupBy(tempFormArr, (AnyCollectForms e) {
      return e.formId;
    });

    return groups;
  }

  getSelectedForms() async{
    //dummy
    // request.userId = 1;
    //below string comes from api call (dummpy call)
    await _bs.getSelectedFormsCollectionByFormAndUserID(widget.request).then((res) => {
        setState(() {
          tempFormArr = res;
        }),
        });

  }
  onPressTile(int index, FormCollection formCollection ) async{
        var test;

     await _bs. getSelectedFormByDataCollectionId(formCollection).then((selectedDataForm) => {
             setState(() => rect = RectGetter.getRectFromKey(rectGetterKey)),
     Navigator.of(context).push(FadeRouteBuilder(page: DynamiceForm(anyCollectForms: selectedDataForm,))),
     });
  }

  List<Widget> buildFormDeatils(MediaQueryData queryData) {
    DateTime now = new DateTime.now();

    DateTime date = new DateTime(now.year, now.month, now.day);
    var currentDate = "${now.day} Mar ${now.year}";
    List<Widget> data = [];
    dynamic groupCollection = [];
    if (tempFormArr != null && tempFormArr.formCollection != null &&  tempFormArr.formCollection.isNotEmpty) {
    //   groupCollection =
    //       tempFormArr.formCollection.where((res) => res.formId == "6sSoreCard").toList();

      tempFormArr.formCollection.asMap().forEach((key, value) {
        data.add(const SizedBox(
          height: 10,
        ));
        data.add(
          GestureDetector(
            onTap: () => {
              onPressTile(key, value),
            },
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
                                width: queryData.orientation.index == 0 ?  queryData.size.width /1.5 : queryData.size.width /1.2 ,
                                child: Text("${value.label + " #"}${key + 1}",
                                overflow: TextOverflow.ellipsis,
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
                                width: 0,
                              ),
                              Container(
                                height: 25,
                                width: 80,
                                alignment: Alignment.centerRight,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: value.status.toLowerCase() == "submitted"  ? 80 : 65,
                                  child: Text(
                                    value.status,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  decoration: BoxDecoration(
                                     color: value.status.toLowerCase() == "submitted" ?  Color(0xFF81A489) : value.status.toLowerCase() == "draft" ?Color(0xFFF2c672) : Color.fromARGB(255, 206, 206, 206) ,
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
                                child: Text(value.modifiedDate,  //date format
                                    style: GoogleFonts.openSans(
                                      textStyle: const TextStyle(
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
        // drawer: buildDrawer(true),
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
