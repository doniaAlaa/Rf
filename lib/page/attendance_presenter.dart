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
    print('xxxxxxxxxx');
    await api.getEmployeeAttendance(endpoint, companyId, employeeId, date).then((employeeAttendance) async {
          print('vvvvvvv');

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
