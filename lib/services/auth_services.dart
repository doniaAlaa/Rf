// import 'package:rf/core/networking/dio_helper.dart';

// class LoginService {
//   login() async {
//     // NetworkHelper()
//     //     .get(endpoint: 'https://protocoderspoint.com/jsondata/superheros.json');
//     NetworkHelper().get(
//         endpoint:
//             'https://jazhotelshr.com/Apitest/api/Employees/Login?username=M.Kamal&userPassword=1&CmpId=100');
//   }
// }
import 'package:flutter/material.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/networking/network_helper.dart';

abstract class AuthServices {
  login(
      {required String username,
      required String password,
      required String url,
      required String companyId,
      required BuildContext context});
}

class Auth extends AuthServices {
  @override
  login(
      {required String username,
      required String password,
      required String url,
      required String companyId,
      required BuildContext context}) async {

    String? compId = await SecureStorage().getCompId();
    await NetworkHelper().get(
        endpoint:
            '/api/Employees/Login?username=M.Kamal&userPassword=1&CmpId=$compId',
        context: context);
  }
}
