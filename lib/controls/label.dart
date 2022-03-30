import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container buildText(MediaQueryData queryData, FontWeight fntWeight,
    Color fntColor, double fntSize, String txtName,
    {String alignmentType = "", String position = ""}) {
  double dropDownWidth = (queryData.size.width - 100);
  int _value = 0;
  if (queryData.orientation.index == 0)
    dropDownWidth = (queryData.size.width - 120) / 2;
  else
    dropDownWidth = (queryData.size.width - 120) / 2;

  if (alignmentType.toLowerCase() == "sections")
    dropDownWidth = queryData.size.width - 50;
  else if (alignmentType.toLowerCase() == "groups")
    dropDownWidth = queryData.size.width - 100;



  return Container(
    height: queryData.orientation.index == 0 ? txtName.length >= 55 ? 60 : 40 : 40,
    padding: alignmentType.toLowerCase() != "sections" &&
            alignmentType.toLowerCase() != "center"
        ? EdgeInsets.only(top: 10, left: 5)
        : EdgeInsets.zero,
    color: alignmentType.toLowerCase() != "sections" &&
            alignmentType.toLowerCase() != "center"
        ? Color.fromARGB(221, 44, 60, 132)
        : Colors.transparent,
    child: SizedBox(
      width: alignmentType.toLowerCase() != "sections" &&
              alignmentType.toLowerCase() != "center"
          ? dropDownWidth + 65
          : dropDownWidth,
      child: alignmentType.toLowerCase() == "center"
          ? Text(
              txtName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: fntWeight, fontSize: fntSize, color: fntColor),
            )
          : alignmentType.toLowerCase() == "sections"
              ? Text(
                  txtName,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: fntSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4c4c4c)),
                  ),
                )
              : alignmentType.toLowerCase() == "groups" ? Text(txtName,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: fntSize,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ))
                  : "",
    ),
  );
}
