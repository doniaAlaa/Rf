
import 'package:json_annotation/json_annotation.dart';

part 'leaves_list_model.g.dart';



@JsonSerializable()
class LeavesListModel {
  int? vacationNO;
  String? vacationDesc;
  String? employeeId;
  String? employeeName;
  int? vacationStatus;
  String? vacationStatusDesc;
  String? vacationDays;
  String? vacationFromDate;
  String? vacationToDate;
  String? requesterId;
  String? requesterName;



  LeavesListModel({
    this.vacationNO,
    this.vacationDesc,
    this.employeeId,
    this.employeeName,
    this.vacationStatus,
    this.vacationStatusDesc,
    this.vacationFromDate,
    this.vacationToDate,
    this.vacationDays,
    this.requesterId,
    this.requesterName,


  });
  factory LeavesListModel.fromJson(Map<String, dynamic> json) =>
      _$LeavesListModelFromJson(json);
}

