import 'package:flutter/material.dart';
import 'package:test2/core/const/app_colors.dart';
import 'package:test2/home/widget/logout_popup_widget.dart';
import 'package:test2/main.dart';

class AppMenu{
  
  openAppMenu({required BuildContext context}){
   return showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                     height: MediaQuery.of(context).size.height*0.9,
                     width: 1000,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,

                     ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                           SizedBox(height: 20,),
                           InkWell(
                            onTap: (){
                                Navigator.of(context).pop();        

                            },
                             child: Align(
                              alignment: Alignment.centerRight,
                               child: SizedBox(
                                height: 24,width: 24,
                                child: DecoratedBox(decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  // border: ,
                                  boxShadow: [
                                    BoxShadow(
                                       color: Color.fromARGB(255, 67, 67, 67).withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 3), 
                                    )
                                  ]
                                ),child: Icon(Icons.close,size: 16,),),
                               ),
                          
                             ),
                           ),
                              // SizedBox(height: 10,),


                        //   Image.asset(  'assets/images/logo.jpg',
                        // height: 60),
                          SizedBox(height: 10,),
                          DecoratedBox(
                            decoration: BoxDecoration(
                            //  color: Colors.red[100],
                                 borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20)),
                      
                      
                            ),
                            child: SizedBox(
                              // height: 60,
                              width: 2000,
                              child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,               
                                       children: const [
                                  // Text('Preference',style: TextStyle(
                                  //   color: Colors.white,
                                  //   fontSize: 20,fontWeight: FontWeight.w700
                                  // ),),
                      
                                 Text('Hello,',style: TextStyle(
                                              color: Color.fromARGB(255, 64, 64, 64),
                                              fontSize: 16,fontWeight: FontWeight.w400
                                            ),),
                                //  Text('Ahmed Fares',style: TextStyle(
                                //               color: Colors.black,
                                //               fontSize: 20,fontWeight: FontWeight.w700
                                //             ),),
                                ],
                              ),
                            ),
                          ),
                           Text('${userName.toString()}',style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26,fontWeight: FontWeight.w900
                                            ),),
                                            Text("Welcome To Us , We're thrilled to have you here ...",style: TextStyle(
                                              color: Color.fromARGB(255, 175, 174, 174),
                                              fontSize: 14,fontWeight: FontWeight.w400
                                            ),),
                         SizedBox(height: 20,),
                         Container(
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                                                      color: AppColors.primaryColor,

                          ),
                          width: 100,
                         ),
                            SizedBox(height: 20,),

                         InkWell(
                          onTap: (){
                              Logout().removeAccount(context: context);

                          },
                           child: SizedBox(
                                  height: 40,width: MediaQuery.of(context).size.width - 32,
                                  child: DecoratedBox(decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    // border: ,
                                    boxShadow: [
                                      BoxShadow(
                                         color: Color.fromARGB(255, 185, 185, 185).withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(0, 0), 
                                      )
                                    ]
                                  ),child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 30,width: 30,
                                          child: DecoratedBox(decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(255, 233, 87, 89)
                                          ),child: Icon(Icons.logout,color: Colors.white,size: 16,),),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("Logout",style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,fontWeight: FontWeight.w500
                                              ),),
                                      ],
                                    ),
                                  ),),
                                 ),
                         ),
                          
                         
                        ],
                      ),
                    ),
                  );
                },
              );
 
 
  }
}