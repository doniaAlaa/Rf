

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/app_response_model/app_response_model.dart';
import 'package:test2/core/networking/network_helper.dart';
import 'package:test2/leaves_list/models/leaves_list_model.dart';


part 'leaves_cubit_test.freezed.dart';
part 'leaves_state_test.dart';

class ContactsListCubitCubit extends Cubit<LeavesStateTest> {
  static ContactsListCubitCubit get(context) => BlocProvider.of(context);

  ContactsListCubitCubit()
      : 
        super(const LeavesStateTest.initial());

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

   getLeavesList(
      {
  //required String username,
  //     required String password,
  //     required String url,
  //     required String companyId,
    required BuildContext context}
     ) async
    {
      
      emit(const LeavesStateTest.loading());
    ResponseModel? response = await NetworkHelper().get(
        endpoint:
          // '$url/api/Employees/Login?CmpId=$companyId&username=$username&userPassword=$password',

         '/api/Vacations/GetVacationRequestsList?ApprovalStatus=0&CompanyId=100',
        context: context);

   
       if(response != null){
        List body = response.data;

    

        List<LeavesListModel> leavesList =
        body.map((json) => LeavesListModel.fromJson(json)).toList();
        //emit(LeavesListSuccessState(leavesList:leavesList));
              emit( LeavesStateTest.data(
               contacts: leavesList
              ));




       }

     
      
   
   }


   changeName(){
     emit((state as Data).copyWith(contacts: []));
   }

   changeFirstBtn(){
     emit((state as Data).copyWith(firstOne: true));
   }
changeSecBtn(){
     emit((state as Data).copyWith(sec: true
     ));
     print('kkkkkkk');
   }


}