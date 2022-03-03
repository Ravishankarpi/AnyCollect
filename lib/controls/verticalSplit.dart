import 'package:flutter/material.dart';

SizedBox buildVerticalSplit(queryData, SizedBox left, SizedBox right){
  return SizedBox(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          left,
          SizedBox(width: 20,),
          right
        ],
      ),
    )
  );
}

