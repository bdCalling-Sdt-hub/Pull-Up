class NearByShopModel {
  bool? success;
  String? message;
  List<Data>? data;

  NearByShopModel({this.success, this.message, this.data});

  NearByShopModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  Image? image;
  String? role;
  bool? emailVerified;
  String? createdAt;
  String? updatedAt;
  num? iV;
  String? accountType;
  String? activationDate;
  String? expirationDate;
  String? location;
  String? packageDuration;
  String? organisationDescription;
  String? organisationEmail;
  String? organisationName;
  String? organisationNumber;
  String? organisationWebsite;
  MapLocation? mapLocation;
  num? averageRating;
  Dist? dist;
  String? businessDescription;
  String? businessEmail;
  String? businessHours;
  String? businessName;
  String? businessNumber;
  String? businessWebsite;
  String? stripeConnectAccountId;

  Data(
      {this.sId,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.image,
      this.role,
      this.emailVerified,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.accountType,
      this.activationDate,
      this.expirationDate,
      this.location,
      this.packageDuration,
      this.organisationDescription,
      this.organisationEmail,
      this.organisationName,
      this.organisationNumber,
      this.organisationWebsite,
      this.mapLocation,
      this.averageRating,
      this.dist,
      this.businessDescription,
      this.businessEmail,
      this.businessHours,
      this.businessName,
      this.businessNumber,
      this.businessWebsite,
      this.stripeConnectAccountId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    role = json['role'];
    emailVerified = json['emailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accountType = json['accountType'];
    activationDate = json['activationDate'];
    expirationDate = json['expirationDate'];
    location = json['location'];
    packageDuration = json['packageDuration'];
    organisationDescription = json['organisationDescription'];
    organisationEmail = json['organisationEmail'];
    organisationName = json['organisationName'];
    organisationNumber = json['organisationNumber'];
    organisationWebsite = json['organisationWebsite'];
    mapLocation = json['mapLocation'] != null
        ? new MapLocation.fromJson(json['mapLocation'])
        : null;
    averageRating = json['averageRating'];
    dist = json['dist'] != null ? new Dist.fromJson(json['dist']) : null;
    businessDescription = json['businessDescription'];
    businessEmail = json['businessEmail'];
    businessHours = json['businessHours'];
    businessName = json['businessName'];
    businessNumber = json['businessNumber'];
    businessWebsite = json['businessWebsite'];
    stripeConnectAccountId = json['stripeConnectAccountId'];
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
    data['emailVerified'] = this.emailVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['accountType'] = this.accountType;
    data['activationDate'] = this.activationDate;
    data['expirationDate'] = this.expirationDate;
    data['location'] = this.location;
    data['packageDuration'] = this.packageDuration;
    data['organisationDescription'] = this.organisationDescription;
    data['organisationEmail'] = this.organisationEmail;
    data['organisationName'] = this.organisationName;
    data['organisationNumber'] = this.organisationNumber;
    data['organisationWebsite'] = this.organisationWebsite;
    if (this.mapLocation != null) {
      data['mapLocation'] = this.mapLocation!.toJson();
    }
    data['averageRating'] = this.averageRating;
    if (this.dist != null) {
      data['dist'] = this.dist!.toJson();
    }
    data['businessDescription'] = this.businessDescription;
    data['businessEmail'] = this.businessEmail;
    data['businessHours'] = this.businessHours;
    data['businessName'] = this.businessName;
    data['businessNumber'] = this.businessNumber;
    data['businessWebsite'] = this.businessWebsite;
    data['stripeConnectAccountId'] = this.stripeConnectAccountId;
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
  num? latitude;
  num? longitude;
  List<num>? coordinates;
  String? sId;

  MapLocation({this.latitude, this.longitude, this.coordinates, this.sId});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<num>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}

class Dist {
  num? calculated;

  Dist({this.calculated});

  Dist.fromJson(Map<String, dynamic> json) {
    calculated = json['calculated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calculated'] = this.calculated;
    return data;
  }
}
