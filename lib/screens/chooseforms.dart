import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/controls/bottom_navigator.dart';
import 'package:flutter_dev/controls/label.dart';
import 'package:flutter_dev/controls/nav_drawer.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseForms extends StatefulWidget {
  const ChooseForms({Key key}) : super(key: key);

  @override
  _ChooseFormsState createState() => _ChooseFormsState();
}

class _ChooseFormsState extends State<ChooseForms> {
  List<AnyCollectForms> tempFormArr = [
    AnyCollectForms(label: "6's Score Card", formId: "6sSoreCard"),
    AnyCollectForms(label: "AnyCollect", formId: "AnyCollect"),
    AnyCollectForms(label: "AnyCollectForm 3", formId: "AnyCollectForm3"),
  ];
  AnyCollectForms _anyCollectForms;

  // ignore: missing_return
  AnyCollectForms onPressTile(int index) {
    _anyCollectForms = tempFormArr[index];

    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => DynamiceForm(anyCollectForms: _anyCollectForms)));
  }
  int _page = 0;
  PageController _c;

  @override
  void initState() {
     _c =   PageController(
      initialPage: _page,
    );
    super.initState();
  }
  
  List<Widget> buildTiles(MediaQueryData queryData){
    List<Widget> data = [];
           

           tempFormArr.asMap().forEach((key, value) {
            //  if(data.length == 0)
             data.add(SizedBox(height: 10,));
             data.add(
                GestureDetector(
                  onTap: () => {
                    onPressTile(key),
                  },
                  child: SizedBox(
                        height: 80,
                        // width: queryData.size.width / 1.1,
                        child: Align(
                          child: Container(
                            //  alignment: Alignment.bottomCenter,
                            height: 80,
                            width: queryData.size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 30, right: 10, top: 0, bottom: 0),
                                  child: Text(
                                    value.label,
                                    style: GoogleFonts.openSans(textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4c4c4c)),)
                                  ),
                                ),
                               
                               Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(width: 30,),
                                    GestureDetector(
                                      onTap: () => {

                                      },
                                      child: Container(
                                        height: 25,
                                        width: 70,
                                        // color: Color.fromARGB(255, 0, 119, 255),
                                        alignment: Alignment.center,
                                        //  padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          key == 0 ?"Internal" : "External",
                                          style: GoogleFonts.openSans(textStyle: TextStyle(
                                            color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,)
                                  ),
                                        ),
                                        decoration: rTileTagDecorationStyles,
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    GestureDetector(
                                      onTap: () => {},
                                      child: Container(
                                        height: 25,
                                        width: 50,
                                        //  padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Audit",
                                          style: GoogleFonts.openSans(textStyle: const TextStyle(
                                            color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,)
                                  ),
                                        ),
                                        alignment: Alignment.center,
                                        decoration: rTileTagDecorationStyles,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: rTileBoxDecorationStyles,
                          ),
                        ),
                      ),
                ),

             );
           });

// GridView(gridDelegate: "g",
// children: 
//   List.generate(tempFormArr.length, (index) {
//                 return Center(
//                   child:Text(""),

//                 );
//               }
//               ),
// );

  //  data.insert(0, Center(
  //     child: SizedBox(height: 10,)
  //   ));
  
  return data;
  }

   onPressBottonNavication(index){
    setState(() {
      this._page =  index;
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DynamiceForm()));
   }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        drawer: buildDrawer(true),
        backgroundColor: Color.fromRGBO(242,242,243, 5),
        // backgroundColor: const Color(0xFF2c3c84),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2c3c84),
          title: Text('Forms', style: GoogleFonts.openSans(textStyle: TextStyle(
                                            color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,),),
        ),),
        body: SingleChildScrollView(
          child: SafeArea(
            minimum : EdgeInsets.all(10),
            child: Container(
              color: Colors.transparent,
              // color: const Color.fromARGB(255, 255, 255, 255),
              child: Container(
                padding: EdgeInsets.only(top: 0),
                child: Column(
              
                  children: buildTiles(queryData)
                
                  
                ),
              ),
            ),
          ),
        ),
        
        // bottomNavigationBar:  BottomNavigator(Index: 1),
         
        
        );
  }
}
