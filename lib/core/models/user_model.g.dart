// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAR: json['nameAR'] as String?,
      positionID: json['positionID'] as String?,
      positionNameEn: json['positionNameEn'] as String?,
      businessUnitID: json['businessUnitID'] as String?,
      faceRequired: json['faceRequired'] as bool?,
      macAddress: json['macAddress'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'nameEn': instance.nameEn,
      'nameAR': instance.nameAR,
      'positionID': instance.positionID,
      'positionNameEn': instance.positionNameEn,
      'businessUnitID': instance.businessUnitID,
      'faceRequired': instance.faceRequired,
      'macAddress': instance.macAddress,
    };
