class AttachmentFile {
  AttachmentFile({
     this.attachments,
  });
   List<Attachments> attachments;
  
  AttachmentFile.fromJson(Map<String, dynamic> json){
    attachments = List.from(json['attachments']).map((e)=>Attachments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attachments'] = attachments.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Attachments {
  Attachments({
    this.fileId,
    this.fileName,
    this.base64String,
  });
    int fileId;
    String fileName;
    String base64String;
  
  Attachments.fromJson(Map<String, dynamic> json){
    fileId = json['fileId'];
    fileName = json['fileName'];
    base64String = json['base64String'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fileId'] = fileId;
    _data['fileName'] = fileName;
    _data['base64String'] = base64String;
    return _data;
  }
}