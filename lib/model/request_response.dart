class RequestResponse {
  RequestResponse({
    this.userId,
    this.dataCollectionId,
    this.formId,
    this.label,
    this.formContent,
    this.status,
    this.formCollection,
  });
  int userId;
  int dataCollectionId;
  int formId;
  String label;
  String formContent;
  String status;
  List<FormCollection> formCollection;
  
  RequestResponse.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    dataCollectionId = json['dataCollectionId'];
    formId = json['formId'];
    label = json['label'];
    formContent = json['formContent'];
    status = json['status'];
    formCollection = <FormCollection>[];
    if(json['formCollection'] != null) {
      formCollection = List.from(json['formCollection']).map((e)=> FormCollection.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['dataCollectionId'] = dataCollectionId;
    _data['formId'] = formId;
    _data['label'] = label;
    _data['formContent'] = formContent;
    _data['status'] = status;
    _data['formCollection'] = formCollection.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class FormCollection {
  FormCollection({
    this.label,
    this.formId,
    this.dataCollectionId,
    this.createdDate,
    this.modifiedDate,
    this.status,
  });
  String label;
  int formId;
  int dataCollectionId;
  String createdDate;
  String modifiedDate;
  String status;
  
  FormCollection.fromJson(Map<String, dynamic> json){
    label = json['label'];
    formId = json['formId'];
    dataCollectionId = json['dataCollectionId'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label;
    _data['formId'] = formId;
    _data['dataCollectionId'] = dataCollectionId;
    _data['createdDate'] = createdDate;
    _data['modifiedDate'] = modifiedDate;
    _data['status'] = status;
    return _data;
  }
}