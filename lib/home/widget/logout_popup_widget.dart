import 'package:flutter/material.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/const/app_colors.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';
import 'package:test2/page/login_page.dart';


class Logout{
  Future<void> removeAccount({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,

        // title: const Text('AlertDialog Title'),
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0))
),
        content:  Container(
          height: 120,

          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                                      Navigator.pop(context);
                        
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.delete,color: AppColors.primaryColor,),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *0.55,
                          child: Text('Are You Sure You Want To Delete Your Account?',style: TextStyle(fontSize: 12,fontWeight:FontWeight.w500 ),)),
                      ],
                    )),
                  
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryAppButton(
                        buttonWidth: 100,
                           buttonHeight: 40,
                                                // buttonColor: Colors.green
                                          
                          buttonTitleStyle: TextStyle(fontSize: 14,color: Colors.white),
                      
                      onPress: (){
                        SecureStorage().clearUserAccount();
                        Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => LoginPage()
                        ), 
                      ModalRoute.withName("/Home")
                      );

                      }, buttonTile: 'Confirm',),
                      SizedBox(width: 10,),
                       PrimaryAppButton(
                            buttonWidth: 100,
                            buttonHeight: 40,
                            btnBorder: Border.all(color: AppColors.primaryColor,width: 2),
                            buttonColor: Colors.white,
                            buttonTitleStyle: TextStyle(fontSize: 14,color: AppColors.primaryColor,),
                            buttonTile: 'Cancel', onPress: (){
                              Navigator.pop(context);
                            }),
                      
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
       
    
      );
    },
  );
}
}