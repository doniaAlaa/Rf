
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';



@JsonSerializable()
class ProfileModel {
  String? EmployeeId;
  String? EmployeeName;
  String? PositionId;
  String? PositionDesc;
  String? UnitId;
  String? UnitDesc;
  String? EmployeeImage;




  ProfileModel({
    this.EmployeeId,
    this.EmployeeName,
    this.PositionId,
    this.PositionDesc,
    this.UnitId,
    this.UnitDesc,
    this.EmployeeImage,

  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

