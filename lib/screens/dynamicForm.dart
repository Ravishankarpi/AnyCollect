
 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/utils/constants.dart';

class DynamiceForm extends StatefulWidget {
   const DynamiceForm ({ Key key }) : super(key: key);
 
   @override
   State<DynamiceForm> createState() => _State();
 }
 
 class _State extends State<DynamiceForm> {

   AnyCollect anyCollectJsonString = AnyCollect();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anyCollectJsonString =
        AnyCollect.fromJson(JsonStringToObjectConverter(formJsonString));
        print(anyCollectJsonString);
  }
   @override
   Widget build(BuildContext context) {
     return Container(
       child: Text(anyCollectJsonString.toString()),
     );
   }


    JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

 }
 
 
 
//  List<dynamic> getRandomWidgetArray(AnyCollect jsonObject) {
//     // ignore: prefer_typing_uninitialized_variables
//     List<dynamic> returnAllCategoryWidgets = [];
//     List<Widget> returnWidgets = [];
//     List<String> dropDownVaues = [];

//     jsonString.category.asMap().forEach((index,element) {
//       categoryData = element;
//       returnWidgets = [];
//       returnWidgets.add(_buildTitleTF(element.name));
//       element.categoryData.categoryValues.forEach((catDataRes) {
//         subCategoryData = catDataRes.subCategoryData;
//         // _buildTitleTF( catDataRes.name);
//         subCategoryData.subCategoryValues.forEach((subCatRes) {
//           if (subCatRes.type.toLowerCase() == "dropdown") {
//             dropDownVaues = [];
//             dropDownTypeValues = subCatRes.droptypeValues;
//             subCatRes.droptypeValues.forEach((droptypeValRes) {
//               dropDownVaues.add(droptypeValRes.name);
//             });
//             returnWidgets.add(_buildCityRF(catDataRes.name));
//           } else {
//             textTypeValues = subCatRes.textTypeValues;
//             returnWidgets.add(_buildTextTF(
//                 catDataRes.name,
//                 textTypeValues.textType,
//                 textTypeValues.mode,
//                 textTypeValues.placeHolder,
//                 "number"));
//           }
//         });
//       });
//     returnAllCategoryWidgets.add({"categoryId" : index, "categoryWidgets" : returnWidgets});
//     });
//     return returnAllCategoryWidgets;
//   }
  
//   List<Widget> getWidgets(){
//     List<Widget> renderWidget = [];
//     var test =  getRandomWidgetArray(jsonString);
//     if(test != null)
//     renderWidget.add(SingleChildScrollView(
//       child: Container(
//           decoration: rBoxDecorationStyle,
//         child: Column(
//            children:  test[0]["categoryWidgets"], 
//       )),
//     ));
//     renderWidget.add(SizedBox(height: 10.0),);
//     renderWidget.add(SingleChildScrollView(
//       child: Container(
//           decoration: rBoxDecorationStyle,
//         child: Column(
//            children:  test[0]["categoryWidgets"], 
//       )),
//     ));
//     renderWidget.add(SizedBox(height: 10.0),);
//     renderWidget.add(SingleChildScrollView(
//       child: Container(
//           decoration: rBoxDecorationStyle,
//         child: Column(
//            children:  test[0]["categoryWidgets"], 
//       )),
//     ));
//     return renderWidget;
//     }




