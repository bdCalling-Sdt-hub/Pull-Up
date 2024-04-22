class KeywordModel {
  bool? success;
  String? message;
  List<Data>? data;

  KeywordModel({this.success, this.message, this.data});

  KeywordModel.fromJson(Map<String, dynamic> json) {
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
  int? count;
  String? keyword;

  Data({this.count, this.keyword});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    keyword = json['keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['keyword'] = this.keyword;
    return data;
  }
}
