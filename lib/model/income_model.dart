class IncomeModel {
  bool? success;
  String? message;
  List<Data>? data;

  IncomeModel({success, message, data});

  IncomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  PaymentData? paymentData;
  UserId? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? userAccountType;

  Data(
      {sId,
      paymentData,
      userId,
      createdAt,
      updatedAt,
      iV,
      userAccountType});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    paymentData = json['paymentData'] != null
        ?  PaymentData.fromJson(json['paymentData'])
        : null;
    userId =
        json['userId'] != null ?  UserId.fromJson(json['userId']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userAccountType = json['userAccountType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    if (paymentData != null) {
      data['paymentData'] = paymentData!.toJson();
    }
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['userAccountType'] = userAccountType;
    return data;
  }
}

class PaymentData {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  int? amountReceived;
  AutomaticPaymentMethods? automaticPaymentMethods;

  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;

  bool? livemode;


  List<String>? paymentMethodTypes;

  String? status;

  PaymentData({
    id,
    object,
    amount,
    amountCapturable,
    amountReceived,
    automaticPaymentMethods,
    captureMethod,
    clientSecret,
    confirmationMethod,
    created,
    currency,
    livemode,
    paymentMethodTypes,
    status,
  });

  PaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCapturable = json['amount_capturable'];
    amountReceived = json['amount_received'];

    automaticPaymentMethods = json['automatic_payment_methods'] != null
        ?  AutomaticPaymentMethods.fromJson(
            json['automatic_payment_methods'])
        : null;

    captureMethod = json['capture_method'];
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];

    livemode = json['livemode'];


    paymentMethodTypes = json['payment_method_types'].cast<String>();

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['object'] = object;
    data['amount'] = amount;
    data['amount_capturable'] = amountCapturable;
    data['amount_received'] = amountReceived;

    if (automaticPaymentMethods != null) {
      data['automatic_payment_methods'] =
          automaticPaymentMethods!.toJson();
    }

    data['capture_method'] = captureMethod;
    data['client_secret'] = clientSecret;
    data['confirmation_method'] = confirmationMethod;
    data['created'] = created;
    data['currency'] = currency;


    data['payment_method_types'] = paymentMethodTypes;

    data['status'] = status;

    return data;
  }
}

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({allowRedirects, enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    allowRedirects = json['allow_redirects'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['allow_redirects'] = allowRedirects;
    data['enabled'] = enabled;
    return data;
  }
}



class UserId {
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
  String? location;
  MapLocation? mapLocation;
  String? packageDuration;
  String? stripeConnectAccountId;

  UserId(
      {sId,
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
      location,
      mapLocation,
      packageDuration,
      stripeConnectAccountId});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
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
        ?  MapLocation.fromJson(json['mapLocation'])
        : null;
    packageDuration = json['packageDuration'];
    stripeConnectAccountId = json['stripeConnectAccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['role'] = role;
    data['emailVerified'] = emailVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['accountType'] = accountType;
    data['activationDate'] = activationDate;
    data['expirationDate'] = expirationDate;
    data['location'] = location;
    if (mapLocation != null) {
      data['mapLocation'] = mapLocation!.toJson();
    }
    data['packageDuration'] = packageDuration;
    data['stripeConnectAccountId'] = stripeConnectAccountId;
    return data;
  }
}

class Image {
  String? publicFileUrl;
  String? path;

  Image({publicFileUrl, path});

  Image.fromJson(Map<String, dynamic> json) {
    publicFileUrl = json['publicFileUrl'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['publicFileUrl'] = publicFileUrl;
    data['path'] = path;
    return data;
  }
}

class MapLocation {
  double? latitude;
  double? longitude;
  List<double>? coordinates;
  String? sId;

  MapLocation({latitude, longitude, coordinates, sId});

  MapLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['coordinates'] = coordinates;
    data['_id'] = sId;
    return data;
  }
}
