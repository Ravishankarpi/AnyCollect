import 'package:flutter/cupertino.dart';

SizedBox buildEmptyWidth(queryData){
  double dropDownWidth = 280;
  return SizedBox(
       width: queryData.size.width - dropDownWidth
       );
}

SizedBox buildSizedBox(double hei, double wid){
  return SizedBox(
       height: hei,
       width: wid,
       );
}