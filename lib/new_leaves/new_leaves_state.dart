import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:test2/new_leaves/models/get_vacation_types_model.dart';

abstract class NewLeavesState {
  const NewLeavesState();
}

// class NewLeavesInitState extends NewLeavesState {
//   final ChatState? test;

//   const NewLeavesInitState({this.test});
// }

class VacationTypesLoadingState extends NewLeavesState {}

class VacationTypesSuccessState extends NewLeavesState {
  final GetVaccationTypesModel getVaccationTypesModel;
  VacationTypesSuccessState({required this.getVaccationTypesModel});
}

class CatchErrorState extends NewLeavesState {}

class ErrorNetworkState extends NewLeavesState {}

class ServerErrorState extends NewLeavesState {}

class ChooseFromDateState extends NewLeavesState {
  final bool chooseFromDate;
  ChooseFromDateState({this.chooseFromDate = false});
}

class ChooseToDateState extends NewLeavesState {
  final bool chooseToDate;
  ChooseToDateState({this.chooseToDate = false});
}

class SetFromDateState extends NewLeavesState {
  final String? setFromDate;
  final String? setToDate;
  final ChatState? test;

  SetFromDateState({this.setFromDate, this.setToDate, this.test});
}

class SetToDateState extends NewLeavesState {
  final String setToDate;
  SetToDateState({this.setToDate = 'Select Date'});
}



class SetLeavesTypesState extends NewLeavesState {
  final int selectedIndex;
  final String? selectedVacId;
  final String selectedVacTitle;

  SetLeavesTypesState(
      {this.selectedIndex = -1,
      this.selectedVacId,
      this.selectedVacTitle = "Leave Type"});
}

class SetApplyDaysState extends NewLeavesState {
  final String? applyDays;
  

  SetApplyDaysState({this.applyDays,});
}
class ChatState extends Equatable {
  const ChatState({
    this.to_token = "",
    this.tt = "",
  });

  final String to_token;
  final String tt;

  ChatState copyWith({
    String? to_token,
  }) {
    return ChatState(
      to_token: to_token ?? this.to_token,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

//////////////////////
///
class NewLeavesInitState extends NewLeavesState {
  final FirstModel? firstModel;
  NewLeavesInitState({this.firstModel});
}

class FirstModel extends Equatable {
  final Color? firstText;
  final Color? secondText;

  const FirstModel({this.firstText, this.secondText});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  FirstModel copyWith({
    final Color? firstText,
    final Color? secondText,
  }) {
    return FirstModel(
      firstText: firstText ?? this.firstText,
      secondText: secondText ?? this.secondText,
    );
  }
}
