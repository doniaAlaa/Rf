import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test2/core/const/app_routers.dart';
import 'package:test2/home/cubit/home_cubit.dart';
import 'package:test2/home/widget/app_menu_widget.dart';
import 'package:test2/page/attendance_menu.dart';
import 'package:test2/page/control_panel_presenter.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
class HomePage extends StatelessWidget {
   dynamic businessUnitResult;

  ControlPanelPresenter? presenter;
    final dynamic loginResult;

   HomePage({this.businessUnitResult,this.presenter,this.loginResult});





   @override
  Widget build(BuildContext context) {
     print('hhhhhhuuuuuu');
     HomeCubit().getUserProfileData(context: context);

     List list = [
      {
        "title": "Attendance",
        "icon": Icons.calendar_month,
        "color": Colors.yellow
      },
      {
        "title": "Leaves",
        "icon": Icons.access_alarms_sharp,
        "color": const Color.fromARGB(255, 88, 216, 107)
      },
    ];



     Widget image(String oo) {
       if (oo.length % 4 > 0) {
         oo +=
             '=' * (4 - oo.length % 4); // as suggested by Albert221
       }
       final _byteImage = Base64Decoder().convert(oo);
       Widget image = Image.memory(_byteImage, height: 70, width: 70,);
       return image;
     }

     return Scaffold(
       backgroundColor: Color(0xfff1c1cd),
         
         
        // Theme.of(context).colorScheme.inversePrimary,
        appBar:  AppBar(
          leading: InkWell(
            onTap: (){
              AppMenu().openAppMenu(context: context);
              // showModalBottomSheet<void>(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       height: 200,
              //       color: Colors.white,
              //       child: Center(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text(
              //               'This is a BottomSheet',
              //               style: TextStyle(fontSize: 20),
              //             ),
              //             ElevatedButton(
              //               onPressed: () {
              //                 Navigator.of(context).pop();                   },
              //               child: Text('Close BottomSheet'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // );
 
            },
            child: Icon(Icons.menu,color: Colors.white,)),
            backgroundColor: Colors.red[100],
            centerTitle: false,
            shape: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1
              )
            ),
             elevation: 4,
            title: const Text('Home',style: TextStyle(color: Colors.white),),
          ),
       
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // child: Column(
          //   children: [
          //   // yyy(''),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     const Row(
          //       children: [
          //         SizedBox(
          //           height: 80,
          //           width: 80,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //                 color: Colors.white, shape: BoxShape.circle),
          //             child: Center(child: Text('NO IMAGE')),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'ID: 24365738',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             Text(
          //               'ID: 24365738',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //             Text(
          //               'Mobile applications',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     GridView.builder(
          //         shrinkWrap: true,
          //         itemCount: list.length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             mainAxisExtent: 180,
          //             crossAxisCount: 3,
          //             crossAxisSpacing: 4,
          //             mainAxisSpacing: 4),
          //         itemBuilder: ((context, index) {
          //           return InkWell(
          //             onTap: () {
          //
          //               if(index == 0){
          //               // Navigator.pushNamed(context, AppRoutes.attendanceMenu);
          //               // print('lllllll:::${context.mounted}');
          //
          //               //     print(businessUnitResult);
          //
          //
          //               // print(loginResult);
          //
          //               // if(context.mounted){
          //               //     presenter?.verifyLocation(businessUnitResult);
          //
          //               // }
          //
          //
          //                Navigator.push(
          //                   context,
          //                   MaterialPageRoute(builder: (context) =>  AttendanceMenu(
          //                        presenter: presenter,
          //                        businessUnitResult: businessUnitResult,
          //                        loginResult: loginResult,
          //                   )),
          //                 );
          //
          //               }else{
          //                 print('ppppp');
          //                   Navigator.pushNamed(context, AppRoutes.leavesMenuOptions);
          //
          //               }
          //             },
          //             child: DecoratedBox(
          //               decoration: const BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.all(Radius.circular(5))),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     list[index]['title'],
          //                     style: const TextStyle(
          //                         color: Color.fromARGB(255, 88, 88, 88)),
          //                   ),
          //                   const SizedBox(
          //                     height: 8,
          //                   ),
          //                   Icon(
          //                     list[index]['icon'],
          //                     color: list[index]['color'],
          //                   )
          //                 ],
          //               ),
          //             ),
          //           );
          //         }))
          //   ],
          // ),
          child:  BlocProvider(
             create: (context) => HomeCubit()..getUserProfileData(context: context),
         //   create: (context) => HomeCubit(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.when(
                  data: (loading,profile){
                    return profile == null ? CircularProgressIndicator():
                      Column(
                          children: [

                            const SizedBox(
                              height: 20,
                            ),
                             InkWell(
                               onTap: (){
                               //  HomeCubit()..getUserProfileData(context: context);
                               },
                               child: Row(
                                 children: [
                                   SizedBox(
                                     height: 80,
                                     width: 80,
                                     child: DecoratedBox(
                                       decoration: BoxDecoration(
                                           color: Colors.white, shape: BoxShape.circle),
                                       child: ClipRRect(
                                           borderRadius: BorderRadius.circular(100),
                                           child:profile.EmployeeImage==''?Image.asset(
                                             'assets/images/profile_img.jpeg',fit: BoxFit.cover,
                                             height: 200,
                                           ): image(profile.EmployeeImage??'')),
                                     ),
                                   ),
                                   SizedBox(
                                     width: 15,
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'ID: ${profile.EmployeeId}',
                                         style: TextStyle(color: Colors.black),
                                       ),
                                       Text(
                                         'Name: ${profile.EmployeeName}',
                                         style: TextStyle(color: Colors.black),
                                       ),
                                       Text(
                                         '${profile.PositionDesc}',
                                         style: TextStyle(color: Colors.black),
                                       ),
                                     ],
                                   )
                                 ],
                               ),
                             )
                             ,
                            const SizedBox(
                              height: 20,
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 180,
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4),
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                    onTap: () {

                                      if(index == 0){
                                      // Navigator.pushNamed(context, AppRoutes.attendanceMenu);
                                      // print('lllllll:::${context.mounted}');

                                      //     print(businessUnitResult);


                                      // print(loginResult);

                                      // if(context.mounted){
                                      //     presenter?.verifyLocation(businessUnitResult);

                                      // }


                                       Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  AttendanceMenu(
                                               presenter: presenter,
                                               businessUnitResult: businessUnitResult,
                                               loginResult: loginResult,
                                          )),
                                        );

                                      }else{
                                        print('ppppp');
                                          Navigator.pushNamed(context, AppRoutes.leavesMenuOptions);

                                      }
                                    },
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(5))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            list[index]['title'],
                                            style: const TextStyle(
                                                color: Color.fromARGB(255, 88, 88, 88)),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Icon(
                                            list[index]['icon'],
                                            color: list[index]['color'],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }))
                          ],
                        );
                  }
                );

              },
            ),
          ),
        ),
      ),
   
    );
  }
}
