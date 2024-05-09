class ProductHistoryModel {
  bool? success;
  String? message;
  List<Data>? data;

  ProductHistoryModel({this.success, this.message, this.data});

  ProductHistoryModel.fromJson(Map<String, dynamic> json) {
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
  UserId? userId;
  ProductId? productId;

  Data({this.sId, this.userId, this.productId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    productId = json['productId'] != null
        ? new ProductId.fromJson(json['productId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.productId != null) {
      data['productId'] = this.productId!.toJson();
    }
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  Image? image;
  String? role;
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
  String? stripeConnectAccountId;
  bool? isExpiration;
  String? id;

  UserId(
      {this.sId,
      this.name,
      this.email,
      this.phoneNumber,
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
      this.mapLocation,
      this.packageDuration,
      this.stripeConnectAccountId,
      this.isExpiration,
      this.id});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
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
    mapLocation = json['mapLocation'] != null
        ? new MapLocation.fromJson(json['mapLocation'])
        : null;
    packageDuration = json['packageDuration'];
    stripeConnectAccountId = json['stripeConnectAccountId'];
    isExpiration = json['isExpiration'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
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
    if (this.mapLocation != null) {
      data['mapLocation'] = this.mapLocation!.toJson();
    }
    data['packageDuration'] = this.packageDuration;
    data['stripeConnectAccountId'] = this.stripeConnectAccountId;
    data['isExpiration'] = this.isExpiration;
    data['id'] = this.id;
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
  List<double>? coordinates;
  String? sId;
  String? id;

  MapLocation(
      {this.latitude, this.longitude, this.coordinates, this.sId, this.id});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    data['id'] = this.id;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  String? description;
  String? price;
  Image? image;
  List<String>? keywords;
  String? userId;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductId(
      {this.sId,
      this.name,
      this.description,
      this.price,
      this.image,
      this.keywords,
      this.userId,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    keywords = json['keywords'].cast<String>();
    userId = json['userId'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['keywords'] = this.keywords;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
