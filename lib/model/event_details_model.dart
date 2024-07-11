class EventDetailsModel {
  bool? success;
  String? message;
  Data? data;

  EventDetailsModel({success, message, data});

  EventDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? description;
  String? price;
  Image? image;
  String? location;
  String? dateTime;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {sId,
      name,
      description,
      price,
      image,
      location,
      dateTime,
      userId,
      createdAt,
      updatedAt,
      iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    location = json['location'];
    dateTime = json['dateTime'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['location'] = location;
    data['dateTime'] = dateTime;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    final Map<String, dynamic> data ={};
    data['publicFileUrl'] = publicFileUrl;
    data['path'] = path;
    return data;
  }
}
