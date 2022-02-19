class TextFieldModel {
  String textColor;
  String fontSize;
  String fieldType;
  String dataType;
  int position;

  TextFieldModel(
      {this.textColor,
      this.fontSize,
      this.fieldType,
      this.dataType,
      this.position});

  TextFieldModel.fromJson(Map<String, dynamic> json) {
    textColor = json['TextColor'];
    fontSize = json['FontSize'];
    fieldType = json['FieldType'];
    dataType = json['DataType'];
    position = json['Position'];
  }
}

class DateTimeModel {
  String fieldType;
  String dataType;
  int position;
  DateTimeModel({
    this.fieldType,
    this.dataType,
    this.position,
  });

  DateTimeModel.fromJson(Map<String, dynamic> json) {
    fieldType = json['FieldType'];
    dataType = json['DataType'];
    position = json['Posistion'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['FieldType'] = fieldType;
    _data['DataType'] = dataType;
    _data['Posistion'] = position;
    return _data;
  }
}

class DropDownModel {
  String fieldType;
  String dataType;
  int position;
  DropDownModel({
    this.fieldType,
    this.dataType,
    this.position,
  });

  DropDownModel.fromJson(Map<String, dynamic> json) {
    fieldType = json['FieldType'];
    dataType = json['DataType'];
    position = json['Position '];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['FieldType'] = fieldType;
    _data['DataType'] = dataType;
    _data['Position '] = position;
    return _data;
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    this.userId,
    this.id,
    this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] ?? "",
      id: json['id'] ?? "",
      title: json['title'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class Albums {
  final int userId;
  final int id;
  final String title;

  Albums({
    this.userId,
    this.id,
    this.title,
  });

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      userId: json['userId'] ?? "",
      id: json['id'] ?? "",
      title: json['title'] ?? "",
    );
  }
}

class JsonPlaceholder {
  int userId;
  int id;
  String title;

  JsonPlaceholder({this.userId, this.id, this.title});

  factory JsonPlaceholder.fromJson(Map<String, dynamic> json) {
    return JsonPlaceholder(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class AutoGenerate {
  AutoGenerate({
    this.category,
  });
  // ignore: non_constant_identifier_names
  List<Category> category;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    category =
        List.from(json['category']).map((e) => Category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Category'] = category.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Category {
  Category({
    this.name,
    this.categoryData,
  });
  String name;
  CategoryData categoryData;

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryData = CategoryData.fromJson(json['categoryData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['categoryData'] = categoryData.toJson();
    return _data;
  }
}

class CategoryData {
  CategoryData({
    this.categoryValues,
  });
  List<CategoryValues> categoryValues;

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryValues = List.from(json['categoryValues'])
        .map((e) => CategoryValues.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryValues'] = categoryValues.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CategoryValues {
  CategoryValues({
    this.name,
    this.subCategoryData,
  });
  String name;
  SubCategoryData subCategoryData;

  CategoryValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subCategoryData = SubCategoryData.fromJson(json['subCategoryData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['subCategoryData'] = subCategoryData.toJson();
    return _data;
  }
}

class SubCategoryData {
  SubCategoryData({
    this.subCategoryValues,
  });
  List<SubCategoryValues> subCategoryValues;

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    subCategoryValues = List.from(json['subCategoryValues'])
        .map((e) => SubCategoryValues.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subCategoryValues'] =
        subCategoryValues.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SubCategoryValues {
  SubCategoryValues({
    this.type,
    this.droptypeValues,
    this.textTypeValues,
  });
  String type;
  List<DropDownTypeValues> droptypeValues;
  TextTypeValues textTypeValues;

  SubCategoryValues.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (type.toLowerCase() == "dropdown") {
      droptypeValues = List.from(json['typeValues'])
          .map((e) => DropDownTypeValues.fromJson(e))
          .toList();
    } else {
      textTypeValues = TextTypeValues.fromJson(json['typeValues']);
      // textTypeValues = List.from(json['typeValues'])
      //     .map((e) => TextTypeValues.fromJson(e))
      //     .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    if (type.toLowerCase() == "dropdown") {
      _data['typeValues'] = droptypeValues.map((e) => e.toJson()).toList();
      return _data;
    } else {
      _data['typeValues'] = textTypeValues.toJson();
      return _data;
    }
  }
}

class DropDownTypeValues {
  DropDownTypeValues({
    this.name,
    this.value,
    this.Description,
  });
  String name;
  String value;
  String Description;

  DropDownTypeValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    Description = json['Description'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    _data['Description'] = Description;
    return _data;
  }
}

class TextTypeValues {
  TextTypeValues({
    this.name,
    this.placeHolder,
    this.mode,
    this.textType,
  });

  String name;
  String placeHolder;
  String mode;
  String textType;

  TextTypeValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    placeHolder = json['placeHolder'];
    mode = json['mode'];
    textType = json['typeText'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['placeHolder'] = placeHolder;
    _data['mode'] = mode;
    _data['textType'] = textType;
    return _data;
  }
}
