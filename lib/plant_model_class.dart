// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'dart:convert';

class Plant {
  // AssetImage assetImage;
  String imageUrl;
  String title;
  String subtitle;
  bool isFavorite;
  String plantType;
  String plantFamily;
  String plantOrigin;
  String lightRequirement;
  String watering;
  String backgroundImageUrl;
  Plant({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.plantType,
    required this.plantFamily,
    required this.plantOrigin,
    required this.lightRequirement,
    required this.watering,
    required this.backgroundImageUrl,
  });
  

  Plant copyWith({
    String? imageUrl,
    String? title,
    String? subtitle,
    bool? isFavorite,
    String? plantType,
    String? plantFamily,
    String? plantOrigin,
    String? lightRequirement,
    String? watering,
    String? backgroundImageUrl,
  }) {
    return Plant(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isFavorite: isFavorite ?? this.isFavorite,
      plantType: plantType ?? this.plantType,
      plantFamily: plantFamily ?? this.plantFamily,
      plantOrigin: plantOrigin ?? this.plantOrigin,
      lightRequirement: lightRequirement ?? this.lightRequirement,
      watering: watering ?? this.watering,
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'title': title,
      'subtitle': subtitle,
      'isFavorite': isFavorite,
      'plantType': plantType,
      'plantFamily': plantFamily,
      'plantOrigin': plantOrigin,
      'lightRequirement': lightRequirement,
      'watering': watering,
      'backgroundImageUrl': backgroundImageUrl,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      isFavorite: map['isFavorite'] as bool,
      plantType: map['plantType'] as String,
      plantFamily: map['plantFamily'] as String,
      plantOrigin: map['plantOrigin'] as String,
      lightRequirement: map['lightRequirement'] as String,
      watering: map['watering'] as String,
      backgroundImageUrl: map['backgroundImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plant.fromJson(String source) => Plant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plant(imageUrl: $imageUrl, title: $title, subtitle: $subtitle, isFavorite: $isFavorite, plantType: $plantType, plantFamily: $plantFamily, plantOrigin: $plantOrigin, lightRequirement: $lightRequirement, watering: $watering, backgroundImageUrl: $backgroundImageUrl)';
  }

  @override
  bool operator ==(covariant Plant other) {
    if (identical(this, other)) return true;
  
    return 
      other.imageUrl == imageUrl &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.isFavorite == isFavorite &&
      other.plantType == plantType &&
      other.plantFamily == plantFamily &&
      other.plantOrigin == plantOrigin &&
      other.lightRequirement == lightRequirement &&
      other.watering == watering &&
      other.backgroundImageUrl == backgroundImageUrl;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      isFavorite.hashCode ^
      plantType.hashCode ^
      plantFamily.hashCode ^
      plantOrigin.hashCode ^
      lightRequirement.hashCode ^
      watering.hashCode ^
      backgroundImageUrl.hashCode;
  }
}
