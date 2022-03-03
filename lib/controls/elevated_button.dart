

import 'package:flutter/material.dart';

ElevatedButton buildElevatedButton(String buttonName, Function onChangeElevation){
  return ElevatedButton(
                        onPressed: () {
                          onChangeElevation();
                        },
                        child: Text(buttonName),
                      );
}