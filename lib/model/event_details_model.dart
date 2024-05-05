class EventDetailsModel {
  bool? success;
  String? message;
  Data? data;

  EventDetailsModel({this.success, this.message, this.data});

  EventDetailsModel.fromJson(Map<String, dynamic> json) {
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
      {this.sId,
      this.name,
      this.description,
      this.price,
      this.image,
      this.location,
      this.dateTime,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    location = json['location'];
    dateTime = json['dateTime'];
    userId = json['userId'];
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
    data['location'] = this.location;
    data['dateTime'] = this.dateTime;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
