class FriendsV2Response {
  String? group;
  List<ResultV2>? result;

  FriendsV2Response({this.group, this.result});

  FriendsV2Response.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    if (json['result'] != null) {
      result = <ResultV2>[];
      json['result'].forEach((v) {
        result!.add(ResultV2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['group'] = group;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultV2 {
  String? name;
  String? imageUrl;

  ResultV2({this.name, this.imageUrl});

  ResultV2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
