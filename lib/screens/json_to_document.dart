import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_dev/model/json_model.dart';

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
                    <String>['${i+1}) ${modelClass.data.elementAt(i).productName}', '${modelClass.data.elementAt(i).quantity}', '${modelClass.data.elementAt(i).price}'],
                ]),
        pw.Paragraph(text: ""),
        pw.Paragraph(text: "Subtotal: 10"),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
          ]));

  return doc.save();
}