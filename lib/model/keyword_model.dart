class KeywordModel {
  bool? success;
  String? message;
  List<Data>? data;

  KeywordModel({success, message, data});

  KeywordModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  {};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? count;
  String? keyword;

  Data({count, keyword});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    keyword = json['keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['count'] = count;
    data['keyword'] = keyword;
    return data;
  }
}
