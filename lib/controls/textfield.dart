  import 'package:flutter/material.dart';
  
  
  
  SizedBox buildTextField(icon, MediaQueryData queryData, Color fntColor , isDivided, {String name = ""}) {
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
      width: dropDownWidth,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: name != "" ? name : null ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
