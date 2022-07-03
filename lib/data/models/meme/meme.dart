class MemeModel {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxcount;

  MemeModel({
    this.id,
    this.name,
    this.url,
    this.height,
    this.width,
    this.boxcount,
  });

  MemeModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    url = json["url"];
    height = json["height"];
    width = json["width"];
    boxcount = json["box_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["url"] = url;
    data["height"] = height;
    data["width"] = width;
    data["box_count"] = boxcount;
    return data;
  }

  @override
  String toString() {
    return '${toJson()}';
  }
}
