import 'package:flutter/material.dart';
import 'package:flutter_dev/model/form_model.dart';

class GetTextField extends StatefulWidget {
  const GetTextField({Key key}) : super(key: key);

  @override
  _GetTextFieldState createState() => _GetTextFieldState();
}

class _GetTextFieldState extends State<GetTextField> {
  _GetTextFieldState({Key key}) : super();

  var textField = [10];

  Widget getTextWidgets() {
    List<Widget> list = [];
    if (textField.isNotEmpty) {
      list = [];
      for (var i = 0; i < textField.length; i++) {
        list.add(
          CustomTextFiled(),
        );
        list.add(
          const SizedBox(height: 35),
        );
      }
    }
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[getTextWidgets()],
        ),
      ),
    );
  }
}

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({Key key}) : super(key: key);

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  _CustomTextFiledState() : super();
  @override
  Widget build(BuildContext context) {
    return const Text("2");
  }
}
