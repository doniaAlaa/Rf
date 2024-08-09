
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test2/api/rest_api.dart';
import 'package:test2/authentication/login/presentation/controllers/login_state.dart';
// import 'package:test2/core/app_local_db/app_cached_db.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
// import 'package:test2/core/models/user_model.dart';
import 'package:test2/core/networking/network_helper.dart';
import 'package:test2/main.dart';
import 'package:test2/page/control_panel_page.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(super.initialState);

  static LoginCubit get(context) => BlocProvider.of(context);
    RestAPI api = RestAPI();


  login(
      {required String username,
      required String password,
      required String url,
      required String companyId,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    ResponseModel? response = await NetworkHelper().get(
        endpoint:
           '$url/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password',

       //   'https://jazhotelshr.com/Apitest/api/Employees/Login?UserName=2&UserPassword=1&CmpID=100',
        context: context);

   
       if(response != null){
         print(response.toString());
         if(response.succeess == true){
           emit(LoginSuccessState());

           Map<String, dynamic> userMap = response.data ;

           var json = jsonEncode(userMap);
           SecureStorage().setUserModel(json.toString());


           userCompanyId =  companyId;
           userBaseUrl = url;
           requesterId = int.parse(response.data['id']);
           userName = response.data['nameEn'];


           await api
               .getEmployeeBusinessUnitData(url, companyId, response.data['businessUnitID'])

               .then((businessUnitResult) async {


             Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => ControlPanelPage(
                     endpoint: url.trim(),
                     companyId: companyId.trim(),
                     businessUnitResult: businessUnitResult,
                     loginResult: response.data)));





           });

         }




       }

     
      
   
    }
}
