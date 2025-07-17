import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

@JsonSerializable()
class Breed {
  const Breed({required this.id, required this.name});

  final String id;
  final String name;

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
