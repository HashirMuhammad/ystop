class GetMediaLocationsModel {
  Data? data;

  GetMediaLocationsModel({this.data});

  GetMediaLocationsModel.fromJson(Map<String, dynamic> json) {
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
  List<Stock>? stock;

  Data({this.mediaId, this.fileBrandid, this.qrCode, this.url, this.stock});

  Data.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    fileBrandid = json['file_brandid'];
    qrCode = json['qrCode'];
    url = json['url'];
    if (json['stock'] != null) {
      stock = <Stock>[];
      json['stock'].forEach((v) {
        stock!.add(Stock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['media_id'] = mediaId;
    data['file_brandid'] = fileBrandid;
    data['qrCode'] = qrCode;
    data['url'] = url;
    if (stock != null) {
      data['stock'] = stock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stock {
  int? pigeonholeId;
  int? quantity;
  String? qrCode;

  Stock({this.pigeonholeId, this.quantity, this.qrCode});

  Stock.fromJson(Map<String, dynamic> json) {
    pigeonholeId = json['pigeonhole_id'];
    quantity = json['quantity'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pigeonhole_id'] = pigeonholeId;
    data['quantity'] = quantity;
    data['qrCode'] = qrCode;
    return data;
  }
}
