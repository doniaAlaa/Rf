// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaves_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeavesListModel _$LeavesListModelFromJson(Map<String, dynamic> json) =>
    LeavesListModel(
      vacationNO: (json['vacationNO'] as num?)?.toInt(),
      vacationDesc: json['vacationDesc'] as String?,
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      vacationStatus: (json['vacationStatus'] as num?)?.toInt(),
      vacationStatusDesc: json['vacationStatusDesc'] as String?,
      vacationFromDate: json['vacationFromDate'] as String?,
      vacationToDate: json['vacationToDate'] as String?,
      vacationDays: json['vacationDays'] as String?,
      requesterId: json['requesterId'] as String?,
      requesterName: json['requesterName'] as String?,
    );

Map<String, dynamic> _$LeavesListModelToJson(LeavesListModel instance) =>
    <String, dynamic>{
      'vacationNO': instance.vacationNO,
      'vacationDesc': instance.vacationDesc,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'vacationStatus': instance.vacationStatus,
      'vacationStatusDesc': instance.vacationStatusDesc,
      'vacationDays': instance.vacationDays,
      'vacationFromDate': instance.vacationFromDate,
      'vacationToDate': instance.vacationToDate,
      'requesterId': instance.requesterId,
      'requesterName': instance.requesterName,
    };
