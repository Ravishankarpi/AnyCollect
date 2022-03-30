import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/FadeRouteBuilder.dart';
import 'package:flutter_dev/controls/cupertina.dart';
import 'package:flutter_dev/controls/emptySize.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universal_html/js_util.dart';

SizedBox buildDropDown(
  BuildContext
  context,
    List<DropDownOptions> dropDownFieldsOptions,
    icon,
    name,
    MediaQueryData
    queryData,
    Function onChangeDropItem,
    List<DropdownMenuItem> dropdownMenuItems,
    DropdownonChangeModel dropdownononChangeJS,
    AnyCollect anyCollect,
    bool isDivided,
    index,
    JsonId jsonId) {
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  IndexOfJsonId indexOfJsonId = findIndex(anyCollect, jsonId);
  // getDropDownOptions(dropDownFieldsOptions,indexOfJsonId, anyCollect
  //           .anyCollectForms[0]
  //           .formData
  //           .sections[indexOfJsonId.sectionIds]
  //           .groups[indexOfJsonId.groupsIds]
  //           .groupFields[indexOfJsonId.fieldIds]
  //           .options);

  double dropDownWidth = (queryData.size.width - 100);
  int _value = 0;
  // var index = dropDownFieldsOptions.indexWhere((element) => element.indexOfJsonId.fieldIds == indexOfJsonId.fieldIds && element.indexOfJsonId.groupsIds == indexOfJsonId.groupsIds && element.indexOfJsonId.sectionIds == indexOfJsonId.sectionIds && element.indexOfJsonId.optionIds == indexOfJsonId.optionIds);

  if (isDivided) {
    if (queryData.orientation.index == 0)
      dropDownWidth = (queryData.size.width - 120) / 2;
    else
      dropDownWidth = (queryData.size.width - 120) / 2;
  } else {
    dropDownWidth = (queryData.size.width - 100);
  }

  //   return SizedBox(
  //      width: dropDownWidth,  // 320 divided by 2
  //               child: DropdownButton(
  //                 isExpanded: true,
  //                 menuMaxHeight : 200,
  //                 elevation:8,
  //             value: dropdownononChangeJS?.dropDownOnChange[index]?.value,
  //              items: buildDropDownItem([]) != null ? buildDropDownItem([]) : [],
  //             //items: dropdownMenuItems,
  //             onChanged: (value) {
  //               onChangeDropItem(index, value);
  //             }),
  //   );
  // }


//want to change
  // return SizedBox(
  //   width: dropDownWidth, // 320 divided by 2
  //   child: DropdownButton(
  //       isExpanded: true,
  //       menuMaxHeight: 200,
  //       elevation: 8,
  //       value: getObject(anyCollect, indexOfJsonId).defaultValue,
  //       items: buildDropDownItem(anyCollect, indexOfJsonId) ?? [],
  //       //items: dropdownMenuItems,
  //       onChanged: (value) {
  //         onChangeDropItem(indexOfJsonId, value);
  //       }),
  // );

  return SizedBox(
    width: dropDownWidth, // 320 divided by 2
    child: GestureDetector(
      onTap: () => {
 showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: Text(getObject(anyCollect, indexOfJsonId).label),
                // message: const Text('Options'),
                actions: buildCupertino(anyCollect, indexOfJsonId, context, onChangeDropItem),
                cancelButton :  CupertinoActionSheetAction(
                    child: const Text('Cancle'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
            ),
          
        
    //  Navigator.of(context).push(FadeRouteBuilder(page: buildCupertinaActionSheet(context))),
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          border:  Border.all(width: 1.0, color: Color.fromARGB(250, 209, 209, 209)),
        ),
        child: Row(
          children: [
            SizedBox(
        width: queryData.orientation.index == 0 ?  dropDownWidth/1.16: dropDownWidth/1.06,
              child: Text(getObject(anyCollect, indexOfJsonId).options[getObject(anyCollect, indexOfJsonId).defaultValue-1].text)),
            // buildSizedBox(0, queryData.orientation.index == 0 ? 0 : 0),
            Icon(Icons.arrow_drop_down_circle, color: Color.fromARGB(250, 209, 209, 209),)
          ],
        ))),  
    );
    
    
  //   DropdownButton(
  //       isExpanded: true,
  //       menuMaxHeight: 200,
  //       elevation: 8,
  //       value: getObject(anyCollect, indexOfJsonId).defaultValue,
  //       items: buildDropDownItem(anyCollect, indexOfJsonId) ?? [],
  //       //items: dropdownMenuItems,
  //       onChanged: (value) {
  //         onChangeDropItem(indexOfJsonId, value);
  //       }),
  // );


}

