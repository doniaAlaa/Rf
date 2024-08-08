part of 'new_leaves_cubit.dart';

@freezed
class NewLeavesState with _$NewLeavesState {
 
   const factory NewLeavesState.data(
  
      {
            @Default('From')  String from ,
            @Default('To') String to,
            @Default(false)  bool isFromCalendarOpened ,
            @Default(false)  bool isToCalendarOpened ,
            @Default(false)  bool isLeavesTypeOpened ,
            @Default(false)  bool employeesLoading ,


           // @Default( DateTime.now())  DateTime focusedDay ,
          //   DateTime? fromSelectedDay ,
          // //  @Default(DateTime.now()) DateTime toFocusedDay  ,
          //   DateTime? toSelectedDay ,
            String? applyingDuration,
            bool? loadingLeavesType,
            @Default('leave type') String leaveType,
            @Default(false)  bool leavesTypeLoading ,
            @Default(false)  bool applyLeaveLoading ,
            @Default([]) List<VacationType>? vacationTypes,
            @Default(-1) int selectedIndex,
            @Default('') String selectedVacId,
            @Default([]) List<EmployeeModel> employeeModelList,
            EmployeeModel? selectedEmployeeModel,





            // final String selectedVacTitle,


 


        }) = Data;
  
}