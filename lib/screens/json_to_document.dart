import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_dev/model/json_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:csv/csv.dart';

// generate Json to PDF

Future<Uint8List> generateDocument(ModelClass modelClass) async {
  final pw.Document doc = pw.Document();

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        // if (context.pageNumber == 1) {
        //   return null;
        // }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            child: pw.Text('Any Collect',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Table.fromTextArray(
                context: context,
                border: null,
                headerAlignment: pw.Alignment.centerLeft,
                data: <List<String>>[
                  <String>['Item', 'Qty', 'Price'],
                  for (int i = 0; i < modelClass.data.length; i++)
                    <String>[
                      '${i + 1}) ${modelClass.data.elementAt(i).productName}',
                      '${modelClass.data.elementAt(i).quantity}',
                      '${modelClass.data.elementAt(i).price}'
                    ],
                ]),
            pw.Paragraph(text: ""),
            pw.Paragraph(text: "Subtotal: 10"),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
          ]));

  return doc.save();
}

// generate Json to CSV

Future<void> generateCSV() async {
  dynamic data = [
    {"name": "Ravi", "coach": "AnyCollect", "players": "playersplayers"},
    {"name": "Ravi1", "coach": "AnyCollect", "players": "playersplayers"}
  ];

  List<List<dynamic>> csvData = [
    // headers
    <String>['Name', 'Coach', 'players'],
    // data
    ...data.map(
        (item) => [item["name"], item["coach"], item["players"].toString()]),
  ];

  String csv = const ListToCsvConverter().convert(csvData);

  final String dir = (await getApplicationDocumentsDirectory()).path;
  // ignore: sdk_version_constructor_tearoffs
  final String path = '$dir/AnyCollect-${DateTime.now()}.csv';

  // create file
  final File file = File(path);
  await file.writeAsString(csv);

  await Share.shareFiles([path], subject: "Ravi Test");

//     Navigator.of(context).push(
// MaterialPageRoute(
// builder: (_) {
// return MyCSVDisplayScreen(csvFilePath: filePath);
// },
// ),
// );
}


// Future<dynamic> generateDoc()async{
//     //var bytes = File(file).readAsBytesSync();

// //  var excel = Excel.createExcel(); 

//   // var file = "Path_to_pre_existing_Excel_File/excel_file.xlsx";
   
//    var excel = Excel.createExcel();

//  Sheet sheetObject = excel['Any Collect test'];

//  CellStyle cellStyle = CellStyle(backgroundColorHex: "#1AFF1A", fontFamily : getFontFamily(FontFamily.Calibri));
//  cellStyle.underline = Underline.Single; // or Underline.Double
//   var cell = sheetObject.cell(CellIndex.indexByString("A1"));
//  cell.value = "test";
//   cell.cellStyle = cellStyle;
//   print("CellType: "+ cell.cellType.toString());
//          //sheetObject.insertColumn(8);
      
//       // remove column at index = 18
//       // sheetObject.removeColumn(18);
      
//       // // insert row at index = 82
//       // sheetObject.insertRow(82);
      
//       // // remove row at index = 80
//       // sheetObject.removeRow(80);

//     var isSet = excel.setDefaultSheet("Any Collect test");
//           var fileBytes = excel.save();


          

//   var directory = await getApplicationDocumentsDirectory();



      
// } 




