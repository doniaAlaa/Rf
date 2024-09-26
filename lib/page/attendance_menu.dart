import 'package:flutter/material.dart';

import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/const/app_routers.dart';
import 'package:test2/core/models/user_model.dart';
import 'package:test2/face_detection/edit_face_detection.dart';
import 'package:test2/page/control_panel_presenter.dart';

import 'package:m7_livelyness_detection/index.dart';


class AttendanceMenu extends StatefulWidget {

    dynamic businessUnitResult;

   // ControlPanelPresenter? presenter;
       dynamic loginResult;


   AttendanceMenu({this.businessUnitResult,
    // this.presenter,
     this.loginResult});

  @override
  State<AttendanceMenu> createState() => _AttendanceMenuState();
}

class _AttendanceMenuState extends State<AttendanceMenu> implements ControlPanelContract {

  late ControlPanelPresenter presenter;

  // bool _inProgress = true;

  File? _image;

  var image;
  List<Face> faces = [];
  // late FaceDetector _faceDetector;
  // late Recognizer _recognizer;
  //
  late int _employeeId;
  late String _employeeName;
  late bool _faceRequired;
    String? _deviceId;


  _AttendanceMenuState() {
 //   _presenter = ControlPanelPresenter(this);
    presenter = ControlPanelPresenter(this);

  }

