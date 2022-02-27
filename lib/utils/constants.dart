import 'package:flutter/material.dart';

final rHintTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final rLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final rBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final rBoxDecorationStyles = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final dummyJson = "{\"success\":true,\"data\":[{\"id\":161,\"product_name\":\"Apple\",\"user_id\":72,\"quantity\":1,\"price\":96,\"custom_fields\":[]},{\"id\":162,\"product_name\":\"Orange\",\"user_id\":72,\"quantity\":2,\"price\":85,\"custom_fields\":[]}],\"message\":\"Cartsretrievedsuccessfully\"}";


final jsonObjectString =
    "{\n \"category\": [\n  {\n   \"name\": \"sopt-20\",\n   \"categoryData\" : {\n      \"categoryValues\" : [\n    {\n     \"name\": \"unAuthorizedItems\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    },\n    {\n     \"name\": \"toolsFixtureAndEquipment\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    }\n   ]}\n      \n  },\n  {\n   \"name\": \"setInOrder-25\",\n   \"categoryData\" : {\n      \"categoryValues\" : [\n    {\n     \"name\": \"areaCleaningAndCondition\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    },\n    {\n     \"name\": \"locationLabelingIndentificationMarketing\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    }\n   ]}\n      \n  }\n   \n ]\n}";

final dropdownFieldJson = "{\"dropDownOnChange\":[{\"fieldId\":0,\"value\":1},{\"fieldId\":1,\"value\":2},{\"fieldId\":2,\"value\":3}]}";