
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';



@JsonSerializable()
class UserModel {
  String? id;
  String? nameEn;
  String? nameAR;
  String? positionID;
  String? positionNameEn;
  String? businessUnitID;
  bool? faceRequired;
  String? macAddress;
 



  UserModel({
    this.id,
    this.nameEn,
    this.nameAR,
    this.positionID,
    this.positionNameEn,
    this.businessUnitID,
    this.faceRequired,
    this.macAddress,

  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

