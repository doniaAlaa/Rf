import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/const/app_colors.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';
import 'package:test2/leaves_list/leaves_list_cubit.dart';
import 'package:test2/leaves_list/leaves_list_state.dart';
import 'package:test2/leaves_list/models/leaves_list_model.dart';

// enum LeavesStatus {awaiting,approved,declined,}
class LeavesListPage extends StatelessWidget {
  LeavesListPage({super.key});
     List<String> list = <String>['New', 'Approved Leaves', 'Rejected Leaves',];

  List leaves = [
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xffedcc53),
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Slick",
      "status": "Approved",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Declined",
      "color": const Color(0xffedcc53)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Slick",
      "status": "Awaiting",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xffedcc53)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Approved",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Declined",
      "color": const Color(0xffedcc53)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xffedcc53)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Approved",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Declined",
      "color": const Color(0xffedcc53)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xff9694d3)
    },
    {
      "title": "Half Day Application",
      "time": "Wed, 16 Dec",
      "type": "Casual",
      "status": "Awaiting",
      "color": const Color(0xffedcc53)
    },
  ];

  @override
  Widget build(BuildContext context) {
        //  List<String> list = <String>['New', 'Approved Leaves', 'Rejected Leaves',];

      String dropdownValue = list.first;
   

    print('nnnnnnnnnnnnnnn');
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20, right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 InkWell(
                   onTap: (){
                    Navigator.pop(context);
                   },
                   child:const SizedBox(
                    height: 40,
                    width: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:Color.fromARGB(116, 213, 213, 213),
                          // Color.fromARGB(255, 91, 99, 220),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notification_add_outlined,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color:Color(0xfff1c1cd),
                            // Color.fromARGB(255, 91, 99, 220),
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      body: BlocProvider(
            create: (context) => LeavesListCubit(LeavesListInitState())..getLeavesList(context: context),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LeavesWidget()
        ),
      ),
    );
  }
}
class LeavesWidget extends StatelessWidget {
   LeavesWidget({super.key});
            List<String> list = <String>['New', 'Approved Leaves', 'Rejected Leaves',];



