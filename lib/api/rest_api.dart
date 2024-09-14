import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/employee.dart';

class RestAPI {
  final client = Dio();

  Future<dynamic> getData(String url) async {
    print('hhhhhhhhhhllll');
    print(url);
    try {
      final response = await client.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        return response.data;
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      debugPrint(error.toString());
      return {'error': error};
    }
  }

  Future<dynamic> postData(String url, {Map<String, dynamic>? headers, dynamic data}) async {
    try {
      final response = await client.post(url, options: Options(headers: headers), data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        debugPrint('UNS : ${response.requestOptions.path}');
        debugPrint('UNS : ${response.requestOptions.data}');
        return response.data;
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
      }
    } on DioException catch (exception) {
      debugPrint(exception.message);
      try {
        return {'error': exception.response!.data['message']};
      } catch (error) {
        return {'error': 'An error occurred, please check your internet connection and try again'};
      }
    } catch (error) {
      debugPrint(error.toString());
      return {'error': error};
    }
  }

  Future<dynamic> login(String endpoint, String companyId, String username, String password) async {
    return getData('$endpoint/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password');
  }

  Future<dynamic> getEmployeeBusinessUnitData(String endpoint, String companyId, String unitId) async {
    return getData('$endpoint/api/Employees/GetEmployeeBusinessUnitData?CmpId=$companyId&UnitId=$unitId');
  }

  // Future<dynamic> getEmployees(String endpoint) async {
  //   return getData('$endpoint/api/Employees/GetEmployees?CmpId=${await PrefsUtils.rxPrefs.getString('company_id')}');
  // }

  Future<dynamic> getEmployeesArrays(String endpoint, String companyId) async {
    return getData('$endpoint/api/Employees/GetEmployeesImages?CmpId=$companyId');
  }

  Future<dynamic> postEmployeeArrays(String endpoint, String companyId, Map employeeMap) async {
    return postData('$endpoint/api/Employees/AddEmployeeImages',
        data: {"CmpId": companyId, "EmpId": employeeMap[Employee.idKey], "EmpImages": employeeMap[Employee.arrayKey]});
  }

  Future<dynamic> postCheckIn(String endpoint, String companyId, int employeeId, DateTime dateTime) async {
    return postData('$endpoint/api/Employees/EmployeeTimeAttendance', data: [
      {
        "CompanyId": companyId,
        "EmployeeId": employeeId,
        "AttendanceDate": DateFormat('yyyy/MM/dd').format(dateTime),
        "CheckTime": DateFormat('yyyy/MM/dd HH:mm:ss').format(dateTime),
        "MachineName": 'rf_mobile'
      }
    ]);
  }

  Future<dynamic> postEmployeeDeviceId(String endpoint, String companyId, int employeeId, String deviceId) async {
    return postData(
        '$endpoint/api/Employees/SetEmployeeMacAddress?CmpId=$companyId&EmpId=$employeeId&MacAddress=$deviceId');
  }

  Future<dynamic> getEmployeeAttendance(String endpoint, String companyId, int employeeId, String date) async {
    return getData('$endpoint/api/Employees/GetEmployeeAttendance?CmpId=100&EmpID=2&AttDate=$date');
  }

  Future<dynamic> getLeavesList(String endpoint, String companyId, String unitId) async {
    return getData('$endpoint/api/Employees/GetEmployeeBusinessUnitData?CmpId=$companyId&UnitId=$unitId');
  }
}
