
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget   implements PreferredSizeWidget{
   const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:24.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 239, 165, 153), ),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top:40.0,left: 16,right: 16),
            child: Row(children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_rounded,color: Colors.black,)),
                const SizedBox(width: 20,),
                const Text('Attendance',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
            ],),
          ),
        ),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}