import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'dart:convert';

class WidgetsForms extends StatefulWidget {
  const WidgetsForms ({ Key key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<WidgetsForms> {

  DropdownonChangeModel dropdownononChangeJS;
  int i;
    onChangeDropItem (fieldId, value ){
     i = dropdownononChangeJS.dropDownOnChange.indexWhere((element)=> element.fieldId == fieldId);
    setState(() {
      dropdownononChangeJS.dropDownOnChange[i].value = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        dropdownononChangeJS = DropdownonChangeModel.fromJson(JsonStringToObjectConverter(dropdownFieldJson));
  }
    JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  queryData.size.width;
  queryData.size.height;
   return Scaffold( 
     body: SingleChildScrollView(
       child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                Container(
                  width: queryData.size.width - 30,
                  height: 40,
                  decoration: rBoxDecorationStyles,
                  child: Text("Form Name", textAlign: TextAlign.justify,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                ),
                SizedBox(height: 5,),
                Container(
              decoration: rBoxDecorationStyles,
              width: queryData.size.width - 30,
              // width: MediaQuery.of(context).size.width * 0.7,
              child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment(-0.85, -0.5),
                        child:SizedBox(
                          child: Text("Sort-20", style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 20,),
                      buildTextField(Icons.person, "Username", queryData),
                      SizedBox(height: 20,),
                      buildTextField(Icons.class_, "Class", queryData),
                      SizedBox(height: 20,),
                      buildTextField(Icons.donut_large_rounded, "Major", queryData),
                      SizedBox(height: 20,),
                      buildTextField(Icons.email, "Email", queryData),
                      SizedBox(height: 20,),
                      buildDropDown(Icons.email, "Email", queryData, onChangeDropItem, dropdownononChangeJS, 0),
                      SizedBox(height: 20,),
                      buildDropDown(Icons.email, "Email", queryData, onChangeDropItem, dropdownononChangeJS, 1),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Submit"),
                      ),
                    ]),
            ),
              ],
            )
          ),
     ),
   );
  }
}


  SizedBox buildTextField(icon, name, queryData) {
    
    return SizedBox(
      width: queryData.size.width - 100,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
  SizedBox buildDropDown(icon, name, queryData,Function onChangeDropItem, DropdownonChangeModel dropdownononChangeJS, index ) {
    int _value = 0;
    return SizedBox(
      width: queryData.size.width - 100,
                child: DropdownButton(
                  menuMaxHeight : 150,
                  elevation:8,
              value: dropdownononChangeJS?.dropDownOnChange[index]?.value,
              items: buildDropDownItem() != null ? buildDropDownItem() : [],
              onChanged: (value) {
                onChangeDropItem(index, value);
              }),

      // child: TextField(
      //   decoration: InputDecoration(
      //     prefixIcon: Icon(icon),
      //     labelText: name,
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(0),
      //     ),
      //   ),
      // ),
    );
  }
  
  List<DropdownMenuItem> buildDropDownItem(){
    List<DropdownMenuItem> dropdownMenuItem = [];
    List<String> _list = ["None","Ravi","Divya","Jai"];
    _list.asMap().forEach((key, value) {
      dropdownMenuItem.add(new DropdownMenuItem(child: Text(value),value: key,));
    });
    return dropdownMenuItem;
  }

class DropdownonChangeModel {
  List<DropDownOnChange> dropDownOnChange;

  DropdownonChangeModel({this.dropDownOnChange});

  DropdownonChangeModel.fromJson(Map<String, dynamic> json) {
    if (json['dropDownOnChange'] != null) {
      dropDownOnChange = <DropDownOnChange>[];
      json['dropDownOnChange'].forEach((v) {
        dropDownOnChange.add(new DropDownOnChange.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dropDownOnChange != null) {
      data['dropDownOnChange'] =
          this.dropDownOnChange.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DropDownOnChange {
  int fieldId;
  int value;

  DropDownOnChange({this.fieldId, this.value});

  DropDownOnChange.fromJson(Map<String, dynamic> json) {
    fieldId = json['fieldId'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldId'] = this.fieldId;
    data['value'] = this.value;
    return data;
  }
}
  