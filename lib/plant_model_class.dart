// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';

class Plant {
  // AssetImage assetImage;
  String imageUrl;
  String title;
  String subtitle;
  bool isFavorite;
  Plant({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
  });
  

  Plant copyWith({
    String? imageUrl,
    String? title,
    String? subtitle,
    bool? isFavorite,
  }) {
    return Plant(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'title': title,
      'subtitle': subtitle,
      'isFavorite': isFavorite,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plant.fromJson(String source) => Plant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plant(imageUrl: $imageUrl, title: $title, subtitle: $subtitle, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant Plant other) {
    if (identical(this, other)) return true;
  
    return 
      other.imageUrl == imageUrl &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      isFavorite.hashCode;
  }
}
