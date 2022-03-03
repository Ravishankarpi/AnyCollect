// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dev/model/form_model.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/screens/custom_fields.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/screens/json_to_document.dart';
import 'package:flutter_dev/screens/local_storage_test.dart';
import 'package:flutter_dev/screens/share_document.dart';
import 'package:flutter_dev/screens/sample_form.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dev/model/json_model.dart';
import 'package:share_plus/share_plus.dart';
import 'provider/service.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
  MyApp({Key key}) : super(key: key);

  // const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (context) => BaseService(),
          child: MyStatefulWidget(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget with ChangeNotifier {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _State();
}

class _State extends State<MyStatefulWidget> with ChangeNotifier {
  // late Future<Album> futureAlbum ;
  // Album albem = Album();
  final BaseService _bs = BaseService();
  final LocalStoragetest _localHelper = LocalStoragetest();
  List<String> _list = ['Dog', "Cat", "Mouse", 'Lion'];
  get providers => null;

  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];

  List<String> _dogs = <String>['', 'muff', 'rover'];

  List<String> _people = <String>['', 'mum', 'dad', 'sister', 'brother'];

  var resultsList = new List.filled(3, '');
  File file;
  ModelClass modelClass;

  @override
  void initState() {
    //getPdf();
    resultsList[0] = 'red';
    resultsList[1] = 'muff';
    resultsList[2] = 'mum';
    super.initState();
    //Provider.of<BaseService>(context, listen: false).setValueHere();
  }

  oks() {
    List<JsonPlaceholder> placeHolder = [];
    _bs.fetchAlbum().then((value) {
      _bs.albem = Album.fromJson(value);
      notifyListeners();
    }).catchError((ex) {
      print("error:" + ex);
    });
  }

  JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

  var isPortrait = false;

  test() {
    print(Provider.of<BaseService>(context, listen: false).albem);
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait) {
      setState(() {
        isPortrait = true;
      });
    } else {
      setState(() {
        isPortrait = false;
      });
    }
  }

  Future<void> crateExcel() async {}

  void getPdf() async {
    modelClass = ModelClass.fromJson(JsonStringToObjectConverter(dummyJson));
    // generate Json to PDF
    await generateCSV();
    Uint8List uint8list = await generateDocument(modelClass);

    Directory output = await getTemporaryDirectory();
    file = File(output.path + "/example.pdf");
    setState(() {
      file.writeAsBytes(uint8list);
      print("Test 2" + file.path);
    });
  }

  // test1(val, index) {
  // setState(() {
  //        groupValue = val;
  //        title = _list.elementAt(index);
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    // return CustomFields();
    // return WidgetsForms();
    // return Center(
    //     child: file != null
    //         ? Column(
    //             children: <Widget>[
    //               ElevatedButton(onPressed: (() async {
    //                 await generateCSV();
    //                 // await Share.shareFiles([file.path],
    //                 //     subject: "Ravi PDF Test");
    //               })),
    //             ],
    //           )
    //         : ElevatedButton(onPressed: (() async {
    //             await generateCSV();
    //             // await Share.shareFiles([file.path],
    //             //     subject: "Ravi PDF Test");
    //           })));

    return DynamiceForm();
  }
}
