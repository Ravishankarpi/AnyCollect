import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter_dev/controls/emptySize.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

picFileFromSource(IndexOfJsonId indexOfJsonId, bool isMulti,
    Function onChangeUploadButton, ImageSource imageSource) async {
      List<XFile> imagePicker = [];
  if (isMulti) {
    imagePicker = await ImagePicker().pickMultiImage(imageQuality: 50);
    onChangeUploadButton(indexOfJsonId, imagePicker);
  } else {
    XFile singleImagePicker =
        await ImagePicker().pickImage(source: imageSource);
        imagePicker.add(singleImagePicker);
    onChangeUploadButton(indexOfJsonId, imagePicker);
  }
}

SizedBox buildIconButton(
    BaseService _bs,
    AnyCollect anyCollect,
    icon,
    String iconName,
    MediaQueryData queryData,
    Function onChangeUploadButton,
    Function getAttachments,
    String uploadedFileName,
    ImageSource imageSource,
    JsonId jsonId) {
  double AttchmentWidth;
  IndexOfJsonId indexOfJsonId = _bs.findIndex(anyCollect, jsonId);
  GroupFields groupFields =  anyCollect
        .anyCollectForms[0]
        .formData
        .sections[indexOfJsonId.sectionIds]
        .groups[indexOfJsonId.groupsIds]
        .groupFields[indexOfJsonId.fieldIds];
        String  attachmentJsonString = groupFields.value;
        bool isMulti = groupFields.isMulti.toLowerCase() == "true" ? true : false;
      List<Widget> attachmentList = getAttachments(queryData, attachmentJsonString);

  if (queryData.orientation.index == 0)
    AttchmentWidth = (queryData.size.width - 50) / 2;
  else
    AttchmentWidth = (queryData.size.width + 250) / 2;



  return SizedBox(
      width: queryData.size.width - 80,
      child: Row(
        children: <Widget>[
          TextButton(
            clipBehavior: Clip.antiAlias,
            onPressed: () async {
              picFileFromSource(
                  indexOfJsonId, isMulti, onChangeUploadButton, imageSource);
            },
            style: ButtonStyle(alignment: Alignment.topLeft),
            child: Column(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(
                  icon,
                  size: 50,
                  color: Color.fromARGB(255, 132, 131, 133),
                ),
                Text(iconName,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 132, 131, 133)))
              ],
            ),
          ),
          buildSizedBox(0.0, 30),
          SizedBox(
            width: AttchmentWidth,
            height: 60,
            child: attachmentList.isNotEmpty ? Center(
              child: Container(
                // padding:
                //     EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                // decoration: attachmentBoxDecorationStyles,
                child: SingleChildScrollView(
                  scrollDirection: queryData.orientation.index == 0
                      ? Axis.vertical
                      : Axis.horizontal,
                  child: queryData.orientation.index == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: getAttachments(queryData, attachmentJsonString),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: getAttachments(queryData, attachmentJsonString),
                        ),
                ),
              ),
            ) :Container(
              alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                decoration: attachmentBoxDecorationStyles, 
                child: const Text("No Attachments"),
            ),
          )
        ],
      )

      // TextButton(
      //   clipBehavior: Clip.antiAlias,
      //   onPressed: () async {
      //     final XFile imagePicker =
      //         await ImagePicker().pickImage(source: imageSource);
      //     onChangeUploadButton(imagePicker);

      //     // final bytes = File(imagePicker.path).readAsBytesSync().lengthInBytes;
      //   },
      //   style: ButtonStyle(
      //     alignment : Alignment.topLeft
      //   ),
      //   child: Row(
      //     children : <Widget>[
      //       Column(
      //       // Replace with a Row for horizontal icon + text
      //       children: <Widget>[Icon(icon, size: 50, color: Color.fromARGB(255, 132, 131, 133),), Text(iconName, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 132, 131, 133)))],
      //     ),
      //     Text(" * "+uploadedFileName.toLowerCase(), style: TextStyle(color: Color.fromARGB(255, 240, 14, 14), fontSize: 12 ),),
      //     ],
      //   ),
      // ),
      );
}
