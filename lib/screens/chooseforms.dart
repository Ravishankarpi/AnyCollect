import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dev/controls/FadeRouteBuilder.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/request_response.dart';
import 'package:flutter_dev/provider/service.dart';
import 'package:flutter_dev/screens/drawer.dart';
import 'package:flutter_dev/screens/dynamicForm.dart';
import 'package:flutter_dev/screens/formdetails.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rect_getter/rect_getter.dart';

class ChooseForms extends StatefulWidget {
  Function callBack;
  ChooseForms({Key key, this.callBack}) : super(key: key);

  @override
  _ChooseFormsState createState() => _ChooseFormsState();
}

class _ChooseFormsState extends State<ChooseForms> {
    GlobalKey rectGetterKey = RectGetter.createGlobalKey(); //<--Create a key
  Rect rect;  

  Future<AnyCollect> anyCollectJsonString;
  final BaseService _bs = BaseService();
  RequestResponse request = RequestResponse();

// dummy data
  RequestResponse tempFormArr = RequestResponse();

  AnyCollectForms _anyCollectForms;

  // ignore: missing_return
  AnyCollectForms onPressTile(int index, RequestResponse response) {
    // _anyCollectForms = tempFormArr[index];


    request = response;
    request.formId = response.formCollection[index].formId; //Selected form ID
    request.label = response.formCollection[index].label; // Selected form label
    response.userId; // user ID

    widget.callBack(index, response);


    //  Navigator.of(context).push(MaterialPageRoute(
    //      builder: (context) => FormDetials(request, index)));

    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
     Navigator.of(context).push(FadeRouteBuilder(page: FormDetials(request, index)));

    // Navigator.of(context).push(_createRoute(request, index));

    //  Navigator.of(context).push(MaterialPageRoute(
    //      builder: (context) => DynamiceForm(anyCollectForms: _anyCollectForms)));

    // DynamiceForm(anyCollectForms: _anyCollectForms);

  }
  

  Route _createRoute(request, index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FormDetials(request, index),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 5.0);
      const end = Offset.zero;
      const curve = Curves.bounceOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        // transformHitTests  : false,
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


  int _page = 0;
  PageController _c;

  @override
  void initState() {
    // anyCollectJsonString =
    //     AnyCollect.fromJson(JsonStringToObjectConverter(formJsonString));

     getAssginedFormCollection();
    _c = PageController(
      initialPage: _page,
    );
    super.initState();
  }

  getAssginedFormCollection() async {
    // int test;
    //dummy
    request.userId = 1;
    //below string comes from api call (dummpy call)
    await _bs.getAssignedFormsByUserId(request).then((res) => {
        setState(() {
          tempFormArr.formCollection = res.formCollection;
          tempFormArr.userId = request.userId;
        }),
        });

  }
  

  List<Widget> buildTiles(MediaQueryData queryData) {
    List<Widget> data = [];
    if(tempFormArr.formCollection != null){
       tempFormArr.formCollection.asMap().forEach((key, value) {
      //  if(data.length == 0)
      data.add(SizedBox(
        height: 10,
      ));
      data.add(
        GestureDetector(
          onTap: () => {
            onPressTile(key, tempFormArr),
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
                      child: Text(value.label,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4c4c4c)),
                          )),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            height: 25,
                            width: 70,
                            // color: Color.fromARGB(255, 0, 119, 255),
                            alignment: Alignment.center,
                            //  padding: EdgeInsets.only(left: 5),
                            child: Text(
                              key == 0 ? "Internal" : "External",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            decoration: rTileTagDecorationStyles,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () => {},
                          child: Container(
                            height: 25,
                            width: 50,
                            //  padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Audit",
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              )),
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

    }
   
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

  JsonStringToObjectConverter(JsonString) {
    final body = json.decode(JsonString);
    return body;
  }

  onPressBottonNavication(index) {
    setState(() {
      this._page = index;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DynamiceForm()));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      drawer: buildDrawer(true),
      backgroundColor: Color.fromRGBO(242, 242, 243, 5),
      // backgroundColor: const Color(0xFF2c3c84),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3c84),
        title: Text(
          'Assigned Forms',
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(10),
          child: Container(
            color: Colors.transparent,
            // color: const Color.fromARGB(255, 255, 255, 255),
            child: Container(
              padding: EdgeInsets.only(top: 0),
              child: Column(children: buildTiles(queryData)),
            ),
          ),
        ),
      ),

      // bottomNavigationBar:  BottomNavigator(Index: 1),
    );
  }
}


