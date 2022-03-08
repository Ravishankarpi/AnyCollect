class AnyCollect {
  List<AnyCollectForms> anyCollectForms;

  AnyCollect({this.anyCollectForms});

  AnyCollect.fromJson(Map<String, dynamic> json) {
    if (json['AnyCollectForms'] != null) {
      anyCollectForms = new List<AnyCollectForms>();
      json['AnyCollectForms'].forEach((v) {
        anyCollectForms.add(new AnyCollectForms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anyCollectForms != null) {
      data['AnyCollectForms'] =
          this.anyCollectForms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnyCollectForms {
  String label;
  String formId;
  FormData formData;

  AnyCollectForms({this.label, this.formId, this.formData});

  AnyCollectForms.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    formId = json['formId'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['formId'] = this.formId;
    if (this.formData != null) {
      data['formData'] = this.formData.toJson();
    }
    return data;
  }
}

class FormData {
  List<Sections> sections;

  FormData({this.sections});

  FormData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = new List<Sections>();
      json['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sections != null) {
      data['sections'] = this.sections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  String sectionName;
  String sectionId;
  int sortOrder;
  List<Fields> fields;
  List<Groups> groups;

  Sections(
      {this.sectionName,
      this.sectionId,
      this.sortOrder,
      this.fields,
      this.groups});

  Sections.fromJson(Map<String, dynamic> json) {
    sectionName = json['sectionName'];
    sectionId = json['sectionId'];
    sortOrder = json['sortOrder'];
    if (json['fields'] != null) {
      fields = new List<Fields>();
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = new List<Groups>();
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionName'] = this.sectionName;
    data['sectionId'] = this.sectionId;
    data['sortOrder'] = this.sortOrder;
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toJson()).toList();
    }
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String label;
  String type;
  String id;
  ActionDetails actionDetails;

  Fields({this.label, this.type, this.id, this.actionDetails});

  Fields.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    type = json['type'];
    id = json['id'];
    actionDetails = json['actionDetails'] != null
        ? new ActionDetails.fromJson(json['actionDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.actionDetails != null) {
      data['actionDetails'] = this.actionDetails.toJson();
    }
    return data;
  }
}

class ActionDetails {
  String calculationType;
  String column;
  String copyFromFieldId;
  String actionType;

  ActionDetails({this.calculationType, this.column, this.copyFromFieldId, this.actionType});

  ActionDetails.fromJson(Map<String, dynamic> json) {
    calculationType = json['calculationType'];
    column = json['column'];
    copyFromFieldId = json['copyFromFieldId'];
    actionType = json['actionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calculationType'] = this.calculationType;
    data['column'] = this.column;
    data['copyFromFieldId'] = this.copyFromFieldId;
    data['actionType'] = this.actionType;
    return data;
  }
}

class Groups {
  String groupName;
  String groupId;
  List<GroupFields> groupFields;

  Groups({this.groupName, this.groupId, this.groupFields});

  Groups.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    groupId = json['groupId'];
    if (json['groupFields'] != null) {
      groupFields = new List<GroupFields>();
      json['groupFields'].forEach((v) {
        groupFields.add(new GroupFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    data['groupId'] = this.groupId;
    if (this.groupFields != null) {
      data['groupFields'] = this.groupFields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupFields {
  String label;
  String id;
  String type;
  List<Options> options;
  int defaultValue;
  String isRequired;
  ActionDetails actionDetails;
  String enableRichText;
  String fileFilter;
  String isMulti;
  String value;

  GroupFields(
      {this.label,
      this.id,
      this.type,
      this.options,
      this.defaultValue,
      this.isRequired,
      this.actionDetails,
      this.enableRichText,
      this.fileFilter,
      this.isMulti,
      this.value});

  GroupFields.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    id = json['Id'];
    type = json['type'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
    defaultValue = json['defaultValue'];
    isRequired = json['isRequired'];
    actionDetails = json['actionDetails'] != null
        ? new ActionDetails.fromJson(json['actionDetails'])
        : null;
    enableRichText = json['enableRichText'];
    fileFilter = json['fileFilter'];
    isMulti = json['isMulti'];
    value = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['Id'] = this.id;
    data['type'] = this.type;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    data['defaultValue'] = this.defaultValue;
    data['isRequired'] = this.isRequired;
    if (this.actionDetails != null) {
      data['actionDetails'] = this.actionDetails.toJson();
    }
    data['enableRichText'] = this.enableRichText;
    data['fileFilter'] = this.fileFilter;
    data['isMulti'] = this.isMulti;
    data["value"] = this.value;
    return data;
  }
}

class Options {
  int id;
  String text;
  int value;
  String description;

  Options({this.id, this.text, this.value, this.description});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    text = json['text'];
    value = json['value'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['text'] = this.text;
    data['value'] = this.value;
    data['description'] = this.description;
    return data;
  }
}
