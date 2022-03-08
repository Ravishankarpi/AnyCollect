import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/dropdown.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';

TextEditingController initialValue(String editedText) {
  return TextEditingController(text: editedText);
}

SizedBox buildTextField(
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
    child: isControlRequired
    // autoFilledFields
        ? TextField(
            controller: initialValue(value),
            onChanged: (value) => {
              indexOfJsonId = _bs.findIndex(anyCollectJsonString, jsonId),
              _onUpdate(indexOfJsonId, value)
            },
            readOnly: isReadOnly,
            decoration: InputDecoration(
              // prefixIconColor: Color.fromARGB(255, 240, 14, 14),
              prefixIcon: Icon(icon),
              labelText: name != "" ? name : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          )
          // EditableFields
        : TextField(
          maxLines: 5,
            onChanged: (value) => {
              indexOfJsonId = _bs.findIndex(anyCollectJsonString, jsonId),
              _onUpdate(indexOfJsonId, value)
            },
            readOnly: isReadOnly,
            decoration: InputDecoration(
              labelText: name != "" ? name : null,
              hintText: "Your Comments",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
  );
}