  @override
  Widget build(BuildContext context) {
            String dropdownValue = list.first;

    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Leaves',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                Text('Filter Leaves Requests : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
             
             
              ],),
              SizedBox(height: 10,),
               Row(children: [
                StatefulBuilder(
                  builder: (context,setState) {
                    return SizedBox(
                      height: 40,
                      // width: 200,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButton<String>(
                                value: dropdownValue,
                                
                                icon: const Icon(Icons.filter_alt_outlined),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.black,
                                // ),
                                underline: SizedBox(),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                  
                                },
                                items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      child: Text(value)),
                                  );
                                }).toList(),
        
                              ),
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(width: 10,),
                PrimaryAppButton(
                  buttonWidth: 70,
                  buttonHeight: 40,
                  buttonRadius: 20,
                  buttonColor: Colors.black,
                  buttonTitleStyle: TextStyle(fontSize: 14,color: Colors.white),
                  buttonTile: 'Filter', onPress: (){
                      //   LeavesListCubit.get(context).acceptLeaveReqquest(context: context, employeeId: '1', requestNo: '6', comment: '');
                        // LeavesListCubit(LeavesListInitState())..getLeavesList(context: context);
                            // BlocProvider.of<LeavesListCubit>(context).getLeavesList(context: context);
                  context.read<LeavesListCubit>().getLeavesList(context: context,status: 0);
        
        
                  })
              ],),
              const SizedBox(
                height: 30,
              ),
             
         
           BlocBuilder<LeavesListCubit, LeavesListState>(
                  //  bloc: BlocProvider.of<LeavesListCubit>(context),
                  builder: (context, state) {
                    print('BlocBuilderBlocBuilderBlocBuilder');
                    if (state is LeavesListLoadingState) {
                      return Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                      );
                    }
                    //  if (state is UserErrorState) {
                    //   return const Center(child:  Text("Error"));
                    // }
                    else if (state is LeavesListSuccessState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.60,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.leavesList.length,
                            itemBuilder: (context, index) {
                            
                                return LeavesFirstCard(leavesListModel: state.leavesList[index],);
                            }),
                      );
                  
                    }
        
                    return Container();
                  },
                ),
            
            ],
          );
       
  }
}
class LeavesFirstCard extends StatelessWidget {
  final   LeavesListModel leavesListModel;
  const LeavesFirstCard({required this.leavesListModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const Padding(
                                  //   padding:
                                  //       EdgeInsets.only(bottom: 8, right: 16, left: 16),
                                  //   child: Text(
                                  //     'calendar 2023',
                                  //     style: TextStyle(
                                  //         fontSize: 16,
                                  //         color: Colors.grey,
                                  //         fontWeight: FontWeight.w700),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: const Color.fromARGB(
                                                  58, 193, 190, 190)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Employee Name :',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                     SizedBox(
                                                      width: 150,
                                                       child: Text(
                                                        '${leavesListModel.employeeName}',
                                                        style: const TextStyle(
                                                          overflow: TextOverflow.ellipsis,
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                            fontWeight: FontWeight.w700),
                                                                                                           ),
                                                     ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        // color: leaves[index]
                                                        //             ['status'] ==
                                                        //         'Awaiting'
                                                        //     ? const Color(0xfffef1be)
                                                        //     : leaves[index]['status'] ==
                                                        //             'Approved'
                                                        //         ? const Color(
                                                        //             0xffb4f6d2)
                                                        //         : leaves[index]
                                                        //                     [
                                                        //                     'status'] ==
                                                        //                 'Declined'
                                                        //             ? const Color(
                                                        //                 0xffffebeb)
                                                        //             : const Color(
                                                        //                 0xfffef1be),
                                                        color: Color(
                                                                        0xfffef1be),
                                                        borderRadius:
                                                            const BorderRadius.all(
                                                                Radius.circular(10))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 6,
                                                              horizontal: 16),
                                                      child: Text(
                                                        leavesListModel.vacationStatusDesc?.trim()??'',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: const Color(
                                                                            0xffb79d47),
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'From: ${leavesListModel.vacationFromDate}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                  Text(
                                                  'To: ${leavesListModel.vacationToDate}',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                             SizedBox(height: 10,),

                                            Row(
                                            
                                              children: [
                                                Text(
                                                  'vacation type : ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:  Colors.black,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                Text(
                                                  '${leavesListModel.vacationDesc}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color:  const Color(0xff9694d3),
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                // const SizedBox(
                                                //   height: 35,
                                                //   width: 35,
                                                //   child: DecoratedBox(
                                                //     decoration: BoxDecoration(
                                                //         color: Color.fromARGB(
                                                //             78, 212, 212, 209),
                                                //         borderRadius: BorderRadius.all(
                                                //             Radius.circular(12))),
                                                //     child: Icon(
                                                //       Icons.arrow_forward_ios_outlined,
                                                //       size: 15,
                                                //       color: Colors.grey,
                                                //     ),
                                                //   ),
                                                // ),
                                            
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                PrimaryAppButton(
                                                buttonWidth: 100,
                                                buttonHeight: 40,
                                                // buttonColor: Colors.green
                                          
                                                buttonTitleStyle: TextStyle(fontSize: 14,color: Colors.white),
                                                buttonTile: 'Approve', onPress: (){
                                                  LeavesListCubit.get(context).acceptLeaveReqquest(context: context, employeeId: leavesListModel.employeeId??'', requestNo: leavesListModel.vacationNO.toString()??'', comment: '');
                                                }),
                                                SizedBox(width: 10,),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: PrimaryAppButton(
                                                    buttonWidth: 100,
                                                    buttonHeight: 40,
                                                    btnBorder: Border.all(color: AppColors.primaryColor,width: 2),
                                                   buttonColor: Colors.white,
                                                    buttonTitleStyle: TextStyle(fontSize: 14,color: AppColors.primaryColor,),
                                                    buttonTile: 'Reject', onPress: (){
                                                      LeavesListCubit.get(context).rejectLeaveRequest(context: context, employeeId: leavesListModel.employeeId??'', requestNo: leavesListModel.vacationNO.toString()??'', comment: '');
                                                    }),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                    
  }
}