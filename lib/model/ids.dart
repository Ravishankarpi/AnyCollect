class JsonId {
  String sectionId;
  String groupId;
  String fieldId;
  int value;

  JsonId({this.sectionId, this.groupId,this.fieldId, this.value});

  JsonId.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    groupId = json['groupId'];
    fieldId = json['fieldId'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionId'] = this.sectionId;
    data['groupId'] = this.groupId;
    data['fieldId'] = this.fieldId;
    data['value'] = this.value;
    return data;
  }
}
class IndexOfJsonId {
  int sectionIds;
  int groupsIds;
  int fieldIds;
  int optionIds;

  IndexOfJsonId({this.sectionIds, this.groupsIds,this.fieldIds, this.optionIds});

  IndexOfJsonId.fromJson(Map<String, dynamic> json) {
    sectionIds = json['sectionIds'];
    groupsIds = json['groupsIds'];
    fieldIds = json['fieldIds'];
    optionIds = json['optionIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionIds'] = this.sectionIds;
    data['groupsIds'] = this.groupsIds;
    data['fieldIds'] = this.fieldIds;
    data['optionIds'] = this.optionIds;
    return data;
  }
}
