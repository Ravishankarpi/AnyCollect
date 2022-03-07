
 import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/dropdown.dart';
import 'package:flutter_dev/controls/image_picker.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/textfield.dart';
import 'package:flutter_dev/controls/verticalSplit.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class DynamiceForm extends StatefulWidget {
   const DynamiceForm ({ Key key }) : super(key: key);
 
   @override
   State<DynamiceForm> createState() => _State();
 }
 
 class _State extends State<DynamiceForm> {

   AnyCollect anyCollectJsonString = AnyCollect();
   DropdownonChangeModel dropdownononChangeJS;
   List<DropdownMenuItem> dropdownMenuItem;
   List<Widget> returnWidgets = [];
   List<Widget> returnSection = [];
   List<dynamic> verticalSplitSection= [];
   int i;
   List<Container> testt;
   List<DropDownOptions> dropDownFieldsOptions = [];
  final BaseService _bs = BaseService();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anyCollectJsonString =
        AnyCollect.fromJson(JsonStringToObjectConverter(formJsonString));
        print(anyCollectJsonString);
        dropdownononChangeJS = DropdownonChangeModel.fromJson(JsonStringToObjectConverter(dropdownFieldJson));
  }
   @override
   Widget build(BuildContext context) {
      MediaQueryData queryData;
      queryData = MediaQuery.of(context);
      queryData.size.width;
      queryData.size.height;
      getRandomWidgetArray(anyCollectJsonString, context);
      

        return Scaffold( 
     body: Container(
       color: Color.fromARGB(248, 239, 250, 255),
       child: SingleChildScrollView(
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
                // decoration: rBoxDecorationStyles,
                width: queryData.size.width - 30,
                // width: MediaQuery.of(context).size.width * 0.7,
                child:  
                Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: returnSection ?? [],
                        // buildIconButton(Icons.drive_folder_upload_outlined, "Upload Images", queryData, onChangeUploadButton, "File Name",  ImageSource.gallery),
                        // buildElevatedButton("Submit", onChangeElevation)
                      ), 
              ),
                ],
              )
            ),
       ),
     ),
   );
   }


    JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

  onChangeDropItem (IndexOfJsonId indexOfJsonId, value ){
    //  i = dropdownononChangeJS.dropDownOnChange.indexWhere((element)=> element.fieldId == fieldId);
       var index = dropDownFieldsOptions.indexWhere((element) => element.indexOfJsonId.fieldIds == indexOfJsonId.fieldIds && element.indexOfJsonId.groupsIds == indexOfJsonId.groupsIds && element.indexOfJsonId.sectionIds == indexOfJsonId.sectionIds && element.indexOfJsonId.optionIds == indexOfJsonId.optionIds);

    setState(() {
        dropDownFieldsOptions[index].value = value;
    });
    }

    onChangeUploadButton (XFile imagePicker){
  if(imagePicker != null){
        final bytes = File(imagePicker.path).readAsBytesSync().lengthInBytes;
       imagePicker.name;
    setState(() {
    });
    }
  }


  
 getRandomWidgetArray(AnyCollect anyCollectJsonString, BuildContext context) {
   MediaQueryData queryData;
      queryData = MediaQuery.of(context);
      queryData.size.width;
      queryData.size.height;
    // ignore: prefer_typing_uninitialized_variables
    List<dynamic> returnAllCategoryWidgets = [];
    List<String> dropDownVaues = [];
    String formLabel;
    String formId;
    String sectionName;
    String secrionId;
    String sortOrder;
    Sections masterSections;
    List<GroupFields> groupFields;
    List<Fields> sectionFields;
    List<Groups> sectionGroups;
          returnSection = [];
    returnWidgets = [];

    

  //Number of forms
  anyCollectJsonString.anyCollectForms.asMap().forEach((key, formRes) { 
    formId = formRes.formId;
    formLabel = formRes.label;
    // number of sections
    formRes.formData.sections.asMap().forEach((key, sectionsRes) {
      //section Name and Id
      masterSections =  sectionsRes;
      //section fields
      sectionFields =  masterSections.fields;
      // numnber of groups and groups name
      sectionGroups =  masterSections.groups;
        returnSection.add(SizedBox(height: 20,)); 
        returnSection.add( Container(
          decoration: rBoxDecorationStyles,
          width: queryData.size.width - 30,
          child: Column(
            children: <Widget> [
                      SizedBox(height: 15,),
                      getSectionData(masterSections, queryData),
                      getGroupFields(masterSections, sectionGroups, queryData),
            
            ],
          ),
        ));
        
    });
    // return returnSection;
  });
    // returnAllCategoryWidgets.add({"categoryId" : "index", "categoryWidgets" : returnWidgets});
    // return returnAllCategoryWidgets;
  }
  
  
  Container getGroupFields(Sections masterSections, List<Groups> sectionGroups, MediaQueryData queryData){
    JsonId jsonId;
    returnWidgets = [];
    sectionGroups.asMap().forEach((key,Groups groupRes) { 
        returnWidgets.add(SizedBox(height: 20,));
        returnWidgets.add( buildText(queryData, FontWeight.normal,Colors.lightBlue,  12,groupRes.groupName.toUpperCase(), alignmentType: "groups"),);
    groupRes.groupFields.asMap().forEach((key, groupsFieldRes) {
       if(
         key == 0 
    ){
          jsonId = new JsonId(sectionId: masterSections.sectionId, groupId: groupRes.groupId,fieldId: groupsFieldRes.id, value: groupsFieldRes.options[0].id );
       verticalSplitSection.add(buildDropDown(dropDownFieldsOptions, Icons.email, "Email", queryData, onChangeDropItem,dropdownMenuItem, dropdownononChangeJS, anyCollectJsonString,true, 0, jsonId));
    }
    else if(
      key == 1
    )
    {
      if(groupsFieldRes.type == "calculated"){
        groupsFieldRes.actionDetails.actionType;
        groupsFieldRes.actionDetails.copyFromFieldId;
        IndexOfJsonId indexOfJsonId = _bs.findIndex(anyCollectJsonString, jsonId);
        var score;
        ActionDetails actionDetails;
        var index = dropDownFieldsOptions.indexWhere((element) => element.indexOfJsonId.fieldIds == indexOfJsonId.fieldIds && element.indexOfJsonId.groupsIds == indexOfJsonId.groupsIds && element.indexOfJsonId.sectionIds == indexOfJsonId.sectionIds && element.indexOfJsonId.optionIds == indexOfJsonId.optionIds);
        var dropDownValue = dropDownFieldsOptions[index].value;

        score = anyCollectJsonString.anyCollectForms[0].formData.sections[indexOfJsonId.sectionIds].groups[indexOfJsonId.groupsIds].groupFields[indexOfJsonId.fieldIds].options.indexWhere((element) => element.id == dropDownValue +1);
        score =  anyCollectJsonString.anyCollectForms[0].formData.sections[indexOfJsonId.sectionIds].groups[indexOfJsonId.groupsIds].groupFields[indexOfJsonId.fieldIds].options[score].value;
        
        verticalSplitSection.add(buildTextField(Icons.rotate_90_degrees_ccw, queryData,Colors.lightBlue, true, name:score.toString(), isReadOnly: true));
      }
      //verticalSplitSection.add(buildTextField(Icons.score, queryData,Colors.lightBlue, true, name:groupsFieldRes.label));
    } 
    if(verticalSplitSection.length == 2){
    returnWidgets.add(SizedBox(height: 20,));
    returnWidgets.add(buildVerticalSplit(queryData,verticalSplitSection[0],verticalSplitSection[1]));             
    verticalSplitSection = [];
    }
    else if(verticalSplitSection.length == 0){
      returnWidgets.add(SizedBox(height: 20,));
      if(groupsFieldRes.type == "textArea")
    returnWidgets.add(buildTextField(Icons.comment, queryData,Colors.lightBlue, false, name:groupsFieldRes.label));
       if(groupsFieldRes.id == "attachmentId"){
         //temp
         groupsFieldRes.type = "attachment";
    returnWidgets.add(buildIconButton(Icons.drive_folder_upload_outlined, "Upload Files", queryData, onChangeUploadButton, groupsFieldRes.label,  ImageSource.gallery),
);

       }

      

    }
    });
    });  
    return Container(
      child: Column(
        children: returnWidgets,
      ),
    );
  }

  // List<Widget> getWidgets(){
  //   List<Widget> renderWidget = [];
  //   var test =  getRandomWidgetArray(anyCollectJsonString);
  //   if(test != null)
  //   renderWidget.add(SingleChildScrollView(
  //     child: Container(
  //         decoration: rBoxDecorationStyle,
  //       child: Column(
  //          children:  test[0]["categoryWidgets"], 
  //     )),
  //   ));
  //   renderWidget.add(SizedBox(height: 10.0),);
  //   renderWidget.add(SingleChildScrollView(
  //     child: Container(
  //         decoration: rBoxDecorationStyle,
  //       child: Column(
  //          children:  test[0]["categoryWidgets"], 
  //     )),
  //   ));
  //   renderWidget.add(SizedBox(height: 10.0),);
  //   renderWidget.add(SingleChildScrollView(
  //     child: Container(
  //         decoration: rBoxDecorationStyle,
  //       child: Column(
  //          children:  test[0]["categoryWidgets"], 
  //     )),
  //   ));
  //   return renderWidget;
  //   }

  SizedBox getSectionData(masterSections, MediaQueryData queryData){
     return buildText(queryData, FontWeight.bold, Colors.lightBlue, 12,masterSections.sectionName.toString().toUpperCase(), alignmentType: "sections");
  }
 
 }

 
 
 



