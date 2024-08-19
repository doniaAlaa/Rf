


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/const/api_error_handler.dart';
import 'package:test2/core/models/profile_model.dart';
import 'package:test2/core/models/user_model.dart';
import 'package:test2/core/networking/network_helper.dart';
import 'package:test2/leaves_list/models/leaves_list_model.dart';
import 'package:test2/main.dart';
import 'package:test2/new_leaves/models/get_employees_model.dart';
import 'package:test2/new_leaves/models/get_vacation_types_model.dart';



part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static HomeCubit get(context) => BlocProvider.of(context);

  HomeCubit()
      :
        super( const HomeState.data());

  getUserProfileData({ required BuildContext context}) async {
    UserModel? userModel;
    String?   user =   await SecureStorage().getUserModel();
    if(user != null ){
      userModel = UserModel.fromJson(jsonDecode(user??''));
    }
    print(userModel?.id);

    ResponseModel response = await NetworkHelper().get(
        endpoint:
        'https://jazhotelshr.com/Apitest/api/Employees/GetEmployee?CompanyId=$userCompanyId&EmployeeId=${userModel?.id}',
        context: context);
    //print('response =====${response.data?.toString()}');
    // List body = response.data;
    // List body = response.data;
    print('iiiiiiiiiiii${response.data['EmployeeImage']}');
    // List<VacationType> vacationTypeList =
    // body.map((json) => VacationType.fromJson(json)).toList();
    ProfileModel profileModel = ProfileModel.fromJson(response.data);


    emit((state as Data).copyWith(profile:profileModel));

  }

  // getSearchedEmployees({required BuildContext context,required String  employee}) async {
  //   print('doniaaaaaaaaa');
  //   emit((state as Data).copyWith(employeesLoading:true));
  //   print('5555555${state.employeesLoading}');
  //   ResponseModel response = await NetworkHelper().get(
  //       queryParams: {
  //         "CompanyId":"100",
  //         "Search":"Ahmed",
  //         "Skip":"0",
  //         "MaxNumber":"10"
  //       },
  //       endpoint:
  //       //  '$userBaseUrl/api/Employees/GetEmployees?CompanyId=100&Search=Ahmed&Skip=0&MaxNumber=10',
  //       'https://jazhotelshr.com/Apitest/api/Employees/GetEmployees?CompanyId=$userCompanyId&Search=$employee&Skip=0&MaxNumber=10',
  //
  //       context: context);
  //   List body = response.data;
  //
  //
  //   List<EmployeeModel> employeeModelList =
  //   body.map((json) => EmployeeModel.fromJson(json)).toList();
  //
  //   //  print(employeeModelList.first.emp_id);
  //   emit((state as Data).copyWith(employeesLoading:false,employeeModelList: employeeModelList));
  //
  // }
  //
  // appearLeavesList(){
  //   emit((state as Data).copyWith(isLeavesTypeOpened:!(state as Data).isLeavesTypeOpened));
  //   print((state as Data).isLeavesTypeOpened);
  //   print('llllllll');
  //
  // }

  // setSelectedEmployee({required EmployeeModel selectedEmployeeModel}){
  //   emit((state as Data).copyWith(selectedEmployeeModel:selectedEmployeeModel));
  //   print((state as Data).selectedEmployeeModel?.emp_name??'');
  //
  // }
  // clearEmployeesList(){
  //   emit((state as Data).copyWith(employeeModelList:[]));
  //
  // }



  // chooseLeavesType(
  //     {required String selectedId,
  //       required int selectedIndex,
  //       required String leaveType}) {
  //
  //
  //   emit((state as Data).copyWith(selectedIndex: selectedIndex,
  //       selectedVacId: selectedId,
  //       leaveType: leaveType));
  //
  //   emit(state);}
  // openFromCalendar(){
  //
  //   emit((state as Data).copyWith(isFromCalendarOpened:!(state as Data).isFromCalendarOpened
  //   ));
  // }
  // openToCalendar(){
  //   emit((state as Data).copyWith(isToCalendarOpened: !(state as Data).isToCalendarOpened
  //   ));
  // }
  //
  // setFromDate({required String from}){
  //   emit((state as Data).copyWith(from: from
  //   ));
  // }
  //
  // setToDate({required String to}){
  //   emit((state as Data).copyWith(to: to
  //   ));
  // }

  // calculateLeavesDays({required DateTime to, required DateTime from}){
  //   int diff =0;
  //   final difference = to.difference(from).inDays;
  //   //  final state = SetApplyDaysState(applyDays: difference.toString());
  //   diff = difference + 1;
  //   emit((state as Data).copyWith(applyingDuration: diff.toString()
  //   ));
  //
  // }
  //
  // applyNewLeave(
  //     {required BuildContext context,
  //       required Map<String, dynamic> leaveData}) async {
  //   ResponseModel? response;
  //   emit((state as Data).copyWith(applyLeaveLoading: true));
  //   try{
  //     response = await NetworkHelper().post(
  //         endpoint:
  //         '$userBaseUrl/api/Vacations/RequestVacation',
  //         context: context,
  //         data: leaveData,
  //         sendRequestFrom: SendRequestFrom.button);
  //
  //     // print('mmmmmmmmm');
  //     print(response);
  //
  //     if (response != null) {
  //
  //       if (response.succeess == true) {
  //         emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);
  //
  //         return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Color.fromARGB(255, 79, 179, 85),
  //           content: Text(
  //             response.message ?? '',
  //             style: const TextStyle(fontSize: 15,color: Colors.white),
  //           ),
  //         ));
  //
  //       } else {
  //         print('2222');
  //         emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);
  //
  //         return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text(
  //             response.message ?? '',
  //             style: const TextStyle(fontSize: 15),
  //           ),
  //         ));
  //
  //       }
  //     }
  //   }catch(e){
  //     emit((state as Data).copyWith(applyLeaveLoading: false,from: 'From',leaveType: 'leave type',to: 'To',selectedEmployeeModel: null,),);
  //
  //     print('objectyyyyyyyy');
  //     DioApisExceptions().handleDioError(e,SendRequestFrom.button, context);
  //     emit((state as Data).copyWith(applyLeaveLoading: false));
  //
  //
  //   }
  //
  // }



}