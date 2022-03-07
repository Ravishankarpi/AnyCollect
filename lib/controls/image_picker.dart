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
          children: <Widget>[Icon(icon, size: 50, color: Color.fromARGB(255, 132, 131, 133),), Text(iconName, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 132, 131, 133)))],
        ),
        Text(" * "+uploadedFileName.toLowerCase(), style: TextStyle(color: Color.fromARGB(255, 240, 14, 14), fontSize: 12 ),),
        ], 
      ),
    ),
  );
}
