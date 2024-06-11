import 'package:json_annotation/json_annotation.dart';

part 'get_vacation_types_model.g.dart';

@JsonSerializable()
class GetVaccationTypesModel {
  List<VacationType>? vacationTypes;
  // int status;
  // String? message;

  GetVaccationTypesModel({
    this.vacationTypes,
    // required this.status,
    // this.message
  });
  factory GetVaccationTypesModel.fromJson(Map<String, dynamic> json) =>
      _$GetVaccationTypesModelFromJson(json);
}

@JsonSerializable()
class VacationType {
  String? vac_cmp_id;
  String? vac_id;
  String? vac_desc;

  VacationType({this.vac_cmp_id, this.vac_id, this.vac_desc

      // this.message
      });
  factory VacationType.fromJson(Map<String, dynamic> json) =>
      _$VacationTypeFromJson(json);
}
