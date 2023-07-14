// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Skill {
  String title;
  List<String> names;
  Skill({
    required this.title,
    required this.names,
  });

  Skill copyWith({
    String? title,
    List<String>? names,
  }) {
    return Skill(
      title: title ?? this.title,
      names: names ?? this.names,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'names': names,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      title: (map["title"] ?? '') as String,
      names: List<String>.from(
        ((map['names'] ?? const <String>[]) as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) =>
      Skill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Skill(title: $title, names: $names)';

  @override
  bool operator ==(covariant Skill other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.title == title && listEquals(other.names, names);
  }

  @override
  int get hashCode => title.hashCode ^ names.hashCode;
}
