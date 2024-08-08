import 'package:flutter/material.dart';

class LeavesPartsPage extends StatelessWidget {
  const LeavesPartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f1f6),
      appBar: AppBar(
        backgroundColor: const Color(0xfffeb4a9),
        title: const Text('Leaves'),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.amber),child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8d8c91),
                  fontWeight: FontWeight.w500),
            ),),
             DecoratedBox(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.amber),child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8d8c91),
                  fontWeight: FontWeight.w500),
            ),),
          
        ],
      ),
    );
  }
}
