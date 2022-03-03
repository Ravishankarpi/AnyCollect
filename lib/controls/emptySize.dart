import 'package:flutter/cupertino.dart';

SizedBox buildEmptyWidth(queryData){
  double dropDownWidth = 280;
  return SizedBox(
       width: queryData.size.width - dropDownWidth
       );
}