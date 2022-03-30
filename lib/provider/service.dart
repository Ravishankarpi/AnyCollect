import 'package:flutter/material.dart';
import 'package:flutter_dev/model/formJson.dart';
import 'package:flutter_dev/model/form_model.dart';
import 'package:flutter_dev/model/ids.dart';
import 'package:flutter_dev/model/request_response.dart';
import 'package:flutter_dev/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseService extends ChangeNotifier {
  TextFieldModel txtField = TextFieldModel();
  DropDownModel dropField = DropDownModel();
  DateTimeModel dateField = DateTimeModel();
  Album albem = Album();
  List<TextFieldModel> lstTxtField = [];

  addListItem() {
    notifyListeners();
  }

  addDropDown(newValue) {
    notifyListeners();
  }

  addTextField() {
    notifyListeners();
  }

  addDateTime() {
    notifyListeners();
  }

  updateListItem() {
    notifyListeners();
  }

  dummyJson() {
    String JsonString =
        "{\n \"Category\": [\n  {\n   \"name\": \"sopt-20\",\n   \"sopt-20\": [\n    {\n     \"name\": \"unAuthorizedItems\",\n     \"unAuthorizedItems\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"commands\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"No unauthorized items found. \"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"toolsFixtureAndEquipment\",\n     \"toolsFixtureAndEquipment\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"No unauthorized items found. \"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"workInProcessInventory\",\n     \"workInProcessInventory\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"No unauthorized items found. \"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"personalItems\",\n     \"personalItems\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"No unauthorized items found. \"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    }\n   ]\n  },\n  {\n   \"name\": \"setInOrder-25\",\n   \"setInOrder-25\": [\n    {\n     \"name\": \"toolsAndFixtureStorage\",\n     \"toolsAndFixtureStorage\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"commands\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"No identified locations for tools and fixtures.  No visual controls are present.  Three or more tools\/fixtures not currently in use are not stored properly.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"Identified locations setup for all but one or two tools or fixtures.  One or two tools\/fixtures not currently in use are not stored properly.\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"All tools and fixtures assigned to station have\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"workInProcessStorageAndArrangement\",\n     \"workInProcessStorageAndArrangement\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Three or more material storage locations have mixed materials or other misc items in their tub or location. Three or more materials stored without dedicated locations.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"One or two material storage locations have have items that are not the identified material in them.   One or two materials stored without dedicated locations.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"All material in workplace is managed, controlled and clearly identified. Materials are easily accessible to operators.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"storageOfCleanningEquipment\",\n     \"storageOfCleanningEquipment\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Three or more pieces of cleaning equipment missing from boards or not stored on boards.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"One or two pieces of cleaning equipment missing from boards or not stored on boards.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"All cleaning equipment is present and stored on the cleaning boards.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"Non-ConformingMaterials\",\n     \"Non-ConformingMaterials\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Three or more non-conforming materials not properly tagged or identified.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"One or two non-conforming materials not properly tagged or identified.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"All non-conforming parts present are properly tagged or identified.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"organizationOfHorizontalSurfaces\",\n     \"organizationOfHorizontalSurfaces\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Surfaces that are for storing items are not lableled or organized.  Multiple extraneous items are present.  Catchalls exist.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"Surfaces that are for storing items are legibly lableled and organized.  No extraneous items are present.  No catchalls.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    }\n   ]\n  },\n  {\n   \"name\": \"shine-15\",\n   \"shine-15\": [\n    {\n     \"name\": \"areaCleaningAndCondition\",\n     \"areaCleaningAndCondition\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"commands\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Any personal trash on horizontal surfaces, floors or under conveyors.  Production supplies on the floor or under conveyors. No evidence of cleaning schedule adherence.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"No trash present.  No personal trash or production supplies on the floor. Cleaning schedule posted & weekly cleaning check sheet up to date.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"locationLabelingIndentificationMarketing\",\n     \"locationLabelingIndentificationMarketing\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Three or more labels illegible. Three or more item location markings missing or excessively worn.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"One or two labels illegible.  One or two item location markings in poor shape.\"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"All labels clearly legible.  Existing item location markings in good shape.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    },\n    {\n     \"name\": \"equipmentConditionAndCleanliness\",\n     \"equipmentConditionAndCleanliness\": [\n      {\n       \"Poor\": {\n        \"Description\": \"Equipment is unusable or does not function as intended with no maintenance ticket submitted to repair.  Equipment cleanliness is poor with no apparent attempt to keep clean.\"\n       }\n      },\n      {\n       \"Average\": {\n        \"Description\": \"Elements of equipment damaged and in need of repair, with no maintenance ticket submitted or action taken to repair. \"\n       }\n      },\n      {\n       \"Perfect\": {\n        \"Description\": \"Equipment cleaned & maintained in optimum condition. PM schedules (where applicable) in place and adhered to.  Equipment may be in need of repair if Maint ticket has been submitted or actions taken to repair.\"\n       }\n      },\n      {\n       \"score\": 0\n      },\n      {\n       \"comments\": 1\n      }\n     ]\n    }\n   ]\n  },\n  {\n   \"name\": \"Standardize & Sustain-20\",\n   \"Standardize & Sustain-20\": [\n    {\n     \"name\": \"Document Storage & Control\",\n     \"Document Storage & Control\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Obsolete and\/or unofficial documents present.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": null\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"All posted documents are approved for use and have the correct revision.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Employee Training\",\n     \"Employee Training\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"0 or 1 of the employees selected have the correct jobs assigned and are trained within the Training Tracker.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"2 of 3 of employees have correct jobs assigned and are trained within the Training Tracker.\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"3 of 3 of employees selected have correct jobs assigned and are trained within the Training Tracker.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Adherence to calibration and cleaning Schedules\",\n     \"Adherence to calibration and cleaning Schedules\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Three or more items out of calibration or illegible calibration tags. No adherence to cleaning schedules in the past two weeks.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"One or two items out of calibration or illegible calibration tags. One out of two weeks adherence to cleaning schedules in the past two weeks.\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"Zero items out of calibration or illegible calibration tags. Full adherence to cleaning schedules in the past two weeks.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Audits & Improvements\",\n     \"Audits & Improvements\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": \"Launching Program\",\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Last 6S audit not posted, No evidence of planning or actions taken on past audits findings. Scores for the last two audits are less than 60.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": \"Previous 6S audit and action item list is posted. Scores over the last two audits fall between 60 and 80.\"\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"Previous 6S audit and action item list is posted. Scores over the past two audits 80+. \"\n        }\n       }\n      ]\n     }\n    }\n   ]\n  },\n  {\n   \"name\": \"Safety-20\",\n   \"Safety-20\": [\n    {\n     \"name\": \"Emergency Access & Equipment\",\n     \"Emergency Access & Equipment\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Emergency equipment not identified or blocked. Operator work area blocked with no easy access to evacuation routes. Emergency exit blocked.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": null\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"Access to all emergency equipment and pathways clear.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Personal Safety\",\n     \"Personal Safety\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Required Personal Protective Equipment not being used. Secondary container missing proper labeling.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": null\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"All required Personal Protective Equipment being used and all secondary containers are labeled.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Equipment Safety\",\n     \"Equipment Safety\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Machine safety equipment and\/or guarding on machine or safety devices absent or not being used properly. No crane inspection program exists or logs are not up to date.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": null\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"Machine safety equipment and guarding in sound condition and in use. Cranes inspected daily, electrical panels closed, and no permanent extension cords.\"\n        }\n       }\n      ]\n     }\n    },\n    {\n     \"name\": \"Material Storage\",\n     \"Material Storage\": {\n      \"type\": \"dropDown\",\n      \"scroe\": null,\n      \"comments\": null,\n      \"values\": [\n       {\n        \"Poor\": {\n         \"Description\": \"Pallets stacked in unsafe manner or on top of tubs. Pallets pushed into backing or are hanging over rack beams beyond stated limits. Top shelf items are not banded. Rack beams, uprights or backing damaged.\"\n        }\n       },\n       {\n        \"Average\": {\n         \"Description\": null\n        }\n       },\n       {\n        \"Perfect\": {\n         \"Description\": \"All material stored in a safe manner.\"\n        }\n       }\n      ]\n     }\n    }\n   ]\n  }\n ]\n}";
    final body = json.decode(JsonString);
    return body;
  }

  setValueHere() {
    List<JsonPlaceholder> placeHolder = [];
    fetchAlbum().then((value) {
      albem = Album.fromJson(value);
      notifyListeners();
    }).catchError((ex) {
      print("error:" + ex);
    });
  }

  Future<dynamic> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<AnyCollect> buildAnyCollectJson(String formJsonString) async {
    return AnyCollect.fromJson(JsonStringToObjectConverter(formJsonString));
  }

  Future<RequestResponse> getAssignedFormsByUserId(
      RequestResponse request) async {
    request.userId;
    //dummy
    return RequestResponse.fromJson(
        JsonStringToObjectConverter(assignedFormDataString));
  }

  Future<RequestResponse> getSelectedFormsCollectionByFormAndUserID(
      RequestResponse request) async {
    //dummy
    return RequestResponse.fromJson(
        JsonStringToObjectConverter(selectedFormCollectionString));
  }

    Future<AnyCollect> getSelectedFormByDataCollectionId(
      FormCollection request) async {
    //dummy
    return AnyCollect.fromJson(
        JsonStringToObjectConverter(formJsonString));
  }

  static Future fetchEmployeeDetails() async {
    return await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  

  IndexOfJsonId findIndex(AnyCollect anyCollect, JsonId jsonid) {
    // ignore: unrelated_type_equality_checks
    int secId;
    int grpId;
    int fieId;
    int optId;
    secId = anyCollect.anyCollectForms[0].formData.sections
        .indexWhere((element) => element.sectionId == jsonid.sectionId);
    grpId = anyCollect.anyCollectForms[0].formData.sections[secId].groups
        .indexWhere((element) => element.groupId == jsonid.groupId);
    fieId = anyCollect
        .anyCollectForms[0].formData.sections[secId].groups[grpId].groupFields
        .indexWhere((element) => element.id == jsonid.fieldId);
    // ignore: prefer_null_aware_operators
    optId = anyCollect.anyCollectForms[0].formData.sections[secId].groups[grpId]
                .groupFields[fieId].options !=
            null
        ? anyCollect.anyCollectForms[0].formData.sections[secId].groups[grpId]
            .groupFields[fieId].options
            .indexWhere((element) => element.id == jsonid.value)
        : null;
    return IndexOfJsonId(
        sectionIds: secId, groupsIds: grpId, fieldIds: fieId, optionIds: optId);
  }

  GroupFields getObject(AnyCollect anyCollect, IndexOfJsonId indexOfJsonId) {
    return anyCollect
        .anyCollectForms[0]
        .formData
        .sections[indexOfJsonId.sectionIds]
        .groups[indexOfJsonId.groupsIds]
        .groupFields[indexOfJsonId.fieldIds];
  }
}

JsonStringToObjectConverter(JsonString) {
  final body = json.decode(JsonString);
  return body;
}
