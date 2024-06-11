import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';
import 'package:test2/new_leaves/new_leaves_cubit.dart';
import 'package:test2/new_leaves/new_leaves_state.dart';

class NewLeavesPage extends StatelessWidget {
  NewLeavesPage({super.key});

  TextEditingController leaveCauseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String test = 'Select Date';
    bool chooseFromDate = false;
    String toDate = 'Select Date';
    bool chooseToDate = false;
    int leaveSelectedIndex = -1;
    String leaveSelectedId = '';
    String leaveSelectedTitle = "Leave Type";
    String leavesDaysNum = "0";

    DateTime to ;
    DateTime? from ;


    return BlocProvider<NewLeavesCubit>(
      create: (context) => NewLeavesCubit(NewLeavesInitState()),
      child: BlocConsumer<NewLeavesCubit, NewLeavesState>(
        listener: (context, state) {
          if (state is SetFromDateState) {
            test = state.setFromDate ?? '';
          } else if (state is ChooseFromDateState) {
            chooseFromDate = state.chooseFromDate;
          } else if (state is ChooseToDateState) {
            chooseToDate = state.chooseToDate;
          } else if (state is SetToDateState) {
            toDate = state.setToDate;
          } else if (state is SetApplyDaysState) {
            leavesDaysNum = state.applyDays??"0";
          }else if (state is SetLeavesTypesState) {
            leaveSelectedIndex = state.selectedIndex;
            leaveSelectedId = state.selectedVacId ?? '';
            leaveSelectedTitle = state.selectedVacTitle;
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          // final fromDateState = state as SetFromDateState;
          // String fromDate = fromDateState.setFromDate;
          print("dslkfjksldjfsdf?????>>>>>>    $state");
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(90.0),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 60, bottom: 20, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(
                          height: 55,
                          width: 55,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(89, 213, 213, 213),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 122, 122, 122),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //        InkWell(
                    //   onTap: (){},
                    //   child: Text(data,)),

                    const Text(
                      'New Leaves',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(112, 213, 213, 213),
                                  width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        NewLeavesCubit.get(context)
                                            .getVacationTypes(
                                                cmpId: 100, context: context);
                                      },
                                      child: const SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xfff1c1cd),
                                              // Color.fromARGB(
                                              //     255, 91, 99, 220),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Type',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  153, 105, 104, 104),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          leaveSelectedTitle,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Column(
                                  children: [
                                    state is VacationTypesLoadingState
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : state is VacationTypesSuccessState
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount: state
                                                      .getVaccationTypesModel
                                                      .vacationTypes
                                                      ?.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 16.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          NewLeavesCubit.get(context).chooseLeavesType(
                                                              selectedId: state
                                                                      .getVaccationTypesModel
                                                                      .vacationTypes?[
                                                                          index]
                                                                      .vac_id ??
                                                                  '',
                                                              selectedIndex:
                                                                  index,
                                                              leaveType: state
                                                                      .getVaccationTypesModel
                                                                      .vacationTypes?[
                                                                          index]
                                                                      .vac_desc ??
                                                                  '');
                                                        },
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 18,
                                                              width: 18,
                                                              child:
                                                                  DecoratedBox(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color: const Color.fromARGB(
                                                                              255,
                                                                              91,
                                                                              99,
                                                                              220),
                                                                        )),
                                                                child: leaveSelectedIndex ==
                                                                        index
                                                                    ? const Padding(
                                                                        padding: EdgeInsets
                                                                            .all(
                                                                            4.0),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              16,
                                                                          width:
                                                                              16,
                                                                          child: DecoratedBox(
                                                                              decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                91,
                                                                                99,
                                                                                220),
                                                                          )),
                                                                        ),
                                                                      )
                                                                    : const SizedBox(),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(state
                                                                    .getVaccationTypesModel
                                                                    .vacationTypes?[
                                                                        index]
                                                                    .vac_desc ??
                                                                ''),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : const SizedBox()
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       height: 40,
                                //       width: 40,
                                //       child: DecoratedBox(
                                //         decoration: BoxDecoration(
                                //             color: Color.fromARGB(255, 91, 99, 220),
                                //             borderRadius: BorderRadius.all(
                                //                 Radius.circular(12))),
                                //         child: Icon(
                                //           Icons.add,
                                //           size: 30,
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Column(
                                //       mainAxisAlignment: MainAxisAlignment.start,
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         // Text(
                                //         //   'Cause',
                                //         //   style: TextStyle(
                                //         //       fontSize: 15,
                                //         //       color:
                                //         //           Color.fromARGB(153, 105, 104, 104),
                                //         //       fontWeight: FontWeight.w700),
                                //         // ),

                                //         // Text(
                                //         //   'Trip Of Cannes',
                                //         //   style: TextStyle(
                                //         //       fontSize: 20,
                                //         //       color: Colors.black,
                                //         //       fontWeight: FontWeight.w700),
                                //         // ),
                                //         SizedBox(
                                //           width: 200,
                                //           child: TextFormField(
                                //             controller: leaveCauseController,
                                //             //  initialValue: 'Cause',
                                //           ),
                                //         )
                                //       ],
                                //     ),

                                //   ],
                                // ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cause',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              153, 105, 104, 104),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 40,
                                      child: TextFormField(
                                        controller: leaveCauseController,
                                        decoration: const InputDecoration(
                                            hintText: 'Cause',
                                            hintStyle: TextStyle(fontSize: 12,color: Color.fromARGB(255, 168, 165, 165)),

                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Colors.black12)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Colors.black12))),
                                        //  initialValue: 'Cause',
                                      ),
                                    )
                               
                                  ],
                                ),

                                const SizedBox(
                                  height: 2,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                      'Employee Name',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              153, 105, 104, 104),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 40,
                                      child: TextFormField(
                                        controller: leaveCauseController,
                                        decoration: const InputDecoration(
                                            hintText: 'Employee Name',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            hintStyle: TextStyle(fontSize: 12,color: Color.fromARGB(255, 168, 165, 165)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Colors.black12)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                borderSide: BorderSide(
                                                    color: Colors.black12))),
                                        //  initialValue: 'Cause',
                                      ),
                                    ),
                                 const SizedBox(
                                  height: 2,
                                ),
                                  const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                               
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        NewLeavesCubit.get(context)
                                            .chooseFromDate(
                                                chooseFromDate:
                                                    !chooseFromDate);
                                      },
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                              color:Color(0xfff1c1cd),
                                              //  Color.fromARGB(
                                              //     255, 91, 99, 220),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: Icon(
                                            chooseFromDate
                                                ? Icons.remove
                                                : Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'From',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  153, 105, 104, 104),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          test,
                                          //  '${context.watch<NewLeavesCubit>().setFromDate}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // Padding(
                                //   padding: EdgeInsets.symmetric(vertical: 2),
                                //   child: const Divider(
                                //     thickness: 1,
                                //   ),
                                // ),

                                // const Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       'Time',
                                //       style: TextStyle(
                                //           fontSize: 15,
                                //           color: Color.fromARGB(153, 105, 104, 104),
                                //           fontWeight: FontWeight.w700),
                                //     ),
                                //     Row(
                                //       children: [
                                //         SizedBox(
                                //           height: 34,
                                //           child: DecoratedBox(
                                //             decoration: BoxDecoration(
                                //                 color:
                                //                     Color.fromARGB(89, 213, 213, 213),
                                //                 borderRadius: BorderRadius.all(
                                //                     Radius.circular(6))),
                                //             child: Padding(
                                //               padding: EdgeInsets.symmetric(
                                //                   vertical: 4, horizontal: 14),
                                //               child: Text(
                                //                 '9:30',
                                //                 style: TextStyle(
                                //                     fontSize: 15,
                                //                     color: Colors.black,
                                //                     fontWeight: FontWeight.w700),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           width: 8,
                                //         ),
                                //         SizedBox(
                                //           height: 34,
                                //           child: DecoratedBox(
                                //             decoration: BoxDecoration(
                                //                 color:
                                //                     Color.fromARGB(89, 213, 213, 213),
                                //                 borderRadius: BorderRadius.all(
                                //                     Radius.circular(6))),
                                //             child: Padding(
                                //               padding: EdgeInsets.symmetric(
                                //                   vertical: 4, horizontal: 4),
                                //               child: Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.center,
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.center,
                                //                 children: [
                                //                   SizedBox(
                                //                     child: DecoratedBox(
                                //                       decoration: BoxDecoration(
                                //                           color: Colors.white,
                                //                           borderRadius:
                                //                               BorderRadius.all(
                                //                                   Radius.circular(
                                //                                       4))),
                                //                       child: Padding(
                                //                         padding: EdgeInsets.symmetric(
                                //                             vertical: 4,
                                //                             horizontal: 14),
                                //                         child: Text(
                                //                           'AM',
                                //                           style: TextStyle(
                                //                               fontSize: 15,
                                //                               color: Colors.black,
                                //                               fontWeight:
                                //                                   FontWeight.w700),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     child: DecoratedBox(
                                //                       decoration: BoxDecoration(
                                //                           // color: Color.fromARGB(
                                //                           //     89, 213, 213, 213),
                                //                           borderRadius:
                                //                               BorderRadius.all(
                                //                                   Radius.circular(
                                //                                       6))),
                                //                       child: Padding(
                                //                         padding: EdgeInsets.symmetric(
                                //                             vertical: 4,
                                //                             horizontal: 14),
                                //                         child: Text(
                                //                           'PM',
                                //                           style: TextStyle(
                                //                               fontSize: 15,
                                //                               color: Color.fromARGB(
                                //                                   153, 105, 104, 104),
                                //                               fontWeight:
                                //                                   FontWeight.w700),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         )
                                //       ],
                                //     )
                                //   ],
                                // ),
                                // const SizedBox(
                                //   height: 2,
                                // ),
                                // const Divider(
                                //   thickness: 1,
                                // ),
                                // const SizedBox(
                                //   height: 2,
                                // ),
                                // isFromChoosed
                                //     ?
                                chooseFromDate
                                    ? TableCalendar(
                                        firstDay: DateTime.utc(2010, 10, 16),
                                        lastDay: DateTime.utc(2030, 3, 14),
                                        focusedDay: DateTime.now(),
                                        rowHeight: 35,
                                        onDaySelected: (date, events) {
                                          print(date.toUtc());
                                          String formattedDate =
                                              DateFormat.yMMMEd().format(date);
                                          print(formattedDate);
                                          from = date;
                                      
                                          NewLeavesCubit.get(context)
                                              .selectFromDate(
                                                  fromDate: formattedDate);
                                        },
                                        calendarStyle: const CalendarStyle(),
                                        headerStyle: const HeaderStyle(
                                          formatButtonVisible: false,
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        
                                      if(test == 'Select Date'){
                                          // Scaffold.of(context).showBottomSheet(builder);
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Select Starting Leave Date First',style: TextStyle(fontSize: 15)) ,));

                           
                                        }else{
                                          NewLeavesCubit.get(context)
                                            .chooseToDate(
                                                chooseToDate: !chooseToDate);
                                        }
                                       
                                      },
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                              color:Color(0xfff1c1cd),
                                              //  Color.fromARGB(
                                              //     255, 91, 99, 220),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12))),
                                          child: Icon(
                                            chooseToDate
                                                ? Icons.remove
                                                : Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'To',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  153, 105, 104, 104),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          toDate,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                chooseToDate
                                    ? TableCalendar(
                                        firstDay: DateTime.utc(2010, 10, 16),
                                        lastDay: DateTime.utc(2030, 3, 14),
                                        focusedDay: DateTime.now(),
                                        rowHeight: 35,
                                        onDaySelected: (date, events) {
                                          print(date.toUtc());
                                          String formattedDate =
                                              DateFormat.yMMMEd().format(date);
                                          print(formattedDate);
                                          to = date;
                                            print('true');

                                          if(from != null && to.isAfter(from!)){
                                              NewLeavesCubit.get(context)
                                              .selectToDate(
                                                  toDate: formattedDate);
                                                  NewLeavesCubit.get(context)
                                              .calculateLeavesDays(
                                                  to:to,from:from!);
                                          }

                                        
                                        },
                                        calendarStyle: const CalendarStyle(),
                                        headerStyle: const HeaderStyle(
                                          formatButtonVisible: false,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryAppButton(
                        buttonTile: 'Apply For ${leavesDaysNum} Days Leaves',
                        onPress: () {
                          //  NewLeavesCubit.get(context).tesst(context: context);

                          if (test == 'Select Date' ||
                              toDate == 'Select Date' ||
                              leaveSelectedId.trim().isEmpty) {
                            return ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Complete Data First',
                                style: TextStyle(fontSize: 15),
                              ),
                            ));
                          } else {
                            var inputFormat = DateFormat.yMMMEd();
                            var inputToDate = inputFormat.parse(toDate);
                            var inputFromDate = inputFormat.parse(test);
                            // <-- dd/MM 24H format

                            var outputFormat = DateFormat('yyyy-MM-dd');
                            var formattedToDate =
                                outputFormat.format(inputToDate);
                            var formattedFromDate =
                                outputFormat.format(inputFromDate);
                            var formattedRequestDate =
                                outputFormat.format(DateTime.now());
                            Map<String, dynamic> leaveData = {
                              "companyID": '100',
                              "vacationRequestDate": formattedRequestDate,
                              "vacationDetails": [
                                {
                                  "vacationTypeCode": leaveSelectedId,
                                  "vacationFromDate": formattedFromDate,
                                  "vacationToDate": formattedToDate,
                                }
                              ],
                              "vacationComment": leaveCauseController.text
                            };
                            NewLeavesCubit.get(context).applyNewLeave(
                                context: context, leaveData: leaveData);
                          }
                        }),
                
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
