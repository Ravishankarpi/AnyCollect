import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/constants.dart';

class DropDown extends StatelessWidget {
  final GlobalKey fbKey;
  final String attribute, labelText;
  final List<String> itemsList;

  DropDown({
    Key key,
    @required this.fbKey,
    this.attribute,
    this.labelText,
    this.itemsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: DropdownButton(
              value: itemsList,
              items: [
                DropdownMenuItem(
                  child: Text("First Item"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Third Item"), value: 3),
                DropdownMenuItem(child: Text("Fourth Item"), value: 4)
              ],
              onChanged: (value) {}),
        ),
      ],
    );
  }
}
