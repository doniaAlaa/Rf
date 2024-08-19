import 'package:flutter/material.dart';
import 'package:m7_livelyness_detection/index.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/const/app_routers.dart';

class LeavesMenuOptions extends StatelessWidget {
  const LeavesMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
            backgroundColor: Colors.red[100],
            centerTitle: false,
            shape: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1
              )
            ),
             elevation: 4,
            title: const Text('Leaves',style: TextStyle(color: Colors.white),),
          ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(height: 40,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.newLeavesPage);
              },
              child: SizedBox(
               
                height: 100,
                width: MediaQuery.of(context).size.width ,
                child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                      BoxShadow(
                      color: const Color.fromARGB(255, 188, 187, 187),
                      spreadRadius: 1,
                      blurRadius: 15
                      )
                      ],
                ),child: Center(child: const Text('New Leave',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),),
              ),
            ),
          ),
           SizedBox(height: 20,),

           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16),

             child: InkWell(
              onTap: (){
                 Navigator.pushNamed(context, AppRoutes.leavesListPage);

              },
               child: SizedBox(
                  height: 100,
                   width: MediaQuery.of(context).size.width,
                 
                child: DecoratedBox(decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),

                   boxShadow: [
                      BoxShadow(
                      color: const Color.fromARGB(255, 188, 187, 187),
                      spreadRadius: 1,
                      blurRadius: 15
                      )
                      ],
                ),child: Center(child: const Text('Leaves Approval',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),),
                         ),
             ),
           ),
        ],
      ),
   
    );
  }
}