import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/dropdown.dart';
import 'package:flutter_dev/controls/emptySize.dart';
import 'package:flutter_dev/controls/image_picker.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/textarea.dart';
import 'package:flutter_dev/controls/textfield.dart';
import 'package:flutter_dev/controls/verticalSplit.dart';
import 'package:flutter_dev/model/attachment.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DynamiceForm extends StatefulWidget {
  AnyCollectForms anyCollectForms;
  // DynamiceForm(this._anyCollectForms);

  DynamiceForm({Key key, @required this.anyCollectForms}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DynamiceForm> createState() => _DynamicState(anyCollectForms);
}

class _DynamicState extends State<DynamiceForm> {
  AnyCollectForms _anyCollectForms;
  _DynamicState(_anyCollectForms);

  AnyCollect anyCollectJsonString = AnyCollect();
  DropdownonChangeModel dropdownononChangeJS;
  List<DropdownMenuItem> dropdownMenuItem;
  List<Widget> returnWidgets = [];
  List<Widget> returnSection = [];
  List<dynamic> verticalSplitSection = [];
  int i;
  List<Container> testt;
  List<DropDownOptions> dropDownFieldsOptions = [];
  final BaseService _bs = BaseService();

  var txt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    anyCollectJsonString =
        AnyCollect.fromJson(JsonStringToObjectConverter(formJsonString));
    print(this._anyCollectForms);
    print(anyCollectJsonString);
    dropdownononChangeJS = DropdownonChangeModel.fromJson(
        JsonStringToObjectConverter(dropdownFieldJson));
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.size.width;
    queryData.size.height;
    getRandomWidgetArray(anyCollectJsonString, context);

