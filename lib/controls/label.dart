import 'package:flutter/material.dart';


SizedBox buildText(MediaQueryData queryData,FontWeight fntWeight, Color fntColor ,double fntSize,  String txtName, {String alignmentType= ""} ) {
    double dropDownWidth = (queryData.size.width-100);
    int _value = 0;
          if(queryData.orientation.index == 0)
          dropDownWidth = (queryData.size.width-120) /2;
          else
          dropDownWidth = (queryData.size.width-120) /2;

          if(alignmentType.toLowerCase() == "sections")
          dropDownWidth = queryData.size.width-70;
          else if(alignmentType.toLowerCase() == "groups")
          dropDownWidth = queryData.size.width-100;
    
    return SizedBox(
      width: dropDownWidth,
      child: Text(txtName, style: TextStyle(fontWeight: fntWeight, fontSize: fntSize, color: fntColor),)
    );
  }