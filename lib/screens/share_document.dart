import 'dart:html';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


import 'package:sensors_plus/sensors_plus.dart';



class ShareDocument extends StatelessWidget {
  const ShareDocument({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShareDocumentWidget();
  }
}


class ShareDocumentWidget extends StatefulWidget with ChangeNotifier {
  ShareDocumentWidget({Key key}) : super(key: key);

  @override
  State<ShareDocumentWidget> createState() => _ShareDocumentState();
}

class _ShareDocumentState extends State<ShareDocumentWidget> with ChangeNotifier {

  void initState() {
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("data"),
           ElevatedButton(
             child: Text("Click Here"),
        onPressed: () async {
          // text shareing
           //await  Share.share('check out my website https://example.com'),
          //  await Share.share('check out my website https://example.com', subject: 'Look what I made!'),

          final imagePicker = await ImagePicker().pickImage(maxHeight: 100.0,maxWidth: 100.0, imageQuality: 50, source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
          final imagePickers = await ImagePicker().pickMultiImage(maxHeight: 100.0,maxWidth: 100.0, imageQuality: 50);
          List<String> imagePath = [];
          if(imagePicker == null) return;

          for (var element in imagePickers) {
            imagePath.add(element.path);
          }

          await Share.shareFiles(imagePath, subject: "Ravi Galary Test");

 
            // image shreing


            // final urlImg  = 'https://i.ibb.co/60gJcTS/new-one-edit-copy.jpg';
            // final url = Uri.parse(urlImg);
            // final resp = await http.get(url);
            // final byte =resp.bodyBytes;

            // final temp = await getTemporaryDirectory();
            // final path = '${temp.path}/image.jpg';
            // File(path).writeAsBytesSync(byte);

            // await Share.shareFiles([path], subject: "Ravi Test");


            //..
        },
           ),
        ],
      ),
    );
     }
}
