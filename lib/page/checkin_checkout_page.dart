import 'package:flutter/material.dart';
import 'package:test2/page/attendance_presenter.dart';
import 'package:intl/intl.dart';

class CheckCheckoutPage extends StatefulWidget {
   final String endpoint;
  final String companyId;
  final int employeeId;

  const CheckCheckoutPage({ this.endpoint = '',  this.companyId = '',  this.employeeId =0});

  @override
  State<CheckCheckoutPage> createState() => _CheckCheckoutPageState();
}

class _CheckCheckoutPageState extends State<CheckCheckoutPage> implements AttendanceContract   {
   AttendancePresenter? _presenter;

    DateTime _date = DateTime.now();
  dynamic _data;

  _CheckCheckoutPageState() {
    _presenter = AttendancePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    print('1111111111');

    _presenter?.getEmployeeAttendance(
        widget.endpoint, widget.companyId, widget.employeeId, DateFormat('yyyy/MM/dd').format(_date));
      print('55555555');

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            title: const Text('Attendance',style: TextStyle(color: Colors.white),),
          ),
     
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24,),
        // Center(
        //   child: DecoratedBox(decoration: 
        //     BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: const Color.fromARGB(255, 130, 128, 128))),
        //     child:  const Padding(
        //       padding: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
        //       child: Text('14/04/2024',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color.fromARGB(255, 218, 32, 19)),),
        //     )
          
        //   ),
        // ),
        OutlinedButton(
              onPressed: _pickDate,
              child: Text(DateFormat('dd/MM/yyyy').format(_date),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
        const SizedBox(height: 80,),
        _data == null
        ? const Center(child: CircularProgressIndicator()):
       _data['CheckIn'] != null?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Column(
              children: [
                Text('Check In',style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w700),),
                Text(_data['CheckIn'],style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.2,),
             Column(
              children: [
                Text('Check Out',style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.w700),),
                Text(_data['CheckOut'],style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
              ],
            )
          ],
        )
        :const Center(child: Text('No attendance available in the selected date')),
      ],),

    );
  }

  Future _pickDate() async {
    DateTime? newDateTime = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    );

    if (newDateTime == null) return; // pressed 'X'

    setState(() {
      _date = newDateTime;
      _data = null;
      _presenter?.getEmployeeAttendance(
          widget.endpoint, widget.companyId, widget.employeeId, DateFormat('yyyy/MM/dd').format(_date));
    });
  }

  
  @override
  void onGetEmployeeCheckInsSuccess(employeeAttendance) {
    setState(() {
      _data = employeeAttendance["data"];
    });
  //   print(_data);
  //       print(_data.runtimeType);

  // dynamic data = _data["data"];
  // print(data['CheckIn']);
  }

  @override
  void onGetEmployeeCheckInsFailed() {
    // TODO: implement onGetEmployeeCheckInsFailed
  }
}