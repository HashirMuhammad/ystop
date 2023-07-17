class LoginModel {
  String? serverMaintenance;
  String? appUpdate;
  String? message;
  String? errors;
  Result? result;

  LoginModel(
      {this.serverMaintenance,
      this.appUpdate,
      this.message,
      this.errors,
      this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    serverMaintenance = json['server_maintenance'];
    appUpdate = json['app_update'];
    message = json['message'];
    errors = json['errors'];
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['server_maintenance'] = serverMaintenance;
    data['app_update'] = appUpdate;
    data['message'] = message;
    data['errors'] = errors;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? type;
  int? clientid;
  String? avatarDirectory;
  String? tokenType;
  String? expiresAt;
  String? accessToken;
 // Null? emailVerifiedAt;
  bool? isDeleted;

  Result(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.type,
      this.clientid,
      this.avatarDirectory,
      this.tokenType,
      this.expiresAt,
      this.accessToken,
    //  this.emailVerifiedAt,
      this.isDeleted});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    type = json['type'];
    clientid = json['clientid'];
    avatarDirectory = json['avatar_directory'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    accessToken = json['access_token'];
   // emailVerifiedAt = json['email_verified_at'];
   isDeleted = json['is_deleted'] as bool? ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['type'] = type;
    data['clientid'] = clientid;
    data['avatar_directory'] = avatarDirectory;
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    data['access_token'] = accessToken;
   // data['email_verified_at'] = this.emailVerifiedAt;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
