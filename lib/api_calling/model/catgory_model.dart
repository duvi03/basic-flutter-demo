import 'dart:convert';

class CategoryModel {
  int? id;
  String? name;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, image: $image, creationAt: $creationAt, updatedAt: $updatedAt}';
  }
}
