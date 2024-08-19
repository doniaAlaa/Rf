import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/const/app_colors.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';
import 'package:test2/new_leaves/cubit/new_leaves_cubit.dart';
import 'package:test2/new_leaves/models/get_employees_model.dart';

class EmployeesBottomSheet{
  final _formKey = GlobalKey<FormState>();

  openEmployeesBottomSheet(BuildContext context, {required NewLeavesState state,required  dynamic Function(String) onPress,required  bool loading,
 // required  EmployeeModel selectedEmployee
   }){

    TextEditingController employeeController = TextEditingController();
      return showModalBottomSheet<void>(
            context: context,
            backgroundColor: Colors.white,
            builder: (innerContext) {
              final cubit = NewLeavesCubit();
        return BlocProvider.value(
          value: BlocProvider.of<NewLeavesCubit>(context,listen: true),
          child: BlocBuilder<NewLeavesCubit, NewLeavesState>(
          builder: (context,state){
            return SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key:  _formKey  ,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       Text(
                               'Search By Employee Name',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 16),
                           child: Row(
                             children: [
                               SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.7,
                                            //  height: 60,
                                              child: TextFormField(

                                                controller: employeeController,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter employee name';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    hintText: 'Search By Employee Name',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                          vertical: 10
                                                    ),
                                                    hintStyle: TextStyle(fontSize: 12,color: Color.fromARGB(255, 168, 165, 165)),
                                                    errorBorder: OutlineInputBorder(

                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12)),
                                                        borderSide: BorderSide(
                                                            color: Colors.black12)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12)),
                                                        borderSide: BorderSide(
                                                            color: Colors.black12)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(12)),
                                                        borderSide: BorderSide(
                                                            color: Colors.black12))
                                                          ),
                                                //  initialValue: 'Cause',
                                              ),
                                            ),
                               SizedBox(width: 10,),
                               PrimaryAppButton(buttonTile: 'search',buttonWidth: 60,buttonHeight: 40, onPress: (){
                            // print(employeeController.text);
                                 if (_formKey.currentState!.validate()) {

                                   onPress(employeeController.text);

                                   ScaffoldMessenger.of(context).showSnackBar(
                                     const SnackBar(content: Text('Processing Data')),
                                   );
                                 }


                               },buttonTitleStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),)
                             ],
                           ),
                         ),
                        context.watch<NewLeavesCubit>().state.employeesLoading?CircularProgressIndicator(color: AppColors.primaryColor,):
                         state.employeeModelList.isEmpty?SizedBox(child: Text('No Data'),):SizedBox(
                                    height: MediaQuery.of(context).size.height*0.15,
                           child: ListView.builder(
                            itemCount: state.employeeModelList.length,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                            return    InkWell(
                              onTap: (){
                                 NewLeavesCubit.get(context).setSelectedEmployee(selectedEmployeeModel: state.employeeModelList[index]);
                                 NewLeavesCubit.get(context).clearEmployeesList();

                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color:  Color.fromARGB(255, 224, 224, 224),)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal:6 ,vertical: 4),
                                          child: Text(
                                               state.employeeModelList[index].emp_name??'',
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color.fromARGB(255, 141, 141, 141),
                                                                  fontWeight: FontWeight.w500),
                                                            ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                           }),
                         )


                      ],
                    ),
                  ),
                ),
              );
         
          }
        )
              
        );
              
            },
          );
 
  }
}