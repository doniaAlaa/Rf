import 'package:flutter/material.dart';
import 'package:test2/core/const/app_routers.dart';
import 'package:test2/home/widget/app_menu_widget.dart';
import 'package:test2/page/attendance_menu.dart';
import 'package:test2/page/control_panel_presenter.dart';

class HomePage extends StatelessWidget {
   dynamic businessUnitResult;

  ControlPanelPresenter? presenter;
    final dynamic loginResult;

   HomePage({this.businessUnitResult,this.presenter,this.loginResult});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(child: Text('NO IMAGE')),
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
                        'ID: 24365738',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'ID: 24365738',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Mobile applications',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
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
          ),
        ),
      ),
   
    );
  }
}
