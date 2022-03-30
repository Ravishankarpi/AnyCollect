import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: Center(
//         child: CupertinoButton(
//           onPressed: () {
//             showCupertinoModalPopup<void>(
//               context: context,
//               builder: (BuildContext context) => CupertinoActionSheet(
//                 title: const Text('Title'),
//                 message: const Text('Message'),
//                 actions: <CupertinoActionSheetAction>[
//                   CupertinoActionSheetAction(
//                     child: const Text('Action One'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   CupertinoActionSheetAction(
//                     child: const Text('Action Two'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   )
//                 ],
//               ),
//             );
//           },
//           child: const Text('CupertinoActionSheet'),
//         ),
//       ),
//     );
 
 
//   }
// }


buildCupertinaActionSheet(BuildContext context){
     return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('Title'),
                message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: const Text('Action One'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Action Two'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          
          },
          child: const Text('CupertinoActionSheet'),
        ),
      ),
    );
 
 
}