part of 'leaves_cubit_test.dart';

@freezed
class LeavesStateTest with _$LeavesStateTest {
  const factory LeavesStateTest.initial() = _Initial;
  const factory LeavesStateTest.loading() = _Loading;
  const factory LeavesStateTest.data(
  
      {
        required List<LeavesListModel> contacts,
          @Default(false)  bool firstOne ,
               @Default(false) bool sec,

        }) = Data;
  const factory LeavesStateTest.error({required String message}) =
      _Error;
}