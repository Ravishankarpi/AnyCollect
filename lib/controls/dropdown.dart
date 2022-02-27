  import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/screens/test.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'dart:convert';
  
  
SizedBox buildDropDown(icon, name, queryData,Function onChangeDropItem, DropdownonChangeModel dropdownononChangeJS, index ) {
    int _value = 0;
    return SizedBox(
      width: queryData.size.width - 100,
                child: DropdownButton(
                  menuMaxHeight : 150,
                  elevation:8,
              value: dropdownononChangeJS?.dropDownOnChange[index]?.value,
              items: buildDropDownItem() != null ? buildDropDownItem() : [],
              onChanged: (value) {
                onChangeDropItem(index, value);
              }),
    );
  }
  
  List<DropdownMenuItem> buildDropDownItem(){
    List<DropdownMenuItem> dropdownMenuItem = [];
    List<String> _list = ["None","Ravi","Divya","Jai"];
    _list.asMap().forEach((key, value) {
      dropdownMenuItem.add(new DropdownMenuItem(child: Text(value),value: key,));
    });
    return dropdownMenuItem;
  }
