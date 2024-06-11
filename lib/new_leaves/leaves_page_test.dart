import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';
import 'package:test2/leaves_list/leaves_list_cubit.dart';
import 'package:test2/leaves_list/leaves_list_state.dart';
import 'package:test2/leaves_list/models/leaves_list_model.dart';
import 'package:test2/new_leaves/leaves_cubit_test.dart';

// enum LeavesStatus {awaiting,approved,declined,}
class LeavesTest extends StatelessWidget {
  LeavesTest({super.key});
  
  @override
  Widget build(BuildContext context) {
    print('nnnnnnnnnnnnnnn');
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Padding(
            padding: EdgeInsets.only(top: 60, bottom: 20, right: 16, left: 16),
            child: Row(
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
                  height: 55,
                  width: 55,
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
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'testtttt',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.5 - 16,
            //       height: 50,
            //       child: DecoratedBox(
            //         decoration: BoxDecoration(
            //             // boxShadow: [
            //             //   BoxShadow(color: Colors.black),
            //             //   BoxShadow(color: Colors.black12),
            //             //   BoxShadow(color: Colors.black12),
            //             // ],
            //             border: Border.all(
            //                 color: const Color.fromARGB(115, 193, 190, 190)),
            //             borderRadius: const BorderRadius.all(
            //               Radius.circular(12),
            //             ),
            //             color: Colors.white),
            //         child: const Center(
            //             child: Text(
            //           'All',
            //           style: TextStyle(
            //               fontSize: 20, fontWeight: FontWeight.w500),
            //         )),
            //       ),
            //     ),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.5 - 16,
            //       height: 50,
            //       child: const DecoratedBox(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(12)),
            //             color: Color.fromARGB(78, 212, 212, 209)),
            //         child: Center(
            //             child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             SizedBox(
            //               //ffb601
            //               height: 12,
            //               width: 12,
            //               child: DecoratedBox(
            //                 decoration: BoxDecoration(
            //                     color: Color(0xffffb601),
            //                     shape: BoxShape.circle),
            //                 child: Text(''),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text(
            //               'Casual',
            //               style: TextStyle(
            //                   color: Colors.grey,
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //           ],
            //         )),
            //       ),
            //     )
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height*0.6,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: leaves.length,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(bottom: 30),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const Padding(
            //                 padding:
            //                     EdgeInsets.only(bottom: 8, right: 16, left: 16),
            //                 child: Text(
            //                   'calendar 2023',
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       color: Colors.grey,
            //                       fontWeight: FontWeight.w700),
            //                 ),
            //               ),
            //               SizedBox(
            //                 child: DecoratedBox(
            //                   decoration: BoxDecoration(
            //                       border: Border.all(
            //                           width: 3,
            //                           color: const Color.fromARGB(
            //                               58, 193, 190, 190)),
            //                       borderRadius: const BorderRadius.all(
            //                           Radius.circular(16))),
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 16, vertical: 20),
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Text(
            //                               leaves[index]['title'],
            //                               style: const TextStyle(
            //                                   fontSize: 16,
            //                                   color: Colors.grey,
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                             SizedBox(
            //                               child: DecoratedBox(
            //                                 decoration: BoxDecoration(
            //                                     color: leaves[index]
            //                                                 ['status'] ==
            //                                             'Awaiting'
            //                                         ? const Color(0xfffef1be)
            //                                         : leaves[index]['status'] ==
            //                                                 'Approved'
            //                                             ? const Color(
            //                                                 0xffb4f6d2)
            //                                             : leaves[index]
            //                                                         [
            //                                                         'status'] ==
            //                                                     'Declined'
            //                                                 ? const Color(
            //                                                     0xffffebeb)
            //                                                 : const Color(
            //                                                     0xfffef1be),
            //                                     borderRadius:
            //                                         const BorderRadius.all(
            //                                             Radius.circular(10))),
            //                                 child: Padding(
            //                                   padding:
            //                                       const EdgeInsets.symmetric(
            //                                           vertical: 6,
            //                                           horizontal: 16),
            //                                   child: Text(
            //                                     leaves[index]['status'],
            //                                     style: TextStyle(
            //                                         fontSize: 15,
            //                                         color: leaves[index]
            //                                                     ['status'] ==
            //                                                 'Awaiting'
            //                                             ? const Color(
            //                                                 0xffb79d47)
            //                                             : leaves[index][
            //                                                         'status'] ==
            //                                                     'Approved'
            //                                                 ? const Color(
            //                                                     0xff58a273)
            //                                                 : leaves[index]
            //                                                             [
            //                                                             'status'] ==
            //                                                         'Declined'
            //                                                     ? const Color(
            //                                                         0xffdc9499)
            //                                                     : const Color(
            //                                                         0xffb79d47),
            //                                         fontWeight:
            //                                             FontWeight.w500),
            //                                   ),
            //                                 ),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                         Text(
            //                           leaves[index]['time'],
            //                           style: const TextStyle(
            //                             fontSize: 22,
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.w700,
            //                           ),
            //                         ),
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Text(
            //                               leaves[index]['type'],
            //                               style: TextStyle(
            //                                   fontSize: 20,
            //                                   color: leaves[index]['type'] ==
            //                                           'Casual'
            //                                       ? const Color(0xffedcc53)
            //                                       : const Color(0xff9694d3),
            //                                   fontWeight: FontWeight.w700),
            //                             ),
            //                             const SizedBox(
            //                               height: 35,
            //                               width: 35,
            //                               child: DecoratedBox(
            //                                 decoration: BoxDecoration(
            //                                     color: Color.fromARGB(
            //                                         78, 212, 212, 209),
            //                                     borderRadius: BorderRadius.all(
            //                                         Radius.circular(12))),
            //                                 child: Icon(
            //                                   Icons.arrow_forward_ios_outlined,
            //                                   size: 15,
            //                                   color: Colors.grey,
            //                                 ),
            //                               ),
            //                             ),
            //                           ],
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       }),
            // ),
         
           BlocProvider(
              create: (context) => ContactsListCubitCubit()..getLeavesList(context: context),
              child: BlocBuilder<ContactsListCubitCubit, LeavesStateTest>(
                builder: (context, state) {
                   return state.when(
                    initial: (){
                      return SizedBox();
                    },
                    loading: (){
                      return CircularProgressIndicator(color:Colors.amber,);
                    },
                    error: ((errorMessage) => Center(child: Text(errorMessage),)),
                    data: (contacts, firstOne, sec) {
                       return   Container(
                        height: 400,
                         child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context,index){
                          
                          return Column(
                            children: [
                              PrimaryAppButton(buttonTile: 'data',
                              buttonColor:firstOne? Colors.black:null,
                               onPress: (){
                              ContactsListCubitCubit.get(context).changeFirstBtn();
                              
                          
                              }),
                              LeavesFirstCard(leavesListModel: contacts[index],),
                              InkWell(
                                onTap: (){
                                    ContactsListCubitCubit.get(context).changeSecBtn();
                          
                                },
                                child: Container(height: 30,width: 100,color: sec? Colors.green:Colors.red,),
                              )
                            ],
                          );
                                           
                         }),
                       );
                   
                    },
                   );

                },
              ),
            )
         
          ],
        ),
      ),
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
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: PrimaryAppButton(
                                                buttonWidth: 100,
                                                buttonHeight: 40,
                                                buttonTitleStyle: TextStyle(fontSize: 14,color: Colors.white),
                                                buttonTile: 'Approve', onPress: (){
                                                  LeavesListCubit.get(context).actionOnLeaveReqquest(context: context, employeeId: leavesListModel.employeeId??'', requestNo: leavesListModel.vacationNO.toString()??'', comment: '');
                                                }),
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