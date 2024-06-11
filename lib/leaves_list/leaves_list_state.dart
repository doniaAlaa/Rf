import 'package:test2/leaves_list/models/leaves_list_model.dart';

abstract class LeavesListState {}

class LeavesListInitState extends LeavesListState {}

class LeavesListLoadingState extends LeavesListState {}

class LeavesListSuccessState extends LeavesListState {
  final  List<LeavesListModel> leavesList;
  
  LeavesListSuccessState({required this.leavesList});
}

class CatchErrorState extends LeavesListState {}

class ErrorNetworkState extends LeavesListState {}

class ServerErrorState extends LeavesListState {}
