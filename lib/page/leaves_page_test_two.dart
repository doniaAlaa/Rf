// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:test2/new_leaves/leaves_cubit_test.dart';
// import 'package:test2/new_leaves/leaves_state_test.dart';

// class LeavesPageTestTow extends StatelessWidget {
//   LeavesPageTestTow({super.key});

//   TextEditingController leaveCauseController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LeavesTestCubit>(
//       create: (context) => LeavesTestCubit(const LeavesIntialTestState()),
//       child: BlocConsumer<LeavesTestCubit, LeavesStateTest>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           // final fromDateState = state as SetFromDateState;
//           // String fromDate = fromDateState.setFromDate;
//           print("dslkfjksldjfsdf?????>>>>>>    $state");
//           return Scaffold(
//             appBar: PreferredSize(
//                 preferredSize: const Size.fromHeight(90.0),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(top: 60, bottom: 20, right: 16, left: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const SizedBox(
//                           height: 55,
//                           width: 55,
//                           child: DecoratedBox(
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(89, 213, 213, 213),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12))),
//                             child: Icon(
//                               Icons.arrow_back_ios_new_outlined,
//                               size: 20,
//                               color: Color.fromARGB(255, 122, 122, 122),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         LeavesTestCubit.get(context).TestState1();
//                       },
//                       child: Text(
//                         'data',
//                         style: TextStyle(color: state.first ?? Colors.black),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         LeavesTestCubit.get(context).TestState2();
//                       },
//                       child: Text(
//                         'data',
//                         style: TextStyle(color: state.sec ?? Colors.black),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 38.0),
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               LeavesTestCubit.get(context).TestState3();
//                             },
//                             child: state is LoadingState
//                                 ? const CircularProgressIndicator()
//                                 : const Text(
//                                     'data',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
