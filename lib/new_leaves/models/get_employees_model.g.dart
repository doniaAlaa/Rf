// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employees_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmployees _$GetEmployeesFromJson(Map<String, dynamic> json) => GetEmployees(
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetEmployeesToJson(GetEmployees instance) =>
    <String, dynamic>{
      'employees': instance.employees,
    };

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      emp_id: json['emp_id'] as String?,
      emp_name: json['emp_name'] as String?,
      emp_name_: json['emp_name_'] as String?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'emp_id': instance.emp_id,
      'emp_name': instance.emp_name,
      'emp_name_': instance.emp_name_,
    };
