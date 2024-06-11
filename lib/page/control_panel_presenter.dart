import 'dart:convert';
import 'dart:io';
// import 'dart:js';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:location/location.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/api/rest_api.dart';
import 'package:test2/models/employee.dart';
import 'package:test2/utils/local_db.dart';

// import 'package:location/location.dart';
// import 'package:network_info_plus/network_info_plus.dart';

// import '../api/rest_api.dart';
// import '../models/employee.dart';
// import '../utils/local_db.dart';

abstract class ControlPanelContract {
  void onGetEmployeeArraySuccess();

  void onPostEmployeeDeviceIdSuccess(String? deviceId);

  void onPostEmployeeDeviceIdFailed();

  void onPostEmployeeArraySuccess();

  void onPostEmployeeArrayFailed();

  void onPostEmployeeCheckInSuccess();

  void onPostEmployeeCheckInFailed();

  void onVerifyLocationSuccess([BuildContext? context]);

  void onVerifyLocationFailed(String msg);

  void onVerifyDeviceIdSuccess([BuildContext? context]);

  void onVerifyDeviceIdFailed(String msg);
}

class ControlPanelPresenter {
  final ControlPanelContract _view;
  RestAPI api = RestAPI();

  ControlPanelPresenter(this._view);

  Future<void> getEmployeeArray(String endpoint, String companyId, int employeeId, String employeeName) async {
    HiveBoxes.employeesBox().clear();
           print('ttt${companyId}');
      print('iiii${employeeId}');

    await api.getEmployeesArrays(endpoint, companyId).then((employeesArrays) async {
      print('donia${employeesArrays.runtimeType}');
      
        List<dynamic> data = employeesArrays["data"];
        print(data);
        print(data[0]['CmpId']);
         
      // for (Map employeeArray in employeesArrays) {
      //   if (employeeArray['CmpId'] == companyId && employeeArray['EmpId'] == employeeId.toString()) {
      //     if (LocalDB.getEmployee(employeeId) == null) {
      //       LocalDB.updateEmployee(Employee(
      //           id: employeeId,
      //           name: employeeName,
      //           array: _generateDynamicListToDoubleList(employeeArray['EmpImages'])));
      //     }
      //   }
      // }
       if (data[0]['CmpId'] == companyId && data[0]['EmpId'] == employeeId.toString()) {
          if (LocalDB.getEmployee(employeeId) == null) {
            LocalDB.updateEmployee(Employee(
                id: employeeId,
                name: employeeName,
                array: _generateDynamicListToDoubleList(data[0]['EmpImages'])));
          }
        }
    });
    _view.onGetEmployeeArraySuccess();
  }

  Future<void> postEmployeeArray(String endpoint, String companyId) async {
    for (Map employeeMap in LocalDB.getEmployees()) {
      await api.postEmployeeArrays(endpoint, companyId, employeeMap).then((value) {
        if (value == true) {
          LocalDB.updateEmployee(Employee.fromJson(employeeMap, synced: true));
          _view.onPostEmployeeArraySuccess();
        } else {
          _view.onPostEmployeeArrayFailed();
        }
      });
    }
  }

  Future<void> postEmployeeCheckIn(String endpoint, String companyId, int employeeId, DateTime dateTime) async {
    await api.postCheckIn(endpoint, companyId, employeeId, dateTime).then((value) async {
      print('value:$value');
      if (value == true) {
        print('onPostEmployeeCheckInSuccess');
        _view.onPostEmployeeCheckInSuccess();
      } else {
        _view.onPostEmployeeCheckInFailed();
      }
    });
  }

  Future<void> postEmployeeDeviceId(String endpoint, String companyId, int employeeId) async {
    String? deviceId = await _getDeviceId();
    print(deviceId);

    if (deviceId != null) {
      await api.postEmployeeDeviceId(endpoint, companyId, employeeId, deviceId).then((value) async {
        print(value);
        if (value == 1) {
          _view.onPostEmployeeDeviceIdSuccess(deviceId);
        } else {
          _view.onPostEmployeeDeviceIdFailed();
        }
      });
    }
  }

  Future<void> verifyLocation(businessUnitResult,[BuildContext? context]) async {
    print(context?.mounted);
    LocationData locationData = await Location().getLocation();

    // print(businessUnitResult);
    Map data = businessUnitResult["data"];
        // print(data);
        // print(data['latitude']);


    double distance = _calculateDistance(
        lat1: locationData.latitude!,
        lon1: locationData.longitude!,
        lat2: double.parse(data['latitude']),
        lon2: double.parse(data['longitude']));

    String? wifiBSSID = await NetworkInfo().getWifiBSSID();

    if ((wifiBSSID != null &&
            businessUnitResult['MacAdrresslist'] != null &&
            ((businessUnitResult['MacAdrresslist'] as List).contains(wifiBSSID.toUpperCase()) ||
                (businessUnitResult['MacAdrresslist'] as List).contains(wifiBSSID.toLowerCase()))) ||
       // (businessUnitResult['MacAdrresslist'] as List).contains('74:da:88:7f:68:ba')) ||
        distance < 0.1) {

      _view.onVerifyLocationSuccess(context);
      print('onVerifyLocationSuccess');
    } else {
      _view.onVerifyLocationFailed('Invalid Location/Wi-Fi Network\nMAC Address = $wifiBSSID');
            print('onVerifyLocationFailed');

    }
  }

  Future<void> verifyDeviceId(String? registeredDeviceId,[BuildContext? context]) async {
    String? currentDeviceId = await _getDeviceId();

    if (registeredDeviceId != null && currentDeviceId == registeredDeviceId) {
      _view.onVerifyDeviceIdSuccess(context);
      print('yyyyyyyyyyy');
    } else {
      _view.onVerifyDeviceIdFailed('Device ID doesn\'t match \nDevice ID = $currentDeviceId');
    }
  }

  static List<double> _generateDynamicListToDoubleList(List<dynamic> dynamicList) {
    List<double> doubleList = [];
    for (var element in dynamicList) {
      doubleList.add(element);
    }
    return doubleList;
  }

  double _calculateDistance({required double lat1, required double lon1, required double lat2, required double lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<String?> _getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return null;
  }
}
