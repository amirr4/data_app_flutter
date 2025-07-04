import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/item.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final String title;

  @JsonKey(name: 'body')
  final String description;

  const ItemModel({
    required this.id,
    required this.title,
    required this.description,
  });

  /// Convert JSON to ItemModel
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  /// Convert ItemModel to JSON
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  /// Convert to Entity
  Item toEntity() => Item(id: id, title: title, description: description);
}
