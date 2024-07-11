class EventModel {
  bool? success;
  String? message;
  List<Data>? data;

  EventModel({ success,  message,  data});

  EventModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(  Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['success'] =  success;
    data['message'] =  message;
    data['data'] =  this.data!.map((v) => v.toJson()).toList();
      return data;
  }
}

class Data {
  String? sId;
  EventData? eventData;
  List<UserData>? userData;

  Data({ sId,  eventData,  userData});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventData = json['eventData'] != null
        ?   EventData.fromJson(json['eventData'])
        : null;
    if (json['userData'] != null) {
      userData = <UserData>[];
      json['userData'].forEach((v) {
        userData!.add(  UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['_id'] =  sId;
    if ( eventData != null) {
      data['eventData'] =  eventData!.toJson();
    }
    if ( userData != null) {
      data['userData'] =  userData!.map((v) => v.toJson()).toList();
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
      { sId,
       name,
       description,
       price,
       image,
       location,
       userId,
       createdAt,
       updatedAt,
       iV,
       userData});

  EventData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ?   Image.fromJson(json['image']) : null;
    location = json['location'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    userData = json['userData'] != null
        ?   UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['_id'] =  sId;
    data['name'] =  name;
    data['description'] =  description;
    data['price'] =  price;
    if ( image != null) {
      data['image'] =  image!.toJson();
    }
    data['location'] =  location;
    data['userId'] =  userId;
    data['createdAt'] =  createdAt;
    data['updatedAt'] =  updatedAt;
    data['__v'] =  iV;

    if ( userData != null) {
      data['userData'] =  userData!.toJson();
    }
    return data;
  }
}

class Image {
  String? publicFileUrl;
  String? path;

  Image({ publicFileUrl,  path});

  Image.fromJson(Map<String, dynamic> json) {
    publicFileUrl = json['publicFileUrl'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['publicFileUrl'] =  publicFileUrl;
    data['path'] =  path;
    return data;
  }
}

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({ allowRedirects,  enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    allowRedirects = json['allow_redirects'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['allow_redirects'] =  allowRedirects;
    data['enabled'] =  enabled;
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
      { sId,
       name,
       email,
       phoneNumber,
       password,
       image,
       role,
       emailVerified,
       createdAt,
       updatedAt,
       iV,
       accountType,
       activationDate,
       expirationDate,
       mapLocation,
       packageDuration,
       stripeConnectAccountId,
       businessDescription,
       businessEmail,
       businessHours,
       businessName,
       businessNumber,
       businessWebsite});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'] != null ?   Image.fromJson(json['image']) : null;
    role = json['role'];
    emailVerified = json['emailVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    accountType = json['accountType'];
    activationDate = json['activationDate'];
    expirationDate = json['expirationDate'];
    mapLocation = json['mapLocation'] != null
        ?   MapLocation.fromJson(json['mapLocation'])
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
    final Map<String, dynamic> data =    {};
    data['_id'] =  sId;
    data['name'] =  name;
    data['email'] =  email;
    data['phoneNumber'] =  phoneNumber;
    data['password'] =  password;
    if ( image != null) {
      data['image'] =  image!.toJson();
    }
    data['role'] =  role;
    data['emailVerified'] =  emailVerified;
    data['createdAt'] =  createdAt;
    data['updatedAt'] =  updatedAt;
    data['__v'] =  iV;
    data['accountType'] =  accountType;
    data['activationDate'] =  activationDate;
    data['expirationDate'] =  expirationDate;
    if ( mapLocation != null) {
      data['mapLocation'] =  mapLocation!.toJson();
    }
    data['packageDuration'] =  packageDuration;
    data['stripeConnectAccountId'] =  stripeConnectAccountId;
    data['businessDescription'] =  businessDescription;
    data['businessEmail'] =  businessEmail;
    data['businessHours'] =  businessHours;
    data['businessName'] =  businessName;
    data['businessNumber'] =  businessNumber;
    data['businessWebsite'] =  businessWebsite;
    return data;
  }
}

class MapLocation {
  double? latitude;
  double? longitude;
  List<double>? coordinates;
  String? sId;

  MapLocation({ latitude,  longitude,  coordinates,  sId});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    {};
    data['latitude'] =  latitude;
    data['longitude'] =  longitude;
    data['coordinates'] =  coordinates;
    data['_id'] =  sId;
    return data;
  }
}
