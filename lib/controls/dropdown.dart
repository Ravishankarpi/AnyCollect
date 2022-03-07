import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:universal_html/js_util.dart';

SizedBox buildDropDown(
  List<DropDownOptions> dropDownFieldsOptions,
    icon,
    name,
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
  getDropDownOptions(dropDownFieldsOptions,indexOfJsonId, anyCollect
            .anyCollectForms[0]
            .formData
            .sections[indexOfJsonId.sectionIds]
            .groups[indexOfJsonId.groupsIds]
            .groupFields[indexOfJsonId.fieldIds]
            .options);
  double dropDownWidth = (queryData.size.width - 100);
  int _value = 0;
    var index = dropDownFieldsOptions.indexWhere((element) => element.indexOfJsonId.fieldIds == indexOfJsonId.fieldIds && element.indexOfJsonId.groupsIds == indexOfJsonId.groupsIds && element.indexOfJsonId.sectionIds == indexOfJsonId.sectionIds && element.indexOfJsonId.optionIds == indexOfJsonId.optionIds);

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

  return SizedBox(
    width: dropDownWidth, // 320 divided by 2
    child: DropdownButton(
        isExpanded: true,
        menuMaxHeight: 200, 
        elevation: 8,
        value:  dropDownFieldsOptions[index].value,
        items: buildDropDownItem(dropDownFieldsOptions, indexOfJsonId) ?? [],
        //items: dropdownMenuItems,
        onChanged: (value) {
          onChangeDropItem(indexOfJsonId, value);
        }),
  );
}

List<DropdownMenuItem> buildDropDownItem(List<DropDownOptions> _list, IndexOfJsonId indexOfJsonId) {
  var index = _list.indexWhere((element) => element.indexOfJsonId.fieldIds == indexOfJsonId.fieldIds && element.indexOfJsonId.groupsIds == indexOfJsonId.groupsIds && element.indexOfJsonId.sectionIds == indexOfJsonId.sectionIds && element.indexOfJsonId.optionIds == indexOfJsonId.optionIds);
  List<DropdownMenuItem> dropdownMenuItem = [];
  if(index != -1){
    _list[index].dropDownptions.asMap().forEach((key, value) {
    dropdownMenuItem.add(new DropdownMenuItem(
      child: Text(value),
      value: key,
    ));
  });
  }
  // _list = ["None","Gokul","Ravi","Divya","Jay"];
 
  return dropdownMenuItem;
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
  return new IndexOfJsonId(
      sectionIds: secId, groupsIds: grpId, fieldIds: fieId, optionIds: optId);
}

getDropDownOptions(List<DropDownOptions> dropDownFieldsOptions, IndexOfJsonId indexOfJsonId, List<Options> options) {
  List<String> buildOptions = [];
  options.asMap().forEach((key, value) {
   buildOptions.add(value.text);
  });
    dropDownFieldsOptions.add(new DropDownOptions(indexOfJsonId: indexOfJsonId, dropDownptions: buildOptions, value: 0));
}
