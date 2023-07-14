// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Project {
  String title;
  String description;
  String url;
  List<String> images;

   Project({
    required this.title,
    required this.description,
    required this.url,
    required this.images,
  });

  Project copyWith({
    String? title,
    String? description,
    String? url,
    List<String>? images,
  }) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'url': url,
      'images': images,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: (map["title"] ?? '') as String,
      description: (map["description"] ?? '') as String,
      url: (map["url"] ?? '') as String,
      images: List<String>.from(((map['images'] ?? const <String>[]) as List<String>),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(title: $title, description: $description, url: $url, images: $images)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.title == title &&
      other.description == description &&
      other.url == url &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      images.hashCode;
  }
}
