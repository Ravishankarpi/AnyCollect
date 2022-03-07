import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/model/ids.dart';

class DropdownonChangeModel {
  List<DropDownOnChange> dropDownOnChange;

  DropdownonChangeModel({this.dropDownOnChange});

  DropdownonChangeModel.fromJson(Map<String, dynamic> json) {
    if (json['dropDownOnChange'] != null) {
      dropDownOnChange = <DropDownOnChange>[];
      json['dropDownOnChange'].forEach((v) {
        dropDownOnChange.add(new DropDownOnChange.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dropDownOnChange != null) {
      data['dropDownOnChange'] =
          this.dropDownOnChange.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DropDownOnChange {
  int sectionId;
  int groupId;
  int fieldId;
  int value;

  DropDownOnChange({this.fieldId, this.value});

  DropDownOnChange.fromJson(Map<String, dynamic> json) {
    fieldId = json['fieldId'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldId'] = this.fieldId;
    data['value'] = this.value;
    return data;
  }
}



class DropDownOptions {
  DropDownOptions({
    this.indexOfJsonId,
    this.dropDownptions,
    this.value
  });
    IndexOfJsonId indexOfJsonId;
    List<String> dropDownptions;
    int value;
  
  DropDownOptions.fromJson(Map<String, dynamic> json){
    indexOfJsonId = IndexOfJsonId.fromJson(json['IndexOfJsonId']);
    dropDownptions = List.castFrom<dynamic, String>(json['DropDownptions']);
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['IndexOfJsonId'] = indexOfJsonId.toJson();
    _data['DropDownptions'] = dropDownptions;
    _data['value'] = this.value;
    return _data;
  }
}

  