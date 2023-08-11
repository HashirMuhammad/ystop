class GetSingleJobList {
  Data? data;

  GetSingleJobList({this.data});

  GetSingleJobList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  List<Items>? items;
  Location? location;

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
      this.mediaType,
      this.items,
      this.location});

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
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_title'] = this.jobTitle;
    data['campaign_start_date'] = this.campaignStartDate;
    data['campaign_end_date'] = this.campaignEndDate;
    data['finalising_date'] = this.finalisingDate;
    data['processing_date'] = this.processingDate;
    data['posting_date'] = this.postingDate;
    data['council'] = this.council;
    data['location_id'] = this.locationId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['media_type'] = this.mediaType;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  int? jobListId;
  int? lineItemId;
  int? itemId;
  int? assetId;
  String? position;
  int? fileId;
  String? action;
  String? status;
  int? movedFrom;
  String? createdAt;
  String? updatedAt;
  int? postingTaskId;
  String? postedDate;
  List<Locations>? locations;

  Items(
      {this.id,
      this.jobListId,
      this.lineItemId,
      this.itemId,
      this.assetId,
      this.position,
      this.fileId,
      this.action,
      this.status,
      this.movedFrom,
      this.createdAt,
      this.updatedAt,
      this.postingTaskId,
      this.postedDate,
      this.locations});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobListId = json['job_list_id'];
    lineItemId = json['line_item_id'];
    itemId = json['item_id'];
    assetId = json['asset_id'];
    position = json['position'];
    fileId = json['file_id'];
    action = json['action'];
    status = json['status'];
    movedFrom = json['moved_from'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    postingTaskId = json['posting_task_id'];
    postedDate = json['posted_date'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_list_id'] = this.jobListId;
    data['line_item_id'] = this.lineItemId;
    data['item_id'] = this.itemId;
    data['asset_id'] = this.assetId;
    data['position'] = this.position;
    data['file_id'] = this.fileId;
    data['action'] = this.action;
    data['status'] = this.status;
    data['moved_from'] = this.movedFrom;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['posting_task_id'] = this.postingTaskId;
    data['posted_date'] = this.postedDate;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  int? id;
  int? pigeonholeId;
  int? mediaId;
  int? quantity;
  String? data;
  String? createdAt;
  String? updatedAt;
  String? mediaStatus;

  Locations(
      {this.id,
      this.pigeonholeId,
      this.mediaId,
      this.quantity,
      this.data,
      this.createdAt,
      this.updatedAt,
      this.mediaStatus});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pigeonholeId = json['pigeonhole_id'];
    mediaId = json['media_id'];
    quantity = json['quantity'];
    data = json['data'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mediaStatus = json['media_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pigeonhole_id'] = pigeonholeId;
    data['media_id'] = mediaId;
    data['quantity'] = quantity;
    data['data'] = data;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['media_status'] = mediaStatus;
    return data;
  }
}

class Location {
  int? id;
  String? type;
  String? name;
  String? prefix;
  String? path;
  String? createdAt;
  String? updatedAt;
  int? vanRegNo;

  Location(
      {this.id,
      this.type,
      this.name,
      this.prefix,
      this.path,
      this.createdAt,
      this.updatedAt,
      this.vanRegNo});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    prefix = json['prefix'];
    path = json['path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    vanRegNo = json['van_reg_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['prefix'] = prefix;
    data['path'] = path;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['van_reg_no'] = vanRegNo;
    return data;
  }
}
