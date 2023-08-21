import 'dart:convert';

class ChaneelModel {
  final Source? source;
  final String title;
  final String url;
  final String description;
  final String? urlToImage;
  ChaneelModel({
    this.source,
    required this.title,
    required this.url,
    required this.description,
    this.urlToImage,
  });

  ChaneelModel copyWith({
    Source? source,
    String? title,
    String? url,
    String? description,
    String? urlToImage,
  }) {
    return ChaneelModel(
      source: source ?? this.source,
      title: title ?? this.title,
      url: url ?? this.url,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'title': title,
      'url': url,
      'description': description,
      'urlToImage': urlToImage,
    };
  }

  factory ChaneelModel.fromMap(Map<String, dynamic> map) {
    return ChaneelModel(
      source: map['source'] != null
          ? Source.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      title: map['title'] as String,
      url: map['url'] as String,
      description: map['description'] as String,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChaneelModel.fromJson(String source) =>
      ChaneelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiModel(source: $source, title: $title, url: $url, description: $description, urlToImage: $urlToImage)';
  }

  @override
  bool operator ==(covariant ChaneelModel other) {
    if (identical(
      this,
      other,
    )) return true;
    return other.source == source &&
        other.title == title &&
        other.url == url &&
        other.description == description &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode {
    return source.hashCode ^
        title.hashCode ^
        url.hashCode ^
        description.hashCode ^
        urlToImage.hashCode;
  }
}

class Source {
  final String id;
  final String name;
  Source({
    required this.id,
    required this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) =>
      Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Source(id: $id, name: $name)';

  @override
  bool operator ==(covariant Source other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
