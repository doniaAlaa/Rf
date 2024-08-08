
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test2/api/rest_api.dart';
import 'package:test2/authentication/login/presentation/controllers/login_state.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/const/api_error_handler.dart';
import 'package:test2/core/models/user_model.dart';
import 'package:test2/core/networking/network_helper.dart';
import 'package:test2/leaves_list/leaves_list_state.dart';
import 'package:test2/leaves_list/models/leaves_list_model.dart';
import 'package:test2/main.dart';


class LeavesListCubit extends Cubit<LeavesListState> {
  LeavesListCubit(super.initialState);

  static LeavesListCubit get(context) => BlocProvider.of(context);
    RestAPI api = RestAPI();


    getLeavesList(
      {
       int status = 0,
  //required String username,
  //     required String password,
  //     required String url,
  //     required String companyId,
    required BuildContext context}
     ) async
    {
    emit(LeavesListLoadingState());
     

    print('=====================================${userCompanyId}');
    ResponseModel? response = await NetworkHelper().get(
        endpoint:
              // '$url/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password',
        'https://jazhotelshr.com/Apitest/api/Vacations/GetVacationRequestsList?ApprovalStatus=$status&CompanyId=$userCompanyId',
        context: context);

   
       if(response != null){
        List body = response.data;

        List<LeavesListModel> leavesList =
        body.map((json) => LeavesListModel.fromJson(json)).toList();
        emit(LeavesListSuccessState(leavesList:leavesList));



       }

     
      
   
   }



     acceptLeaveReqquest(
      {
     //required String username,
      required String employeeId,
      required String requestNo,
      required String comment,

    required BuildContext context}
     ) async
    {
    // emit(LeavesListLoadingState());
    // print('actionOnLeaveReqquest:$requestNo');
    ResponseModel? response = await NetworkHelper().post(
       sendRequestFrom: SendRequestFrom.button,
       queryParams: {
        "CompanyId":"${userCompanyId}",
        "RequestNo":employeeId,
        "EmployeeId":requestNo,
        "Comment":comment,

        
       },
      
        endpoint:
          // '$url/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password',
        
         'https://jazhotelshr.com/Apitest/api/Vacations/ApproveVacationRequest?CompanyId=$userCompanyId&RequestNo=$requestNo&EmployeeId=$employeeId&Comment=test',
        context: context);

   
       if(response != null){
            print('actionOnLeaveReqquesttttt');

         getLeavesList(context: context);


       }

       

     
      
   
   }
  

     rejectLeaveRequest(
      {
     //required String username,
      required String employeeId,
      required String requestNo,
      required String comment,

    required BuildContext context}
     ) async
    {
    // emit(LeavesListLoadingState());
    // print('actionOnLeaveReqquest:$requestNo');
    ResponseModel? response = await NetworkHelper().post(
       sendRequestFrom: SendRequestFrom.button,
       queryParams: {
        "CompanyId":"${userCompanyId}",
        "RequestNo":employeeId,
        "EmployeeId":requestNo,
        "Comment":comment,

        
       },
      
        endpoint:
          // '$url/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password',
        
         'https://jazhotelshr.com/Apitest/api/Vacations/RejectVacationRequest?CompanyId=$userCompanyId&RequestNo=$requestNo&EmployeeId=$employeeId&Comment=test',
        context: context);

   
       if(response != null){
            print('actionOnLeaveReqquesttttt');

         getLeavesList(context: context);


       }

       

     
      
   
   }

  

}
