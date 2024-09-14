import 'package:test2/core/app_local_db/app_local_db.dart';

import '../api/rest_api.dart';

abstract class AttendanceContract {
  void onGetEmployeeCheckInsSuccess(employeeAttendance);

  void onGetEmployeeCheckInsFailed();
}

class AttendancePresenter {
  final AttendanceContract _view;
  RestAPI api = RestAPI();

  AttendancePresenter(this._view);

  Future<void> getEmployeeAttendance(String endpoint, String companyId, int employeeId, String date) async {
    String?   compId =   await SecureStorage().getCompId();

    await api.getEmployeeAttendance('https://jazhotelshr.com/Apitest', compId??'', employeeId, date).then((employeeAttendance) async {

      if (employeeAttendance is Map) {
        _view.onGetEmployeeCheckInsSuccess(employeeAttendance);
        print('onGetEmployeeCheckInsSuccess');
      } else {
        _view.onGetEmployeeCheckInsFailed();
                print('onGetEmployeeCheckInsFailed');

      }
    });
  }
}
