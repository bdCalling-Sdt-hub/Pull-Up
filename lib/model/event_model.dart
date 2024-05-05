class EventModel {
  bool? success;
  String? message;
  List<Data>? data;

  EventModel({this.success, this.message, this.data});

  EventModel.fromJson(Map<String, dynamic> json) {
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
  EventData? eventData;
  List<UserData>? userData;

  Data({this.sId, this.eventData, this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventData = json['eventData'] != null
        ? new EventData.fromJson(json['eventData'])
        : null;
    if (json['userData'] != null) {
      userData = <UserData>[];
      json['userData'].forEach((v) {
        userData!.add(new UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.eventData != null) {
      data['eventData'] = this.eventData!.toJson();
    }
    if (this.userData != null) {
      data['userData'] = this.userData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventData {
  String? sId;
  String? name;
  String? description;
  String? price;
  Image? image;
  String? location;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  UserData? userData;

  EventData(
      {this.sId,
      this.name,
      this.description,
      this.price,
      this.image,
      this.location,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userData});

  EventData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    location = json['location'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
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
    data['location'] = this.location;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;

    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
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

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({this.allowRedirects, this.enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    allowRedirects = json['allow_redirects'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_redirects'] = this.allowRedirects;
    data['enabled'] = this.enabled;
    return data;
  }
}

class PaymentMethodOptions {
  Card? card;

  PaymentMethodOptions({this.card});

  PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    return data;
  }
}

class Card {
  Null? installments;
  Null? mandateOptions;
  Null? network;
  String? requestThreeDSecure;

  Card(
      {this.installments,
      this.mandateOptions,
      this.network,
      this.requestThreeDSecure});

  Card.fromJson(Map<String, dynamic> json) {
    installments = json['installments'];
    mandateOptions = json['mandate_options'];
    network = json['network'];
    requestThreeDSecure = json['request_three_d_secure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installments'] = this.installments;
    data['mandate_options'] = this.mandateOptions;
    data['network'] = this.network;
    data['request_three_d_secure'] = this.requestThreeDSecure;
    return data;
  }
}

class UserData {
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
  int? iV;
  String? accountType;
  String? activationDate;
  String? expirationDate;
  MapLocation? mapLocation;
  String? packageDuration;
  String? stripeConnectAccountId;
  String? businessDescription;
  String? businessEmail;
  String? businessHours;
  String? businessName;
  String? businessNumber;
  String? businessWebsite;

  UserData(
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
      this.mapLocation,
      this.packageDuration,
      this.stripeConnectAccountId,
      this.businessDescription,
      this.businessEmail,
      this.businessHours,
      this.businessName,
      this.businessNumber,
      this.businessWebsite});

  UserData.fromJson(Map<String, dynamic> json) {
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
    mapLocation = json['mapLocation'] != null
        ? new MapLocation.fromJson(json['mapLocation'])
        : null;
    packageDuration = json['packageDuration'];
    stripeConnectAccountId = json['stripeConnectAccountId'];
    businessDescription = json['businessDescription'];
    businessEmail = json['businessEmail'];
    businessHours = json['businessHours'];
    businessName = json['businessName'];
    businessNumber = json['businessNumber'];
    businessWebsite = json['businessWebsite'];
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
    if (this.mapLocation != null) {
      data['mapLocation'] = this.mapLocation!.toJson();
    }
    data['packageDuration'] = this.packageDuration;
    data['stripeConnectAccountId'] = this.stripeConnectAccountId;
    data['businessDescription'] = this.businessDescription;
    data['businessEmail'] = this.businessEmail;
    data['businessHours'] = this.businessHours;
    data['businessName'] = this.businessName;
    data['businessNumber'] = this.businessNumber;
    data['businessWebsite'] = this.businessWebsite;
    return data;
  }
}

class MapLocation {
  double? latitude;
  double? longitude;
  List<double>? coordinates;
  String? sId;

  MapLocation({this.latitude, this.longitude, this.coordinates, this.sId});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<double>();
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
