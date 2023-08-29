class ApiModel {
  Source? source;
  String? title;
  String? url;
  String? description;
  String? urlToImage;

  ApiModel({
    this.source,
    this.title,
    this.url,
    this.description,
    this.urlToImage,
  });

  ApiModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['title'] = title;
    data['url'] = url;
    data['description'] = description;
    data['urlToImage'] = urlToImage;

    return data;
  }
}

class Source {
  String? id;
  String? name;
  Source({this.id, this.name});
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
