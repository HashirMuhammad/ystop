class GetAllCurrentJobList {
  List<Data>? data;

  GetAllCurrentJobList({this.data});

  GetAllCurrentJobList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? jobTitle;
  String? campaignStartDate;
  String? campaignEndDate;
  String? finalisingDate;
  String? processingDate;
  String? postingDate;
  String? council;
  int? locationId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? mediaType;

  Data(
      {this.id,
      this.jobTitle,
      this.campaignStartDate,
      this.campaignEndDate,
      this.finalisingDate,
      this.processingDate,
      this.postingDate,
      this.council,
      this.locationId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.mediaType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    campaignStartDate = json['campaign_start_date'];
    campaignEndDate = json['campaign_end_date'];
    finalisingDate = json['finalising_date'];
    processingDate = json['processing_date'];
    postingDate = json['posting_date'];
    council = json['council'];
    locationId = json['location_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_title'] = jobTitle;
    data['campaign_start_date'] = campaignStartDate;
    data['campaign_end_date'] = campaignEndDate;
    data['finalising_date'] = finalisingDate;
    data['processing_date'] = processingDate;
    data['posting_date'] = postingDate;
    data['council'] = council;
    data['location_id'] = locationId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['media_type'] = mediaType;
    return data;
  }
}
