


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/const/api_error_handler.dart';
import 'package:test2/core/networking/network_helper.dart';
// import 'package:test2/leaves_list/models/leaves_list_model.dart';
// import 'package:test2/main.dart';
import 'package:test2/new_leaves/models/get_employees_model.dart';
import 'package:test2/new_leaves/models/get_vacation_types_model.dart';


part 'new_leaves_cubit.freezed.dart';
part 'new_leaves_state.dart';

class NewLeavesCubit extends Cubit<NewLeavesState> {
  static NewLeavesCubit get(context) => BlocProvider.of(context);

  NewLeavesCubit()
      : 
        super(const NewLeavesState.data());

  // Future<void> findAll() async {
  //   try {
  //     emit(const LeavesStateTest.loading());
  //     final contacts = await _repository.findAll();
  //     await Future.delayed(const Duration(seconds: 1));
  //     emit(LeavesStateTest.data(contacts: contacts));
  //   } catch (e, s) {
  //     log('Erro ao buscar contatos', error: e, stackTrace: s);
  //     emit(const LeavesStateTest.error(
  //         message: 'Erro ao buscar contatos'));
  //   }
  // }

  // Future<void> delete(ContactModel model) async {
  //   emit(const LeavesStateTest.loading());
  //   await _repository.delete(model);
  //   await findAll();
  // }

  

//    changeName(){
//      emit((state as Data).copyWith(contacts: []));
//    }

//    changeFirstBtn(){
//      emit((state as Data).copyWith(firstOne: true));
//    }

getVacationTypes({required int cmpId, required BuildContext context}) async {
    // emit(VacationTypesLoadingState());
  String? compId = await SecureStorage().getCompId();

  emit((state as Data).copyWith(leavesTypeLoading:true));
    ResponseModel response = await NetworkHelper().get(
        endpoint:
            '/api/Vacations/GetVacationTypes?cmpId=$compId',
        context: context);
    // print('response =====${response.data?.toString()}');
    List body = response.data;

    List<VacationType> vacationTypeList =
        body.map((json) => VacationType.fromJson(json)).toList();
   
    emit((state as Data).copyWith(leavesTypeLoading:false,vacationTypes: vacationTypeList,));

  }

  getSearchedEmployees({required BuildContext context,required String  employee}) async {
        emit((state as Data).copyWith(employeesLoading:true));
        String?   compId =   await SecureStorage().getCompId();

    ResponseModel response = await NetworkHelper().get(
      queryParams: {
        "CompanyId":compId,
        "Search":"${employee}",
        "Skip":"0",
        "MaxNumber":"10"
      },
        endpoint:
          //  '$userBaseUrl/api/Employees/GetEmployees?CompanyId=100&Search=Ahmed&Skip=0&MaxNumber=10',
             '/api/Employees/GetEmployees?CompanyId=$compId&Search=$employee&Skip=0&MaxNumber=10',

        context: context);
    List body = response.data;
  

    List<EmployeeModel> employeeModelList =
        body.map((json) => EmployeeModel.fromJson(json)).toList();

      //  print(employeeModelList.first.emp_id);
        emit((state as Data).copyWith(employeesLoading:false,employeeModelList: employeeModelList));

  }

  appearLeavesList(){
        emit((state as Data).copyWith(isLeavesTypeOpened:!(state as Data).isLeavesTypeOpened));
        print((state as Data).isLeavesTypeOpened);
        print('llllllll');

  }

  setSelectedEmployee({required EmployeeModel selectedEmployeeModel}){
        emit((state as Data).copyWith(selectedEmployeeModel:selectedEmployeeModel));
        print((state as Data).selectedEmployeeModel?.emp_name??'');

  }
  clearEmployeesList(){
        emit((state as Data).copyWith(employeeModelList:[]));

  }



  chooseLeavesType(
      {required String selectedId,
      required int selectedIndex,
      required String leaveType}) {
   

    emit((state as Data).copyWith(selectedIndex: selectedIndex,
        selectedVacId: selectedId,
        leaveType: leaveType));

    emit(state);}
openFromCalendar(){
 
  emit((state as Data).copyWith(isFromCalendarOpened:!(state as Data).isFromCalendarOpened
     ));
}
openToCalendar(){
   emit((state as Data).copyWith(isToCalendarOpened: !(state as Data).isToCalendarOpened
     ));
}

setFromDate({required String from}){
     emit((state as Data).copyWith(from: from
     ));
   }

   setToDate({required String to}){
     emit((state as Data).copyWith(to: to
     ));
   }

   calculateLeavesDays({required DateTime to, required DateTime from}){
      int diff =0;
       final difference = to.difference(from).inDays;
      //  final state = SetApplyDaysState(applyDays: difference.toString());
      diff = difference + 1;
       emit((state as Data).copyWith(applyingDuration: diff.toString()
     ));

   }

    applyNewLeave(
      {required BuildContext context,
      required Map<String, dynamic> leaveData}) async {
    ResponseModel? response;
     emit((state as Data).copyWith(applyLeaveLoading: true));
    try{

      response = await NetworkHelper().post(
        endpoint:
            '/api/Vacations/RequestVacation',
        context: context,
        data: leaveData,
        sendRequestFrom: SendRequestFrom.button);

        // print('mmmmmmmmm');

    if (response != null) {
     
      if (response.succeess == true) {
            emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);

         return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 79, 179, 85),
          content: Text(
            response.message ?? '',
            style: const TextStyle(fontSize: 15,color: Colors.white),
          ),
        ));
        
      } else {
            // emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);
            emit((state as Data).copyWith(applyLeaveLoading: false,),);

        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            response.message ?? '',
            style: const TextStyle(fontSize: 15),
          ),
        ));
        
      }
    }
    }catch(e){
      //emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);
      emit((state as Data).copyWith(applyLeaveLoading: false),);


      print(e);
            DioApisExceptions().handleDioError(e,SendRequestFrom.button, context);
                        emit((state as Data).copyWith(applyLeaveLoading: false));


    }
   
  }



}