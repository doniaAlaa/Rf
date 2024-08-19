part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState{

      const factory HomeState.data(

          {

                @Default(false)  bool applyLeaveLoading ,

                 ProfileModel? profile,





                // final String selectedVacTitle,





          }) = Data;

}