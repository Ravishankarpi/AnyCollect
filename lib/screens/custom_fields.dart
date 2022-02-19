import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/controls/drop_down.dart';
import 'package:flutter_dev/model/form_model.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/utils/constants.dart';

class CustomFields extends StatefulWidget {
  @override
  _CustomFieldsState createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  final BaseService _bs = BaseService();
  AutoGenerate jsonString = AutoGenerate();
  Category categoryData = Category();
  SubCategoryData subCategoryData = SubCategoryData();
  TextTypeValues textTypeValues = TextTypeValues();
  // ignore: deprecated_member_use
  List<DropDownTypeValues> dropDownTypeValues = <DropDownTypeValues>[];

  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];

  @override
  void initState() {
    super.initState();
    // jsonString = _bs.dummyJson();
    jsonString =
        AutoGenerate.fromJson(JsonStringToObjectConverter(jsonObjectString));
    var testt = "TRestset";
  }

  List<String> _list = ['Dog', "Cat", "Mouse", 'Lion'];
  bool isStrechedDropDown = false;
  int groupValue;
  String title = 'Select Animals';

  test1(isStreched, val, index) {
    if (isStreched) {
      setState(() {
        isStrechedDropDown = !isStrechedDropDown;
      });
    } else {
      setState(() {
        groupValue = val;
        title = _list.elementAt(index);
      });
    }
  }

  getTextType(String textType) {
    return textType != null
        ? textType.toLowerCase() == "email"
            ? TextInputType.emailAddress
            : textType.toLowerCase() == "number"
                ? TextInputType.number
                : TextInputType.text
        : TextInputType.text;
  }

  getIcon(String icon) {
    return icon.toLowerCase() == "email"
        ? Icons.email
        : icon.toLowerCase() == "number"
            ? Icons.code
            : Icons.text_format;
  }

  JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

  List<Widget> getRandomWidgetArray(AutoGenerate jsonObject) {
    // ignore: prefer_typing_uninitialized_variables
    List<Widget> returnWidgets = [];
    List<String> dropDownVaues = [];

    jsonString.category.forEach((element) {
      categoryData = element;
      returnWidgets.add(_buildTitleTF(element.name));
      element.categoryData.categoryValues.forEach((catDataRes) {
        subCategoryData = catDataRes.subCategoryData;
        // _buildTitleTF( catDataRes.name);
        subCategoryData.subCategoryValues.forEach((subCatRes) {
          if (subCatRes.type.toLowerCase() == "dropdown") {
            dropDownVaues = [];
            dropDownTypeValues = subCatRes.droptypeValues;
            subCatRes.droptypeValues.forEach((droptypeValRes) {
              dropDownVaues.add(droptypeValRes.name);
            });
            returnWidgets.add(_buildCityRF(catDataRes.name));
          } else {
            textTypeValues = subCatRes.textTypeValues;
            returnWidgets.add(_buildTextTF(
                catDataRes.name,
                textTypeValues.textType,
                textTypeValues.mode,
                textTypeValues.placeHolder,
                "number"));
          }
        });
      });
    });
    return returnWidgets;
  }

  Widget buildDropDown2(title, List<String> list) {
    return Container(
      child: DropdownButton(
          value: list,
          items: [
            DropdownMenuItem(
              child: Text("Pizza 1"),
              value: "Pizza 1",
            ),
            DropdownMenuItem(
              child: Text("Pizza 2"),
              value: "Pizza 2",
            ),
            DropdownMenuItem(child: Text("Pizza 3"), value: "Pizza 3"),
            DropdownMenuItem(child: Text("Pizza 4"), value: "Pizza 4")
          ],
          onChanged: (value) {
            setState(() {
              title = value;
            });
          }),
    );
  }

  Widget _buildDropDownTF(title, List<String> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: rLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: rBoxDecorationStyle,
            // height: 45.0,
            child: GestureDetector(
              onTap: () {
                test1(true, null, null);
              },
              child: DropDowns(
                context,
                title,
                groupValue,
                isStrechedDropDown,
                test1,
                list,
              ),
            )),
      ],
    );
  }

  Widget _buildMobileRF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile No.',
          style: rLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: rBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.send_to_mobile,
                color: Colors.white,
              ),
              hintText: 'Enter your Mobile No',
              hintStyle: rHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCityRF(title) {
    var dropDownValue = 'Apple';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: rLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: rBoxDecorationStyle,
            height: 60.0,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                iconSize: 50.0,
                isDense: false,
                dropdownColor: Color.fromARGB(100, 149, 149, 149),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                focusColor: Colors.white,
                value: dropDownValue,
                itemHeight: 57,
                items: items.map((String res) {
                  return DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: res,
                      child: Text(res,
                          style: const TextStyle(
                            color: Colors.grey,
                          )));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropDownValue = newValue.toString();
                  });
                },
              ),
            )),
      ],
    );
  }

  Widget _buildTextTF(String title, String textType, mode, placeHolder, icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: rLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: rBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: getTextType(textType),
            readOnly: mode.toString().contains("read"),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                getIcon(icon),
                color: Colors.white,
              ),
              hintText: placeHolder,
              hintStyle: rHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleTF(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: rLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: rBoxDecorationStyle,
          height: 60.0,
          child: Text(
            title,
            style: rLabelStyle,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Color(0xFF73AEF5),
                      // Color(0xFF61A4F1),
                      // Color(0xFF478DE0),
                      // Color(0xFF398AE5),

                      Color(0xDD000000),
                      Color(0xDD000000),
                      Color(0xDD000000),
                      Color(0xDD000000),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getRandomWidgetArray(jsonString),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
