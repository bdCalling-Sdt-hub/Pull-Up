class LogInModel {
  bool? success;
  String? message;
  Data? data;

  LogInModel({this.success, this.message, this.data});

  LogInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  Image? image;
  String? role;
  String? oneTimeCode;
  bool? emailVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? accountType;
  String? activationDate;
  String? expirationDate;
  String? location;
  MapLocation? mapLocation;
  String? packageDuration;
  String? businessDescription;
  String? businessEmail;
  String? businessHours;
  String? businessName;
  String? businessNumber;
  String? businessWebsite;
  int? averageRating;

  User(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.password,
        this.image,
        this.role,
        this.oneTimeCode,
        this.emailVerified,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.accountType,
        this.activationDate,
        this.expirationDate,
        this.location,
        this.mapLocation,
        this.packageDuration,
        this.businessDescription,
        this.businessEmail,
        this.businessHours,
        this.businessName,
        this.businessNumber,
        this.businessWebsite,
        this.averageRating});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    role = json['role'];
    oneTimeCode = json['oneTimeCode'];
    emailVerified = json['emailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accountType = json['accountType'];
    activationDate = json['activationDate'];
    expirationDate = json['expirationDate'];
    location = json['location'];
    mapLocation = json['mapLocation'] != null
        ? new MapLocation.fromJson(json['mapLocation'])
        : null;
    packageDuration = json['packageDuration'];
    businessDescription = json['businessDescription'];
    businessEmail = json['businessEmail'];
    businessHours = json['businessHours'];
    businessName = json['businessName'];
    businessNumber = json['businessNumber'];
    businessWebsite = json['businessWebsite'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['role'] = this.role;
    data['oneTimeCode'] = this.oneTimeCode;
    data['emailVerified'] = this.emailVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['accountType'] = this.accountType;
    data['activationDate'] = this.activationDate;
    data['expirationDate'] = this.expirationDate;
    data['location'] = this.location;
    if (this.mapLocation != null) {
      data['mapLocation'] = this.mapLocation!.toJson();
    }
    data['packageDuration'] = this.packageDuration;
    data['businessDescription'] = this.businessDescription;
    data['businessEmail'] = this.businessEmail;
    data['businessHours'] = this.businessHours;
    data['businessName'] = this.businessName;
    data['businessNumber'] = this.businessNumber;
    data['businessWebsite'] = this.businessWebsite;
    data['averageRating'] = this.averageRating;
    return data;
  }
}

class Image {
  String? publicFileUrl;
  String? path;

  Image({this.publicFileUrl, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    publicFileUrl = json['publicFileUrl'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicFileUrl'] = this.publicFileUrl;
    data['path'] = this.path;
    return data;
  }
}

class MapLocation {
  double? latitude;
  double? longitude;
  String? sId;
  List<double>? coordinates;

  MapLocation({this.latitude, this.longitude, this.sId, this.coordinates});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    sId = json['_id'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['_id'] = this.sId;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
