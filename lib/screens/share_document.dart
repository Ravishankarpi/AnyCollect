import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


import 'package:sensors_plus/sensors_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';



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

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Sending Message"),
    ));
    //........
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Image size must be upload below 2mb'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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

          
          //single image
          // final imagePicker = await ImagePicker().pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
          final imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
          final bytes = File(imagePicker.path).readAsBytesSync().lengthInBytes;
          final kb = bytes / 1000;
          final mb = kb / 1000;

           if(imagePicker == null) return;
           if(mb < 2){
        Fluttertoast.showToast(
        msg: "This is a Toast message",  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );
           }
          // _showToast(context);
          await Share.shareFiles([imagePicker.path] , subject: "Ravi Galary Test");

         // final urlImg  = 'https://i.ibb.co/60gJcTS/new-one-edit-copy.jpg';
            // final url = Uri.parse(urlImg);
            // final resp = await http.get(url);
            // final byte =resp.bodyBytes;

            // final temp = await getTemporaryDirectory();
            // final path = '${temp.path}/image.jpg';
            // File(path).writeAsBytesSync(byte);
         
         

          
          //upload multiple image
          final imagePickers = await ImagePicker().pickMultiImage(maxHeight: 100.0,maxWidth: 100.0, imageQuality: 50);

          List<String> imagePath = [];
          if(imagePickers == null) return;

          for (var element in imagePickers) {
            imagePath.add(element.path);
          }
            await Share.shareFiles(imagePath , subject: "Ravi Galary Test");
 
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
