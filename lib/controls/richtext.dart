import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/dropdown.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';

TextEditingController initialValue(String editedText) {
  return TextEditingController(text: editedText);
}

SizedBox buildRichText(
    BaseService _bs,
    AnyCollect anyCollectJsonString,
    icon,
    MediaQueryData queryData,
    Color fntColor,
    isDivided,
    JsonId jsonId,
    Function _onUpdate,
    isControlRequired,
    {String value = "",
    String name = "",
    bool isReadOnly = false}) {
  double dropDownWidth = (queryData.size.width - 100);
  int _value = 0;
  int index;
  IndexOfJsonId indexOfJsonId;
  GroupFields groupFields;
  if (isDivided) {
    if (queryData.orientation.index == 0)
      dropDownWidth = (queryData.size.width - 120) / 2;
    else
      dropDownWidth = (queryData.size.width - 120) / 2;
  } else {
    dropDownWidth = (queryData.size.width - 100);
  }
  return SizedBox(
    width: dropDownWidth,
    child: RichText(
      
          )
  );
}
