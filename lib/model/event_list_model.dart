class EventListModel {
  bool? success;
  String? message;
  Data? data;

  EventListModel({success, message, data});

  EventListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data!.toJson();
      return data;
  }
}

class Data {
  List<Result>? result;
  Meta? meta;

  Data({result, meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add( Result.fromJson(v));
      });
    }
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? name;
  String? description;
  String? price;
  Image? image;
  String? location;
  String? createdAt;
  String? updatedAt;

  Result(
      {sId,
        name,
        description,
        price,
        image,
        location,
        createdAt,
        updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['location'] = location;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

class Meta {
  int? page;
  int? limit;
  int? totalPage;
  int? total;

  Meta({page, limit, totalPage, total});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    totalPage = json['totalPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    data['limit'] = limit;
    data['totalPage'] = totalPage;
    data['total'] = total;
    return data;
  }
}
