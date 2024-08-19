// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      EmployeeId: json['EmployeeId'] as String?,
      EmployeeName: json['EmployeeName'] as String?,
      PositionId: json['PositionId'] as String?,
      PositionDesc: json['PositionDesc'] as String?,
      UnitId: json['UnitId'] as String?,
      UnitDesc: json['UnitDesc'] as String?,
      EmployeeImage: json['EmployeeImage'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'EmployeeId': instance.EmployeeId,
      'EmployeeName': instance.EmployeeName,
      'PositionId': instance.PositionId,
      'PositionDesc': instance.PositionDesc,
      'UnitId': instance.UnitId,
      'UnitDesc': instance.UnitDesc,
      'EmployeeImage': instance.EmployeeImage,
    };
