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
final rLabelStyles = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final rBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 0, 132, 255),
      blurRadius: 6.0,
      spreadRadius : 2.0,
      offset: Offset(0, 1),
    ),
  ],
);
final rBoxDecorationStyles = BoxDecoration(
  color: Color.fromARGB(255, 237, 245, 251),
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 0, 132, 255),
      blurRadius: 6.0,
      spreadRadius : 2.0,
      offset: Offset(0, 1),
    ),
  ],
);

final rTileBoxDecorationStyles = BoxDecoration(
  color: Color.fromARGB(255, 255, 255, 255),
  borderRadius: BorderRadius.circular(3),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 194, 194, 194),
      blurRadius: 6.0,
      spreadRadius : 2.0,
      offset: Offset(0, 1),
    ),
  ],
);
final rTileTagDecorationStyles = BoxDecoration(
  color: Color.fromARGB(141, 3, 133, 255),
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 255, 255, 255),
      // blurRadius: 6.0,
      // spreadRadius : 2.0,
      // offset: Offset(0, 1),
    ),
  ],
);
final attachmentBoxDecorationStyles = BoxDecoration(
  color: Color.fromARGB(255, 237, 245, 251),
  borderRadius: BorderRadius.circular(5),
  boxShadow: [
    BoxShadow(
      color: Color.fromARGB(255, 0, 132, 255),
      blurRadius: 6.0,
      spreadRadius : 2.0,
      offset: Offset(0, 1),
    ),
  ],
);
final dummyJson = "{\"success\":true,\"data\":[{\"id\":161,\"product_name\":\"Apple\",\"user_id\":72,\"quantity\":1,\"price\":96,\"custom_fields\":[]},{\"id\":162,\"product_name\":\"Orange\",\"user_id\":72,\"quantity\":2,\"price\":85,\"custom_fields\":[]}],\"message\":\"Cartsretrievedsuccessfully\"}";


final jsonObjectString =
    "{\n \"category\": [\n  {\n   \"name\": \"sopt-20\",\n   \"categoryData\" : {\n      \"categoryValues\" : [\n    {\n     \"name\": \"unAuthorizedItems\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    },\n    {\n     \"name\": \"toolsFixtureAndEquipment\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    }\n   ]}\n      \n  },\n  {\n   \"name\": \"setInOrder-25\",\n   \"categoryData\" : {\n      \"categoryValues\" : [\n    {\n     \"name\": \"areaCleaningAndCondition\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    },\n    {\n     \"name\": \"locationLabelingIndentificationMarketing\",\n     \"subCategoryData\": {\n         \"subCategoryValues\" : [\n             {\"type\": \"dropDown\",\n        \"typeValues\": [\n       {\n           \"name\" : \"Poor\",\n           \"value\" : \"Poor\",\n            \"Description\": \"Unauthorized items made from production materials.   Unauthorized lifting device present.                              Unauthorized or modified blow off nozzles.\"\n       },\n       {\n            \"name\" : \"Average\",\n            \"value\" : \"Average\",\n            \"Description\": \"Unauthorized, uncertified, homemade or modified items are in use.\"\n       },\n       {\n            \"name\" : \"Perfect\",\n            \"value\" : \"Perfect\",\n            \"Description\": \"No unauthorized items found. \"\n       }\n      ]},\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Score\",\n                \"placeHolder\" : \"Your Score\",\n                \"mode\" : \"readOnly\",\n                \"textType\" : \"Text\"\n            }\n          \n      },\n      {\n          \"type\": \"TextBox\",\n          \"typeValues\": \n            {\n                \"name\" : \"Comments\",\n                \"placeHolder\" : \"Your Comments\",\n                \"mode\" : \"editable\",\n                \"textType\" : \"Text\"\n            }\n          \n      }\n             ]\n      \n     }\n    }\n   ]}\n      \n  }\n   \n ]\n}";

final String attachmentJsonStrings = "{\"attachments\":[{\"fileId\":1,\"fileName\":\"image1.jpg\",\"base64String\":\"image64{1}\"},{\"fileId\":2,\"fileName\":\"image2.jpg\",\"base64String\":\"image64{2}\"},{\"fileId\":3,\"fileName\":\"image3.jpg\",\"base64String\":\"image64{3}\"}]}";

final dropdownFieldJson = "{\"dropDownOnChange\":[{\"fieldId\":0,\"value\":1},{\"fieldId\":1,\"value\":2},{\"fieldId\":2,\"value\":3}]}";

