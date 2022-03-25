import 'package:flutter/material.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:google_fonts/google_fonts.dart';

// TextEditingController initialValue(String editedText) {
//   return TextEditingController(text: editedText);
// }

// var txt = TextEditingController();

SizedBox buildTextArea(
    BaseService _bs,
    AnyCollect anyCollectJsonString,
    icon,
    MediaQueryData queryData,
    Color fntColor,
    isDivided,
    JsonId jsonId,
    Function _onUpdate,
    isControlRequired,
    BuildContext context,
    TextEditingController txt,
    {String values = "",
    String name = "",
    bool isReadOnly = false}) {
  double textArea = (queryData.size.width - 100);
  // int _value = 0;
  // int index;
  IndexOfJsonId indexOfJsonId;
  GroupFields groupFields;

  if (isDivided) {
    if (queryData.orientation.index == 0)
      textArea = (queryData.size.width - 120) / 2;
    else
      textArea = (queryData.size.width - 120) / 2;
  } else {
    textArea = (queryData.size.width - 100);
  }
  // txt.text = "";
  return SizedBox(
      width: textArea,
      child: GestureDetector(
          onTap: () => {
                txt.clear(),
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 10,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: TextField(
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4c4c4c)),
                              ),
                              autofocus: true,
                              controller: txt,
                              readOnly: isReadOnly,
                              onChanged: (value) => {
                                txt.text = "",
                                indexOfJsonId =
                                    _bs.findIndex(anyCollectJsonString, jsonId),
                                _onUpdate(indexOfJsonId, value),
                                txt.text = value,
                                txt.selection = TextSelection.fromPosition(
                                    TextPosition(offset: txt.text.length)),
                              },
                              decoration: const InputDecoration(
                                hintText: "Your Comments",
                              ),
                            )),
                      );
                    })
              },
          child: Container(
            height: 50,
            padding: EdgeInsets.only(left: 6, top: 3),
            child: Text(name,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: name.toLowerCase() == "comments" ? Color.fromARGB(122, 76, 76, 76) : Color(0xFF4c4c4c)
                      ),
                )),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromARGB(250, 209, 209, 209),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromRGBO(242, 242, 243, 5),
              //     blurRadius: 0.1,
              //     offset: Offset(0, 2),
              //   ),
              // ],
            ),
          )));
}
    
    
    // isControlRequired
    // // autoFilledFields
    //     ? 
        
        
    //     TextField(
    //         controller: initialValue(value),
    //         onChanged: (value) => {
    //           indexOfJsonId = _bs.findIndex(anyCollectJsonString, jsonId),
    //           _onUpdate(indexOfJsonId, value)
    //         },
    //         readOnly: isReadOnly,
    //         decoration: InputDecoration(
    //           // prefixIconColor: Color.fromARGB(255, 240, 14, 14),
    //           prefixIcon: Icon(icon),
    //           labelText: name != "" ? name : null,
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(0),
    //           ),
    //         ),
    //       )
    //       // EditableFields
    //     : TextField(
    //       maxLines: 5,
    //         onChanged: (value) => {
    //           indexOfJsonId = _bs.findIndex(anyCollectJsonString, jsonId),
    //           _onUpdate(indexOfJsonId, value)
    //         },
    //         readOnly: isReadOnly,
    //         decoration: InputDecoration(
    //           labelText: name != "" ? name : null,
    //           hintText: "Your Comments",
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(0),
    //           ),
    //         ),
    //       ),
  // );
//   );
// }
