class GetMediaFileModel {
  Data? data;

  GetMediaFileModel({this.data});

  GetMediaFileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? mediaId;
  int? fileBrandid;
  String? qrCode;
  String? url;

  Data({this.mediaId, this.fileBrandid, this.qrCode, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    fileBrandid = json['file_brandid'];
    qrCode = json['qrCode'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media_id'] = mediaId;
    data['file_brandid'] = fileBrandid;
    data['qrCode'] = qrCode;
    data['url'] = url;
    return data;
  }
}
