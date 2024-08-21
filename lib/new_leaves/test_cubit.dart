
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/const/api_error_handler.dart';
import 'package:test2/core/networking/network_helper.dart';
import 'package:test2/new_leaves/models/get_vacation_types_model.dart';

import 'package:test2/new_leaves/new_leaves_state.dart';

class TestCubit extends Cubit<NewLeavesState> {
  TestCubit(NewLeavesInitState super.initialState);

  static TestCubit get(context) => BlocProvider.of(context);

  // String setFromDate = 'Select Date';
  // String setToDate = 'Select Date';
  FirstModel? firstModel;

  getVacationTypes({required int cmpId, required BuildContext context}) async {
    emit(VacationTypesLoadingState());
    ResponseModel response = await NetworkHelper().get(
        endpoint:
            '/api/Vacations/GetVacationTypes?cmpId=100',
        context: context);
    print('response =====${response.data?.toString()}');
    List body = response.data;

    List<VacationType> vacationTypeList =
        body.map((json) => VacationType.fromJson(json)).toList();
    emit(VacationTypesSuccessState(
        getVaccationTypesModel:
            GetVaccationTypesModel(vacationTypes: vacationTypeList)));
  }

  selectFromDate({required String fromDate}) {
    // setFromDate = fromDate;
    emit(SetFromDateState(setFromDate: fromDate));
    // setFromDate = fromDate;
    // emit(state);
  }

  TestState1() {
    firstModel?.copyWith(firstText: Colors.black12);
    emit(NewLeavesInitState(
        firstModel: firstModel?.copyWith(firstText: Colors.black12)));
  }

  TestState2() {
    firstModel?.copyWith(secondText: Colors.green);

    emit(state);
  }

  selectToDate({required String toDate}) {
    final state = SetToDateState(setToDate: toDate);
    emit(state);
  }

  chooseFromDate({required bool chooseFromDate}) {
    // final state = ChooseFromDateState();
    // if (state.chooseFromDate == false) {
    //   emit(ChooseFromDateState(chooseFromDate: true));
    // } else {
    //   emit(ChooseFromDateState(chooseFromDate: false));
    // }
    emit(ChooseFromDateState(chooseFromDate: chooseFromDate));
  }

  chooseToDate({required bool chooseToDate}) {
    final state = ChooseToDateState(chooseToDate: chooseToDate);
    emit(state);
  }

  chooseLeavesType(
      {required String selectedId,
      required int selectedIndex,
      required String leaveType}) {
    final state = SetLeavesTypesState(
        selectedIndex: selectedIndex,
        selectedVacId: selectedId,
        selectedVacTitle: leaveType);
    emit(state);
  }

  // test() {
  //   // bool cc = s;
  //   // final state = state.cop
  //   final state = NewLeavesInitState();
  //   state.test?.copyWith(to_token: 'ppp');
  //   emit(state);
  //   print('object');
  //   print(state.test?.to_token);
  // }

  applyNewLeave(
      {required BuildContext context,
      required Map<String, dynamic> leaveData}) async {
    ResponseModel? response;
    response = await NetworkHelper().post(
        endpoint:
            '/api/Vacations/RequestVacation',
        context: context,
        data: leaveData,
        sendRequestFrom: SendRequestFrom.button);

    if (response != null) {
      if (response.succeess == true) {
        print('lll');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            response.message ?? '',
            style: const TextStyle(fontSize: 15),
          ),
        ));
      }
    }
  }

  tesst({
    required BuildContext context,
  }) async {
    // print('hhhhhhhhhhhhhhhhhhhhhhhh');
    ResponseModel? response;
    response = await NetworkHelper().post(
        endpoint:
            '/api/Vacations/ApproveVacationRequest?CompanyId=100&RequestNo=2766&EmployeeId=VM0371&Comment=test',
        context: context,
        // data: leaveData,
        sendRequestFrom: SendRequestFrom.button);

    if (response != null) {
      if (response.succeess == true) {
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            response.message ?? '',
            style: const TextStyle(fontSize: 15),
          ),
        ));
      }
    }
  }
}
