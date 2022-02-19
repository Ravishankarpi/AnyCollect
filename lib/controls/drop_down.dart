import 'package:flutter/material.dart';

import 'package:flutter_dev/utils/ExpandedListAnimationWidget.dart';
import 'package:flutter_dev/utils/Scrollbar.dart';

class DropDowns extends StatefulWidget {
  BuildContext context;
  final String title;
  final int groupValue;
  final bool isStrechedDropDown;
  final Function test1;
  final List<String> _list;

  DropDowns(
    this.context,
    this.title,
    this.groupValue,
    this.isStrechedDropDown,
    this.test1,
    this._list,
  ) : super();

  @override
  _State createState() => _State();
}

class _State extends State<DropDowns> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 45,
              minWidth: double.infinity,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      widget.test1(true, null, null);
                      //widget.isStrechedDropDown = !isStrechedDropDown;
                    },
                    child: Icon(widget.isStrechedDropDown
                        ? Icons.arrow_upward
                        : Icons.arrow_downward))
              ],
            )),
        ExpandedSection(
          expand: widget.isStrechedDropDown,
          height: 200,
          child: MyScrollbar(
            builder: (context, scrollController2) => ListView.builder(
                padding: EdgeInsets.all(0),
                controller: scrollController2,
                shrinkWrap: true,
                itemCount: widget._list.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                      title: Text(widget._list.elementAt(index)),
                      value: index,
                      groupValue: widget.groupValue,
                      onChanged: (val) {
                        widget.test1(false, val, index);
                        // setState(() {
                        //   groupValue = val;
                        //   title = widget._list.elementAt(index);
                        // });
                      });
                }),
          ),
        )
      ],
    ));
  }
}
