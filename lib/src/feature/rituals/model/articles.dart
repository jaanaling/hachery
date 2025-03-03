// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Articles {
  final String id;
  final String title;
  final String description;
  final String images;
  Articles({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
  });

  Articles copyWith({
    String? id,
    String? title,
    String? description,
    String? images,
  }) {
    return Articles(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': images,
    };
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      images: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Articles(id: $id, title: $title, description: $description, images: $images)';
  }

  @override
  bool operator ==(covariant Articles other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.images == images;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        images.hashCode;
  }
}
