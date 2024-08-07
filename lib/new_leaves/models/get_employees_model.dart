import 'package:json_annotation/json_annotation.dart';
import 'package:test2/models/employee.dart';

part 'get_employees_model.g.dart';

@JsonSerializable()
class GetEmployees {
  List<EmployeeModel>? employees;
  // int status;
  // String? message;

  GetEmployees({
    this.employees,
    // required this.status,
    // this.message
  });
  factory GetEmployees.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeesFromJson(json);
}

@JsonSerializable()
class EmployeeModel {
  String? emp_id;
  String? emp_name;
  String? emp_name_;

  EmployeeModel({this.emp_id, this.emp_name, this.emp_name_

      // this.message
      });
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
