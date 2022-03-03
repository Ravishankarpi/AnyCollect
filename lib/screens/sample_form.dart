import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/dropdown.dart';
import 'package:flutter_dev/controls/elevated_button.dart';
import 'package:flutter_dev/controls/image_picker.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/textfield.dart';
import 'package:flutter_dev/controls/verticalSplit.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class WidgetsForms extends StatefulWidget {
  const WidgetsForms ({ Key key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<WidgetsForms> {

  DropdownonChangeModel dropdownononChangeJS;
  int i;
  ImageSource imageSource;
   List<DropdownMenuItem> dropdownMenuItem;
    
onChangeDropItem (fieldId, value ){
     i = dropdownononChangeJS.dropDownOnChange.indexWhere((element)=> element.fieldId == fieldId);
    setState(() {
      dropdownononChangeJS.dropDownOnChange[i].value = value;
    });
    }

    onChangeElevation (){
    setState(() {});
    }

onChangeUploadButton (XFile imagePicker){
  if(imagePicker != null){
        final bytes = File(imagePicker.path).readAsBytesSync().lengthInBytes;
       imagePicker.name;
    setState(() {
    });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        dropdownononChangeJS = DropdownonChangeModel.fromJson(JsonStringToObjectConverter(dropdownFieldJson));
  }
    JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  queryData.size.width;
  queryData.size.height;
   return Scaffold( 
     body: SingleChildScrollView(
       child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                Container(
                  width: queryData.size.width - 30,
                  height: 40,
                  decoration: rBoxDecorationStyles,
                  child: buildText(queryData, FontWeight.bold, Colors.lightBlue, 16,"Form Name", alignmentType: "sections"),
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                ),
                SizedBox(height: 5,),
                Container(
              decoration: rBoxDecorationStyles,
              width: queryData.size.width - 30,
              // width: MediaQuery.of(context).size.width * 0.7,
              child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 20,),
                      buildText(queryData, FontWeight.bold, Colors.lightBlue, 12,"Sopt -20", alignmentType: "sections"),
                      SizedBox(height: 20,),
                      buildText(queryData, FontWeight.normal,Colors.lightBlue,  12,"UnAuthorized", alignmentType: "groups"),
                      SizedBox(height: 5,),
                      buildTextField(Icons.person, queryData,Colors.lightBlue, false),
                      SizedBox(height: 20,),
                      buildTextField(Icons.class_, queryData,Colors.lightBlue, false, name: "Class"),
                      SizedBox(height: 20,),
                      buildTextField(Icons.donut_large_rounded, queryData,Colors.lightBlue, false, name: "Major"),
                      SizedBox(height: 20,),
                      buildTextField(Icons.email, queryData,Colors.lightBlue, false, name: "Email"),
                      SizedBox(height: 20,),
                      buildVerticalSplit(queryData,buildDropDown(Icons.email, "Email", queryData, onChangeDropItem,dropdownMenuItem, dropdownononChangeJS,true, 0), buildDropDown(Icons.email, "Email", queryData, onChangeDropItem,dropdownMenuItem, dropdownononChangeJS,true, 1)),
                      SizedBox(height: 20,),
                      buildVerticalSplit(queryData, buildTextField(Icons.person, queryData,Colors.lightBlue, true,  name: "First Name"), buildTextField(Icons.person, queryData,Colors.lightBlue, true, name: "LastName"),),

                      buildIconButton(Icons.drive_folder_upload_outlined, "Upload Images", queryData, onChangeUploadButton, "File Name",  ImageSource.gallery),
                      buildElevatedButton("Submit", onChangeElevation)
                    ]),
            ),
              ],
            )
          ),
     ),
   );
  }
}


  // SizedBox buildTextField(icon, name, queryData) {
    
  //   return SizedBox(
  //     width: queryData.size.width - 100,
  //     child: TextField(
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(icon),
  //         // labelText: name,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(0),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  
  // SizedBox buildDropDown(icon, name, queryData,Function onChangeDropItem, DropdownonChangeModel dropdownononChangeJS, index ) {
  //   int _value = 0;
  //   return SizedBox(
  //     width: queryData.size.width - 100,
  //               child: DropdownButton(
  //                 menuMaxHeight : 150,
  //                 elevation:8,
  //             value: dropdownononChangeJS?.dropDownOnChange[index]?.value,
  //             items: buildDropDownItem() != null ? buildDropDownItem() : [],
  //             onChanged: (value) {
  //               onChangeDropItem(index, value);
  //             }),

  //     // child: TextField(
  //     //   decoration: InputDecoration(
  //     //     prefixIcon: Icon(icon),
  //     //     labelText: name,
  //     //     border: OutlineInputBorder(
  //     //       borderRadius: BorderRadius.circular(0),
  //     //     ),
  //     //   ),
  //     // ),
  //   );
  // }
  
  // List<DropdownMenuItem> buildDropDownItem(){
  //   List<DropdownMenuItem> dropdownMenuItem = [];
  //   List<String> _list = ["None","Ravi","Divya","Jai"];
  //   _list.asMap().forEach((key, value) {
  //     dropdownMenuItem.add(new DropdownMenuItem(child: Text(value),value: key,));
  //   });
  //   return dropdownMenuItem;
  // }



  