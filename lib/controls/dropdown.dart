import 'package:flutter/material.dart';
import 'package:flutter_dev/model/dropdown_model.dart';
import 'package:flutter/foundation.dart';

  
  
SizedBox buildDropDown(icon, name, queryData,Function onChangeDropItem,List <DropdownMenuItem> dropdownMenuItems, DropdownonChangeModel dropdownononChangeJS,bool isDivided, index ) {
final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
   
    double dropDownWidth = (queryData.size.width-100);
    int _value = 0;
    if(isDivided){
          if(queryData.orientation.index == 0)
          dropDownWidth = (queryData.size.width-120) /2;
          else
          dropDownWidth = (queryData.size.width-120) /2;
    }
    else
    {
          dropDownWidth = (queryData.size.width-100);
    }


    return SizedBox(
       width: dropDownWidth,  // 320 divided by 2
                child: DropdownButton(
                  isExpanded: true,
                  menuMaxHeight : 200,
                  elevation:8,
              value: dropdownononChangeJS?.dropDownOnChange[index]?.value,
               items: buildDropDownItem() != null ? buildDropDownItem() : [],
              //items: dropdownMenuItems,
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