final String formJsonString = "{\"AnyCollectForms\":[{\"label\":\"6sSoreCard\",\"formId\":\"6sSoreCard\",\"formData\":{\"sections\":[{\"sectionName\":\"SOPT-20\",\"sectionId\":\"SOPT_20\",\"sortOrder\":1,\"fields\":[{\"label\":\"CommonScore\",\"type\":\"calculated\",\"id\":\"totalscoreid\",\"actionDetails\":{\"calculationType\":\"Average\",\"column\":\"scoreId\"}}],\"groups\":[{\"groupName\":\"unAuthorizedItems\",\"groupId\":\"unAuthorizedItems\",\"groupFields\":[{\"label\":\"unAuthorizedItems\",\"Id\":\"unAuthorizedItems\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Unauthorizeditemsmadefromproductionmaterials.Unauthorizedliftingdevicepresent.Unauthorizedormodifiedblowoffnozzles.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Unauthorized,uncertified,homemadeormodifieditemsareinuse.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Nounauthorizeditemsfound.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"unAuthorizedItems\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"tools,fixtures&equipment\",\"groupId\":\"tools,fixtures&equipment\",\"groupFields\":[{\"label\":\"tools,fixtures&equipment\",\"Id\":\"tools,fixtures&equipment\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormoreunassignedtools/fixtures/equipmentarepresentinanyonestation.Threeormoreassignedtools/fixtures/equipmentaremissingfromanyonestation.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwounassignedtools/fixtures/equipmentarepresentinanyonestation.Oneortworequiredtools/fixtures/equipmentaremissingfromanyonestation.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Alltools/fixtures/equipmentinimmediateworkareaareneededweekly.Noassignedtools/fixtures/equipmentaremissing.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"tools,fixtures&equipment\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"WorkInProcessInventory&Supplies\",\"groupId\":\"WorkInProcessInventory&Supplies\",\"groupFields\":[{\"label\":\"WorkInProcessInventory&Supplies\",\"Id\":\"WorkInProcessInventory&Supplies\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormoreunnecessarysupplies,parts,notrequiredforcurrentworkarepresentinworkarea.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwounnecessaryinventorysupplies,extraneouspartsnotrequiredforcurrentworkpresentinworkarea.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Onlycurrentlyin-processorderinventory,properlylocatedinventory(Kanban)andin-usesupplies,arepresentinworkarea,properlylocatedandidentified.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"WorkInProcessInventory&Supplies\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"PersonalItems\",\"groupId\":\"PersonalItems\",\"groupFields\":[{\"label\":\"PersonalItems\",\"Id\":\"PersonalItems\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormorepersonalitemsoutsidedesignatedareasinanyonestation.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwopersonalitemsoutsidedesignatedareasinanyonestation.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Personalitemskeptindesignatedareas.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"PersonalItems\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]}]},{\"sectionName\":\"SETINORDER-25\",\"sectionId\":\"SETINORDER-25\",\"sortOrder\":2,\"fields\":[{\"label\":\"CommonScore\",\"type\":\"calculated\",\"id\":\"totalscoreid\",\"actionDetails\":{\"calculationType\":\"Average\",\"column\":\"scoreId\"}}],\"groups\":[{\"groupName\":\"Tools&fixturestorage\",\"groupId\":\"Tools&fixturestorage\",\"groupFields\":[{\"label\":\"Tools&fixturestorage\",\"Id\":\"Tools&fixturestorage\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Noidentifiedlocationsfortoolsandfixtures.Novisualcontrolsarepresent.Threeormoretools/fixturesnotcurrentlyinusearenotstoredproperly.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Identifiedlocationssetupforallbutoneortwotoolsorfixtures.Oneortwotools/fixturesnotcurrentlyinusearenotstoredproperly.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Alltoolsandfixturesassignedtostationhaveidentifiedlocations.Toolsandfixturesareeasilyaccessibletooperators.Locationsarefullyutilizedwhentoolsarestored.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Tools&fixturestorage\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Workinprocessstorage&arrangement\",\"groupId\":\"Workinprocessstorage&arrangement\",\"groupFields\":[{\"label\":\"Workinprocessstorage&arrangement\",\"Id\":\"Workinprocessstorage&arrangement\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormorematerialstoragelocationshavemixedmaterialsorothermiscitemsintheirtuborlocation.Threeormorematerialsstoredwithoutdedicatedlocations.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwomaterialstoragelocationshavehaveitemsthatarenottheidentifiedmaterialinthem.Oneortwomaterialsstoredwithoutdedicatedlocations.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Allmaterialinworkplaceismanaged,controlledandclearlyidentified.Materialsareeasilyaccessibletooperators.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Workinprocessstorage&arrangement\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"StorageOfCleaningEquipment\",\"groupId\":\"StorageOfCleaningEquipment\",\"groupFields\":[{\"label\":\"StorageOfCleaningEquipment\",\"Id\":\"StorageOfCleaningEquipment\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormorepiecesofcleaningequipmentmissingfromboardsornotstoredonboards.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwopiecesofcleaningequipmentmissingfromboardsornotstoredonboards.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Allcleaningequipmentispresentandstoredonthecleaningboards.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"StorageOfCleaningEquipment\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Non-ConformingMaterials\",\"groupId\":\"Non-ConformingMaterials\",\"groupFields\":[{\"label\":\"Non-ConformingMaterials\",\"Id\":\"Non-ConformingMaterials\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormorenon-conformingmaterialsnotproperlytaggedoridentified.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwonon-conformingmaterialsnotproperlytaggedoridentified.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Allnon-conformingpartspresentareproperlytaggedoridentified.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Non-ConformingMaterials\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"OrganizationOfHorizontalSurfaces\",\"groupId\":\"OrganizationOfHorizontalSurfaces\",\"groupFields\":[{\"label\":\"OrganizationOfHorizontalSurfaces\",\"Id\":\"OrganizationOfHorizontalSurfaces\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Surfacesthatareforstoringitemsarenotlableledororganized.Multipleextraneousitemsarepresent.Catchallsexist\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Surfacesthatareforstoringitemsarelegiblylableledandorganized.Noextraneousitemsarepresent.Nocatchalls.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"OrganizationOfHorizontalSurfaces\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]}]},{\"sectionName\":\"SHINE-15\",\"sectionId\":\"SHINE-15\",\"sortOrder\":3,\"fields\":[{\"label\":\"CommonScore\",\"type\":\"calculated\",\"id\":\"totalscoreid\",\"actionDetails\":{\"calculationType\":\"Average\",\"column\":\"scoreId\"}}],\"groups\":[{\"groupName\":\"Areacleaning&condition\",\"groupId\":\"Areacleaning&condition\",\"groupFields\":[{\"label\":\"Areacleaning&condition\",\"Id\":\"Areacleaning&condition\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Anypersonaltrashonhorizontalsurfaces,floorsorunderconveyors.Productionsuppliesonthefloororunderconveyors.Noevidenceofcleaningscheduleadherence.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Notrashpresent.Nopersonaltrashorproductionsuppliesonthefloor.Cleaningscheduleposted&weeklycleaningchecksheetuptodate.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Areacleaning&condition\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Locationlabeling/identification&itemlocationmarking\",\"groupId\":\"Locationlabeling/identification&itemlocationmarking\",\"groupFields\":[{\"label\":\"Locationlabeling/identification&itemlocationmarking\",\"Id\":\"Locationlabeling/identification&itemlocationmarking\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormorelabelsillegible.Threeormoreitemlocationmarkingsmissingorexcessivelyworn.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwolabelsillegible.Oneortwoitemlocationmarkingsinpoorshape.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Alllabelsclearlylegible.Existingitemlocationmarkingsingoodshape.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Locationlabeling/identification&itemlocationmarking\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Equipmentcondition&cleanliness\",\"groupId\":\"Equipmentcondition&cleanliness\",\"groupFields\":[{\"label\":\"Equipmentcondition&cleanliness\",\"Id\":\"Equipmentcondition&cleanliness\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Equipmentisunusableordoesnotfunctionasintendedwithnomaintenanceticketsubmittedtorepair.Equipmentcleanlinessispoorwithnoapparentattempttokeepclean.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Elementsofequipmentdamagedandinneedofrepair,withnomaintenanceticketsubmittedoractiontakentorepair.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Equipmentcleaned&maintainedinoptimumcondition.PMschedules(whereapplicable)inplaceandadheredto.EquipmentmaybeinneedofrepairifMainttickethasbeensubmittedoractionstakentorepair.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Equipmentcondition&cleanliness\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]}]},{\"sectionName\":\"STANDARDIZE&SUSTAIN-20\",\"sectionId\":\"STANDARDIZE&SUSTAIN-20\",\"sortOrder\":4,\"fields\":[{\"label\":\"CommonScore\",\"type\":\"calculated\",\"id\":\"totalscoreid\",\"actionDetails\":{\"calculationType\":\"Average\",\"column\":\"scoreId\"}}],\"groups\":[{\"groupName\":\"Documentstorage&control\",\"groupId\":\"Documentstorage&control\",\"groupFields\":[{\"label\":\"Documentstorage&control\",\"Id\":\"Documentstorage&control\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Obsoleteand/orunofficialdocumentspresent.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Identifiedlocationssetupforallbutoneortwotoolsorfixtures.Oneortwotools/fixturesnotcurrentlyinusearenotstoredproperly.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Allposteddocumentsareapprovedforuseandhavethecorrectrevision.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Documentstorage&control\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Employeetraining\",\"groupId\":\"Employeetraining\",\"groupFields\":[{\"label\":\"Employeetraining\",\"Id\":\"Employeetraining\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"0or1oftheemployeesselectedhavethecorrectjobsassignedandaretrainedwithintheTrainingTracker.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"2of3ofemployeeshavecorrectjobsassignedandaretrainedwithintheTrainingTracker.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"3of3ofemployeesselectedhavecorrectjobsassignedandaretrainedwithintheTrainingTracker.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Employeetraining\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Adherencetocalibrationandcleaningschedules\",\"groupId\":\"Adherencetocalibrationandcleaningschedules\",\"groupFields\":[{\"label\":\"Adherencetocalibrationandcleaningschedules\",\"Id\":\"Adherencetocalibrationandcleaningschedules\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Threeormoreitemsoutofcalibrationorillegiblecalibrationtags.Noadherencetocleaningschedulesinthepasttwoweeks.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Oneortwoitemsoutofcalibrationorillegiblecalibrationtags.Oneoutoftwoweeksadherencetocleaningschedulesinthepasttwoweeks.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Zeroitemsoutofcalibrationorillegiblecalibrationtags.Fulladherencetocleaningschedulesinthepasttwoweeks.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Adherencetocalibrationandcleaningschedules\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Audits&improvements\",\"groupId\":\"Audits&improvements\",\"groupFields\":[{\"label\":\"Audits&improvements\",\"Id\":\"Audits&improvements\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Last6Sauditnotposted,Noevidenceofplanningoractionstakenonpastauditsfindings.Scoresforthelasttwoauditsarelessthan60.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"Previous6Sauditandactionitemlistisposted.Scoresoverthelasttwoauditsfallbetween60and80.\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Previous6Sauditandactionitemlistisposted.Scoresoverthepasttwoaudits80+.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Audits&improvements\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]}]},{\"sectionName\":\"SAFETY-20\",\"sectionId\":\"SAFETY-20\",\"sortOrder\":5,\"fields\":[{\"label\":\"CommonScore\",\"type\":\"calculated\",\"id\":\"totalscoreid\",\"actionDetails\":{\"calculationType\":\"Average\",\"column\":\"scoreId\"}}],\"groups\":[{\"groupName\":\"Emergencyaccess&equipment\",\"groupId\":\"Emergencyaccess&equipment\",\"groupFields\":[{\"label\":\"Emergencyaccess&equipment\",\"Id\":\"Emergencyaccess&equipment\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Emergencyequipmentnotidentifiedorblocked.Operatorworkareablockedwithnoeasyaccesstoevacuationroutes.Emergencyexitblocked.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Accesstoallemergencyequipmentandpathwaysclear.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Emergencyaccess&equipment\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Personalsafety\",\"groupId\":\"Personalsafety\",\"groupFields\":[{\"label\":\"Personalsafety\",\"Id\":\"Personalsafety\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"RequiredPersonalProtectiveEquipmentnotbeingused.Secondarycontainermissingproperlabeling.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"AllrequiredPersonalProtectiveEquipmentbeingusedandallsecondarycontainersarelabeled.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Personalsafety\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Equipmentsafety\",\"groupId\":\"Equipmentsafety\",\"groupFields\":[{\"label\":\"Equipmentsafety\",\"Id\":\"Equipmentsafety\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Machinesafetyequipmentand/orguardingonmachineorsafetydevicesabsentornotbeingusedproperly.Nocraneinspectionprogramexistsorlogsarenotuptodate.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Machinesafetyequipmentandguardinginsoundconditionandinuse.Cranesinspecteddaily,electricalpanelsclosed,andnopermanentextensioncords.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Equipmentsafety\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]},{\"groupName\":\"Materialstorage\",\"groupId\":\"Materialstorage\",\"groupFields\":[{\"label\":\"Materialstorage\",\"Id\":\"Materialstorage\",\"type\":\"DropDown\",\"options\":[{\"Id\":1,\"text\":\"Poor\",\"value\":0,\"description\":\"Palletsstackedinunsafemannerorontopoftubs.Palletspushedintobackingorarehangingoverrackbeamsbeyondstatedlimits.Topshelfitemsarenotbanded.Rackbeams,uprightsorbackingdamaged.\"},{\"Id\":2,\"text\":\"Average\",\"value\":3,\"description\":\"\"},{\"Id\":3,\"text\":\"Perfect\",\"value\":5,\"description\":\"Allmaterialstoredinasafemanner.\"}],\"defaultValue\":1,\"isRequired\":\"true\"},{\"label\":\"score\",\"Id\":\"scoreId\",\"type\":\"calculated\",\"actionDetails\":{\"copyFromFieldId\":\"Materialstorage\",\"actionType\":\"copy\"},\"isRequired\":\"true\"},{\"label\":\"comments\",\"Id\":\"comments\",\"type\":\"textArea\",\"enableRichText\":\"true\",\"isRequired\":\"true\"},{\"label\":\"attachments\",\"Id\":\"attachmentId\",\"type\":\"\",\"fileFilter\":\"*\",\"isMulti\":\"true\",\"isRequired\":\"true\"}]}]}]}}]}";