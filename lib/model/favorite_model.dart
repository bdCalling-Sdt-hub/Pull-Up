class FavoriteModel {
  bool? success;
  String? message;
  Data? data;

  FavoriteModel({success, message, data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
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
    final Map<String, dynamic> data =  {};
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
  String? userId;
  ProductId? productId;
  String? isFavorite;
  String? createdAt;
  String? updatedAt;

  Result(
      {sId,
        userId,
        productId,
        isFavorite,
        createdAt,
        updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productId = json['productId'] != null
        ?  ProductId.fromJson(json['productId'])
        : null;
    isFavorite = json['isFavorite'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['_id'] = sId;
    data['userId'] = userId;
    if (productId != null) {
      data['productId'] = productId!.toJson();
    }
    data['isFavorite'] = isFavorite;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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
      {sId,
        name,
        description,
        price,
        image,
        keywords,
        userId,
        address,
        createdAt,
        updatedAt,
        iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
    keywords = json['keywords'].cast<String>();
    userId = json['userId'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['keywords'] = keywords;
    data['userId'] = userId;
    data['address'] = address;
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
    final Map<String, dynamic> data =  {};
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
    final Map<String, dynamic> data =  {};
    data['page'] = page;
    data['limit'] = limit;
    data['totalPage'] = totalPage;
    data['total'] = total;
    return data;
  }
}
