import 'package:json_annotation/json_annotation.dart';
import 'package:home/home.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends Item {
  ItemModel({required super.id, required super.title});

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
