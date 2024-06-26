class FavoriteModel {
  bool? success;
  String? message;
  Data? data;

  FavoriteModel({this.success, this.message, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
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
  List<Result>? result;
  Meta? meta;

  Data({this.result, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
      {this.sId,
        this.userId,
        this.productId,
        this.isFavorite,
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productId = json['productId'] != null
        ? new ProductId.fromJson(json['productId'])
        : null;
    isFavorite = json['isFavorite'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.productId != null) {
      data['productId'] = this.productId!.toJson();
    }
    data['isFavorite'] = this.isFavorite;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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

class Meta {
  int? page;
  int? limit;
  int? totalPage;
  int? total;

  Meta({this.page, this.limit, this.totalPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    totalPage = json['totalPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPage'] = this.totalPage;
    data['total'] = this.total;
    return data;
  }
}
