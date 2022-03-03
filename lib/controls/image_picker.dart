import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

SizedBox buildIconButton(icon, String iconName, MediaQueryData queryData, Function onChangeUploadButton, String uploadedFileName, ImageSource imageSource) {
  
  return SizedBox(
    width: queryData.size.width - 80,
    child: TextButton(
      clipBehavior: Clip.antiAlias,
      onPressed: () async {
        final XFile imagePicker =
            await ImagePicker().pickImage(source: imageSource);
        onChangeUploadButton(imagePicker);
        
        // final bytes = File(imagePicker.path).readAsBytesSync().lengthInBytes;
      },
      style: ButtonStyle(
        alignment : Alignment.topLeft
      ),
      child: Row(
        children : <Widget>[
          Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[Icon(icon, size: 70,), Text(iconName, style: TextStyle(fontSize: 20))],
        ),
        Text(uploadedFileName.toLowerCase(), style: TextStyle(color: Colors.black, fontSize: 18 ),),
        ], 
      ),
    ),
  );
}