List<DropdownMenuItem> buildDropDownItem(
    AnyCollect anyCollect, IndexOfJsonId indexOfJsonId) {
  List<Options> obtions = getObject(anyCollect, indexOfJsonId).options;
  List<dynamic> _list = [];
  List<DropdownMenuItem> dropdownMenuItem = [];

  obtions.asMap().forEach((key, value) {
    dropdownMenuItem.add( DropdownMenuItem(
      child: Text(value.text,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 0, 0, 0)),
          )),
      value: value.id,
    ));
  });

  // _list = ["None","Gokul","Ravi","Divya","Jay"];

  return dropdownMenuItem;
}


List<CupertinoActionSheetAction> buildCupertino(
    AnyCollect anyCollect, IndexOfJsonId indexOfJsonId, BuildContext context, Function onChangeDropItem) {
  List<Options> obtions = getObject(anyCollect, indexOfJsonId).options;
  List<CupertinoActionSheetAction> cupertinoActionSheetAction = [];

  obtions.asMap().forEach((key, value) {


cupertinoActionSheetAction.add(CupertinoActionSheetAction(
                    child: Text(value.text),
                    onPressed: () {
                      onChangeDropItem(indexOfJsonId, value);
                      Navigator.pop(context);
                    },
                  ));



  });


  return cupertinoActionSheetAction;
}

IndexOfJsonId findIndex(AnyCollect anyCollect, JsonId jsonid) {
  // ignore: unrelated_type_equality_checks
  int secId;
  int grpId;
  int fieId;
  int optId;
  secId = anyCollect.anyCollectForms[0].formData.sections
      .indexWhere((element) => element.sectionId == jsonid.sectionId);
  grpId = anyCollect.anyCollectForms[0].formData.sections[secId].groups
      .indexWhere((element) => element.groupId == jsonid.groupId);
  fieId = anyCollect
      .anyCollectForms[0].formData.sections[secId].groups[grpId].groupFields
      .indexWhere((element) => element.id == jsonid.fieldId);
  optId = anyCollect.anyCollectForms[0].formData.sections[secId].groups[grpId]
      .groupFields[fieId].options
      .indexWhere((element) => element.id == jsonid.value);
  return IndexOfJsonId(
      sectionIds: secId, groupsIds: grpId, fieldIds: fieId, optionIds: optId);
}

GroupFields getObject(AnyCollect anyCollect, IndexOfJsonId indexOfJsonId) {
  return anyCollect
      .anyCollectForms[0]
      .formData
      .sections[indexOfJsonId.sectionIds]
      .groups[indexOfJsonId.groupsIds]
      .groupFields[indexOfJsonId.fieldIds];
}

getDropDownOptions(List<DropDownOptions> dropDownFieldsOptions,
    IndexOfJsonId indexOfJsonId, List<Options> options) {
  List<String> buildOptions = [];
  options.asMap().forEach((key, value) {
    buildOptions.add(value.text);
  });
  dropDownFieldsOptions.add(DropDownOptions(
      indexOfJsonId: indexOfJsonId, dropDownptions: buildOptions, value: 0));
}
