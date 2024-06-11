// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vacation_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVaccationTypesModel _$GetVaccationTypesModelFromJson(
        Map<String, dynamic> json) =>
    GetVaccationTypesModel(
      vacationTypes: (json['vacationTypes'] as List<dynamic>?)
          ?.map((e) => VacationType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetVaccationTypesModelToJson(
        GetVaccationTypesModel instance) =>
    <String, dynamic>{
      'vacationTypes': instance.vacationTypes,
    };

VacationType _$VacationTypeFromJson(Map<String, dynamic> json) => VacationType(
      vac_cmp_id: json['vac_cmp_id'] as String?,
      vac_id: json['vac_id'] as String?,
      vac_desc: json['vac_desc'] as String?,
    );

Map<String, dynamic> _$VacationTypeToJson(VacationType instance) =>
    <String, dynamic>{
      'vac_cmp_id': instance.vac_cmp_id,
      'vac_id': instance.vac_id,
      'vac_desc': instance.vac_desc,
    };