    @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async{
      String? userModel = await SecureStorage().getUserModel();
      Map<String,dynamic> user = jsonDecode(userModel??'');
      UserModel userModelData = UserModel.fromJson(user);
      print('kkkkkkkkkkkkk${userModelData.nameEn}');
      _employeeId = int.parse(userModelData.id??'');
      _employeeName = userModelData.nameEn??'';
      _faceRequired =userModelData.faceRequired??false;
      _deviceId = userModelData.macAddress??'';

      String? e = await SecureStorage().getEmployeeData();
      // String isJson = e!.replaceAllMapped(RegExp(r'(?<=\{| )\w(.*?)(?=\: |, |})'), (match) {
      //   return '"${match.group(0)!}"';
      // });
      // print(isJson);
      // print('33$isJson');
      // print('object$userModel');

     Map<String,dynamic> ee = jsonDecode(e??'');
      widget.loginResult = user;
      widget.businessUnitResult =  ee;
    });



    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f1f6),
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
            title: const Text('RF Mobile',style: TextStyle(color: Colors.white),),
          ),
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8d8c91),
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){
                        //  Navigator.pushNamed(context, AppRoutes.checkCheckoutPage);
                         
                       //verifyLocationAndCheckIn(context);
                       _verifyLocationAndCheckIn();

                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check-In/Out',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 169, 169, 169),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          color: Color.fromARGB(49, 131, 131, 131),
                          thickness: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.checkCheckoutPage);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Attendance History',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 169, 169, 169),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Divider(
                          color: Color.fromARGB(49, 131, 131, 131),
                          thickness: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          // widget.presenter?.postEmployeeArray('https://jazhotelshr.com/Apitest','100' );
                          String? url = await SecureStorage().getLoginUrl();
                          String? compId = await SecureStorage().getCompId();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditFaceDetection(
                                  endpoint: url??'',
                                  companyId: compId??'',
                                  businessUnitResult: widget.businessUnitResult,
                                  loginResult: widget.loginResult)));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Face Register',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 169, 169, 169),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  void onGetEmployeeArraySuccess() {
    // TODO: implement onGetEmployeeArraySuccess
  }
  
  @override
  void onPostEmployeeArrayFailed() {
    // TODO: implement onPostEmployeeArrayFailed
  }
  
  @override
  void onPostEmployeeArraySuccess() {
    // TODO: implement onPostEmployeeArraySuccess
  }
  
  @override
  void onPostEmployeeCheckInFailed() {
    // TODO: implement onPostEmployeeCheckInFailed
  }
  
  @override
  void onPostEmployeeCheckInSuccess() {
    // TODO: implement onPostEmployeeCheckInSuccess
  }
  
  @override
  void onPostEmployeeDeviceIdFailed() {
    // TODO: implement onPostEmployeeDeviceIdFailed
  }
  
  @override
  void onPostEmployeeDeviceIdSuccess(String? deviceId) {
    // TODO: implement onPostEmployeeDeviceIdSuccess
  }
  
  @override
  void onVerifyDeviceIdFailed(String msg) {
    print('ppppppppppppppppppppppppppp');
    var snackBar = SnackBar(
      content: Text(msg),
    );
    if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  @override
  void onVerifyDeviceIdSuccess([BuildContext? context]) {
    print('ccccccccccc');
        checkInFunc();

  }
  
  @override
  void onVerifyLocationFailed(String msg) {
    // TODO: implement onVerifyLocationFailed
    print('klklklk');
  }
  
  @override
  void onVerifyLocationSuccess([BuildContext? context]) {
       print('salwaaaaa${_deviceId}');
       // widget.presenter?.verifyDeviceId(_deviceId,context);
       presenter?.verifyDeviceId(_deviceId,context);


  }
 //   ControlPanelPresenter? presenter;
 //
 //   verifyLocationAndCheckIn([BuildContext? context]) async{
 //     presenter = ControlPanelPresenter(this);
 //
 //     presenter?.verifyDeviceId(_deviceId,context);
 //
 //     print('rrrrrrrrrrrrrrrrrrrrrrrr$presenter');
 //
 //   //  String? user = await SecureStorage().getUserModel();
 //  //   Map<String, dynamic> valueMap =jsonDecode(user??'');
 //
 // // verifyLocation(valueMap,context);
 // //     presenter?.verifyLocation(widget.businessUnitResult,context);
 //
 //    presenter?.verifyLocation(widget.businessUnitResult,context);
 //
 //     // presenter!.verifyLocation(valueMap,context);
 //     print('fffff${widget.businessUnitResult.toString()}');
 //
 //   }

  // Future<void> verifyLocation(businessUnitResult,[BuildContext? context]) async {
  //
  //
  //   print('gggggggggggggggggg');
  //   LocationData locationData = await Location().getLocation();
  //
  //   String? user = await SecureStorage().getUserModel();
  //   Map<String, dynamic> valueMap =jsonDecode(user??'');
  //   // UserModel userModel = UserModel.fromJson(valueMap);
  //   Map data = valueMap['data'];
  //
  //   // Map data = businessUnitResult["data"];
  //   print(data['latitude']);
  //
  //
  //   double distance = _calculateDistance(
  //       lat1: locationData.latitude!,
  //       lon1: locationData.longitude!,
  //       lat2: double.parse(businessUnitResult['latitude']),
  //       lon2: double.parse(businessUnitResult['longitude']));
  //
  //   String? wifiBSSID = await NetworkInfo().getWifiBSSID();
  //
  //   if ((wifiBSSID != null &&
  //       businessUnitResult['MacAdrresslist'] != null &&
  //       ((businessUnitResult['MacAdrresslist'] as List).contains(wifiBSSID.toUpperCase()) ||
  //           (businessUnitResult['MacAdrresslist'] as List).contains(wifiBSSID.toLowerCase()))) ||
  //       // (businessUnitResult['MacAdrresslist'] as List).contains('74:da:88:7f:68:ba')) ||
  //       distance < 0.1) {
  //
  //     //_view.onVerifyLocationSuccess(context);
  //     print('onVerifyLocationSuccess');
  //   } else {
  //  //   _view.onVerifyLocationFailed('Invalid Location/Wi-Fi Network\nMAC Address = $wifiBSSID');
  //     print('onVerifyLocationFailed');
  //
  //   }
  // }

  double _calculateDistance({required double lat1, required double lon1, required double lat2, required double lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p) / 2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
  Future<void> checkInFunc() async {
    print('3333');
    if (_faceRequired) {
          print('222222');

          print(mounted);
       
if (mounted) {
      print('lllllll');
      // setState(() => _image = null);
      final M7CapturedImage? response = await M7LivelynessDetection.instance.detectLivelyness(
        context,
        config: M7DetectionConfig(
          steps: [
            M7LivelynessStepItem(
              step: M7LivelynessStep.blink,
              title: "Blink",
              isCompleted: false,
              detectionColor: Colors.amber,
            ),
            M7LivelynessStepItem(
              step: M7LivelynessStep.smile,
              title: "Smile",
              isCompleted: false,
              detectionColor: Colors.green.shade800,
            ),
          ],
          startWithInfoScreen: false,
          allowAfterMaxSec: false,
          maxSecToDetect: 60 * 5,
        ),
      );
      if (response == null) {
        return;
      }

      setState(
        () {
          _image = File(response.imgPath);
          _doFaceDetection(false);
        },
      );
  
  }
    } else {
      // _presenter.postEmployeeCheckIn(widget.endpoint, widget.companyId, _employeeId, DateTime.now()).then((value) {
      //   _showCheckedInSuccessDialog();

      //   AssetsAudioPlayer.newPlayer().open(
      //     Audio("assets/audios/thank_you.wav"),
      //     autoStart: true,
      //   );
      // });
    }
  }

  _doFaceDetection(bool register) async {
    // faces.clear();

    // _image = await _removeRotation(_image!);

    // final inputImage = InputImage.fromFile(_image!);
    // faces = await _faceDetector.processImage(inputImage);

    // _performFaceRecognition(register);
  }

  _verifyLocationAndCheckIn() {
     print('doniaaaaa${widget.businessUnitResult}');
    presenter.verifyLocation(widget.businessUnitResult);
  }

}
