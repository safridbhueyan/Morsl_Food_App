import 'package:hive/hive.dart';

part 'food_model.g.dart'; // Generated adapter file

@HiveType(typeId: 0) // Unique typeId (change to 1 if conflicts)
class FoodModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final DateTime createdAt;

  FoodModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}