    return Scaffold(
      drawer: buildDrawer(true),
      backgroundColor: const Color.fromRGBO(242, 242, 243, 5),
      // // backgroundColor: const Color(0xFF2c3c84),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3c84),
        title: Text(
          'Form Name',
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(242, 242, 243, 5),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SizedBox(
              //   height: 50,
              // ),
              // Container(
              //   width: queryData.size.width - 30,
              //   height: 40,
              //   decoration: rBoxDecorationStyles,
              //   child: buildText(queryData, FontWeight.bold, Colors.lightBlue,
              //       16, "Form Name",
              //       alignmentType: "sections"),
              //   padding: EdgeInsets.only(left: 20.0, top: 10),
              // ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // decoration: rBoxDecorationStyles,
                width: queryData.size.width - 30,
                // width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: returnSection ?? [],
                  // buildIconButton(Icons.drive_folder_upload_outlined, "Upload Images", queryData, onChangeUploadButton, "File Name",  ImageSource.gallery),
                  // buildElevatedButton("Submit", onChangeElevation)
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

  onChangeDropItem(IndexOfJsonId indexOfJsonId, value) {
    // GroupFields groupFields =
    //     _bs.getObject(anyCollectJsonString, indexOfJsonId);
    setState(() {
      anyCollectJsonString
          .anyCollectForms[0]
          .formData
          .sections[indexOfJsonId.sectionIds]
          .groups[indexOfJsonId.groupsIds]
          .groupFields[indexOfJsonId.fieldIds]
          .defaultValue = value;
    });
  }

  onChangeUploadButton(IndexOfJsonId indexOfJsonId, List<XFile> imagePicker) {
    int attachmentsLength = 0;
    int lastfileId = 0;
    AttachmentFile existingAttachments;
    String tempAttachments = anyCollectJsonString
        .anyCollectForms[0]
        .formData
        .sections[indexOfJsonId.sectionIds]
        .groups[indexOfJsonId.groupsIds]
        .groupFields[indexOfJsonId.fieldIds]
        .value;
    if (imagePicker != null &&
        imagePicker.isNotEmpty &&
        tempAttachments != null &&
        tempAttachments != "") {
      Attachments attachments;
      //get Existing Attachments
      existingAttachments =
          AttachmentFile.fromJson(jsonDecode(tempAttachments));
      attachmentsLength = existingAttachments.attachments.length;
      lastfileId =
          existingAttachments.attachments[attachmentsLength - 1].fileId;
      imagePicker.forEach((res) {
        lastfileId = lastfileId + 1;
        final bytes = File(res.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        attachments = Attachments(
            fileId: lastfileId, fileName: res.name, base64String: img64);
        existingAttachments.attachments.add(attachments);
      });
    } else if (imagePicker != null && imagePicker.isNotEmpty) {
      List<Attachments> attachments = [];

      imagePicker.forEach((res) {
        lastfileId = lastfileId + 1;
        final bytes = File(res.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        attachments.add(new Attachments(
            fileId: lastfileId, fileName: res.name, base64String: img64));
      });
      existingAttachments = new AttachmentFile(attachments: attachments);
    }
    existingAttachments != null
        ? setState(() {
            anyCollectJsonString
                .anyCollectForms[0]
                .formData
                .sections[indexOfJsonId.sectionIds]
                .groups[indexOfJsonId.groupsIds]
                .groupFields[indexOfJsonId.fieldIds]
                .value = jsonEncode(existingAttachments);
          })
        : "";
  }

  // update textFields
  _onUpdate(IndexOfJsonId indexOfJsonId, String value) {
    setState(() {
      anyCollectJsonString
          .anyCollectForms[0]
          .formData
          .sections[indexOfJsonId.sectionIds]
          .groups[indexOfJsonId.groupsIds]
          .groupFields[indexOfJsonId.fieldIds]
          .value = value;
    });
    // return   anyCollectJsonString
    //       .anyCollectForms[0]
    //       .formData
    //       .sections[indexOfJsonId.sectionIds]
    //       .groups[indexOfJsonId.groupsIds]
    //       .groupFields[indexOfJsonId.fieldIds]
    //       .value = value;
  }

  initialValue(String editedText) {
    return TextEditingController(text: editedText);
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
    String columnID = "";
    returnSection = [];
    returnWidgets = [];

    //Number of forms
    anyCollectJsonString.anyCollectForms.asMap().forEach((key, formRes) {
      formId = formRes.formId;
      formLabel = formRes.label;
      dynamic  acitionColumn = [];
      num finalScore = 0;
      var copyFromID ;
      // number of sections
      formRes.formData.sections.asMap().forEach((key, sectionsRes) {
        //section Name and Id
        masterSections = sectionsRes;
        //section fields
        sectionFields = masterSections.fields;
        //Doubt
     
        // numnber of groups and groups name
        sectionGroups = masterSections.groups;
        //Doubt
        
           if(sectionFields[0].actionDetails.calculationType.toLowerCase() == "average"){
          columnID =  sectionFields[0].actionDetails.column;
         sectionGroups.asMap().forEach((key, value) {
          acitionColumn = value.groupFields.where((element) => element.id == columnID).toList();
              copyFromID = acitionColumn[0].actionDetails.copyFromFieldId;
               acitionColumn = value.groupFields.where((element) => element.id == copyFromID).toList();
              finalScore += acitionColumn[0].defaultValue;

         });
         if(finalScore != 0){
           finalScore = finalScore/sectionGroups.length;
         }
        //  acitionColumn.asMap().forEach((i, e) => {
        //    finalScore += e.defaultValue !=null ? int.parse(e.defaultValue) : 0});
        }

        returnSection.add(buildSizedBox(20, 0));
        returnSection.add(Container(
          decoration: rBoxDecorationStyles,
          width: queryData.size.width - 30,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              getSectionData(masterSections, queryData),
              getGroupFields(masterSections, sectionGroups, queryData),
              // const SizedBox(
              //   height: 3,
              // ),
              buildText(queryData, FontWeight.bold, const Color.fromARGB(255, 132, 131, 133), 12,  "${sectionFields[0].label}  $finalScore",alignmentType: "sections"),
              const SizedBox(
                height: 15,
              ),
              
            ],
          ),
        ));
      
      finalScore = 0;
      });
      // return returnSection;
    });
    // returnAllCategoryWidgets.add({"categoryId" : "index", "categoryWidgets" : returnWidgets});
    // return returnAllCategoryWidgets;
  }

  Container getGroupFields(Sections masterSections, List<Groups> sectionGroups,
      MediaQueryData queryData) {
    JsonId jsonId, tempJsonId;
    GroupFields selectedGroupFields;
    Options option;
    returnWidgets = [];
    List<Widget> returnGroups = [];
    sectionGroups.asMap().forEach((groupKey, Groups groupRes) {
      returnWidgets.add(buildSizedBox(0,0));
      returnWidgets.add(
        buildText(queryData, FontWeight.normal, Colors.lightBlue, 14,
            groupRes.groupName,
            alignmentType: "groups"),
      );
      groupRes.groupFields.asMap().forEach((key, groupsFieldRes) {
        jsonId = JsonId(
            sectionId: masterSections.sectionId,
            groupId: groupRes.groupId,
            fieldId: groupsFieldRes.id);
        if (key == 0) {
          jsonId = JsonId(
              sectionId: masterSections.sectionId,
              groupId: groupRes.groupId,
              fieldId: groupsFieldRes.id,
              value: groupsFieldRes.options[0].id);

          returnWidgets.add(buildDropDown(
              dropDownFieldsOptions,
              Icons.email,
              "Email",
              queryData,
              onChangeDropItem,
              dropdownMenuItem,
              dropdownononChangeJS,
              anyCollectJsonString,
              false,
              0,
              jsonId));
        
        } else if (key == 1) {
          if (groupsFieldRes.type.toLowerCase() == "calculated") {
            if (groupsFieldRes.actionDetails.actionType.toLowerCase() ==
                "copy") {
              tempJsonId = jsonId;
              tempJsonId.fieldId = groupsFieldRes.actionDetails.copyFromFieldId;
              IndexOfJsonId tempIndexOfJsonId =
                  _bs.findIndex(anyCollectJsonString, tempJsonId);
              selectedGroupFields =
                  _bs.getObject(anyCollectJsonString, tempIndexOfJsonId);
              var index = selectedGroupFields.options.indexWhere(
                  (element) => element.id == selectedGroupFields.defaultValue);
              option = selectedGroupFields.options[index];
            }
            // verticalSplitSection.add(

            //    buildTextArea(
            //      _bs,
            //      anyCollectJsonString,
            //     Icons.rotate_90_degrees_ccw,
            //      queryData,
            //     Colors.lightBlue,
            //     true,
            //     jsonId,
            //    _onUpdate,
            //     true,
            //     context,
            // value: option.value.toString(),
            // name: groupsFieldRes.label,
            // isReadOnly: true),

            // // buildTextField(
            // //     _bs,
            // //     anyCollectJsonString,
            // //     Icons.rotate_90_degrees_ccw,
            // //     queryData,
            // //     Colors.lightBlue,
            // //     true,
            // //     jsonId,
            // //     _onUpdate,
            // //     true,
            // //     value: option.value.toString(),
            // //     name: groupsFieldRes.label,
            // //     isReadOnly: true)
            // );
          }
          //verticalSplitSection.add(buildTextField(Icons.score, queryData,Colors.lightBlue, true, name:groupsFieldRes.label));
        }
        // if (verticalSplitSection.length == 1) {
        // returnWidgets.add(const SizedBox(
        //   height: 20,
        // ));
        if (groupsFieldRes.type == "textArea" && key == 2) {
          returnWidgets.add(buildTextArea(
              _bs,
              anyCollectJsonString,
              Icons.comment,
              queryData,
              Colors.lightBlue,
              false,
              jsonId,
              _onUpdate,
              true,
              context,
              txt,
              values: groupsFieldRes.value,
              name: (groupsFieldRes.value != null && groupsFieldRes.value != "")
                  ? groupsFieldRes.value
                  : groupsFieldRes.label));
        }
        // }
        // else if (verticalSplitSection.length == 2) {
        returnWidgets.add(buildSizedBox(2,0));
        // returnWidgets.add(buildVerticalSplit(
        //     queryData, verticalSplitSection[0], verticalSplitSection[1]));

        verticalSplitSection = [];

        if (groupsFieldRes.id == "attachmentId") {
          //temp
          groupsFieldRes.type = "attachment";
          int val = (groupKey) % 2;
          ImageSource img = val == 0 ? ImageSource.camera : ImageSource.gallery;
          returnWidgets.add(
            buildIconButton(
                _bs,
                anyCollectJsonString,
                Icons.add_circle_rounded,
                "Add Files",
                queryData,
                onChangeUploadButton,
                getAttachments,
                groupsFieldRes.label,
                // ImageSource.gallery,
                img,
                jsonId),
          );
          returnWidgets.add(buildSizedBox(1,0));
        }
        
        // }
      });
   

      returnGroups.add(Container(
        width: queryData.size.width - 20,
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1,color: const Color.fromARGB(99, 138, 138, 138))
        // ),
        child: Column(
          children: returnWidgets,
        ),
      ));
      returnGroups.add(const SizedBox(
        height: 5,
      ));

      returnWidgets = [];
      
    }
    
    
     
    
    );
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: returnGroups,
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

  Container getSectionData(masterSections, MediaQueryData queryData) {
    return buildText(
      queryData,
      FontWeight.bold,
      Colors.lightBlue,
      20,
      masterSections.sectionName.toString().toUpperCase(),
      alignmentType: "sections",
    );
  }

  List<Widget> getAttachments(MediaQueryData queryData, String attachments) {
    List<Widget> attachment = [];
    if (attachments != null) {
      AttachmentFile attachmentsFiles =
          AttachmentFile.fromJson(jsonDecode(attachments));
      for (var res in attachmentsFiles?.attachments) {
        attachment.add(Text(
          res.fileName,

style: GoogleFonts.openSans(textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 132, 131, 133)),),

        ));

        if (queryData.orientation.index == 0) {
          attachment.add(buildSizedBox(5, 0));
        } else {
          attachment.add(buildSizedBox(0, 5));
        }
      }
    }

    return attachment;
  }
}
