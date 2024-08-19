// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image/image.dart' as img;
import 'package:m7_livelyness_detection/index.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/const/app_colors.dart';
import 'package:test2/core/const/app_routers.dart';
// import 'package:test2/core/const/app_routers.dart';
import 'package:test2/core/recognition.dart';
import 'package:test2/core/recognizer.dart';
// import 'package:test2/home/widget/app_menu_widget.dart';
import 'package:test2/models/employee.dart';
// import 'package:test2/page/attendance_menu.dart';
import 'package:test2/page/checkin_checkout_page.dart';
import 'package:test2/page/control_panel_presenter.dart';
import 'package:test2/page/home_page.dart';
// import 'package:test2/page/leaves/leaves_menu_options.dart';
import 'package:test2/utils/local_db.dart';

// import 'package:settings_ui/settings_ui.dart';

// import '../ml/recognition.dart';
// import '../ml/recognizer.dart';
// import '../models/employee.dart';
// import '../utils/local_db.dart';
// import 'attendance_page.dart';
// import 'control_panel_presenter.dart';

class ControlPanelPage extends StatefulWidget {
  final String endpoint;
  final String companyId;
  final dynamic businessUnitResult;
  final dynamic loginResult;

  const ControlPanelPage(
      {super.key,
      required this.endpoint,
      required this.companyId,
      required this.businessUnitResult,
      required this.loginResult});

  @override
  State<ControlPanelPage> createState() => _ControlPanelPageState();
}

class _ControlPanelPageState extends State<ControlPanelPage> implements ControlPanelContract {
  late ControlPanelPresenter _presenter;

  bool _inProgress = true;

  File? _image;

  var image;
  List<Face> faces = [];
 // late FaceDetector _faceDetector;
 //donia
     FaceDetector? _faceDetector;

  late Recognizer _recognizer;

  late int _employeeId;
  late String _employeeName;
   late bool _faceRequired;
      // bool? _faceRequired;

  String? _deviceId;
  // bool? faceRequired;
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
     final SecureStorage secureStorage = SecureStorage();



  _ControlPanelPageState() {
    _presenter = ControlPanelPresenter(this);
  }

 
   setFaceReq({required bool isRequired})async{
        if(widget.loginResult['faceRequired'] == true){
        await secureStorage.setFaceRequired(true.toString());
                print('setFaceRequired');
             

    }

   }
  
  
  @override
  void initState() {
    super.initState();
   
  print('objectbbbbbbbbbb');
    _employeeId = int.parse(widget.loginResult['id']);
    _employeeName = widget.loginResult['nameEn'];

   _faceRequired = widget.loginResult['faceRequired'];
   // _faceRequired = false;
    _deviceId = widget.loginResult['macAddress'];
    
    
     WidgetsBinding.instance.addPostFrameCallback((_)async{
       isFaceRequired();


  });
    

    

    // if (_faceRequired ) {
    //   print('_initFaceDetectionValues');
    //   _initFaceDetectionValues();
    //   setFaceReq(isRequired: _faceRequired);

    // } else {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     print('timeStamp');
    //     setState(() => _inProgress = false);

    //     if (_deviceId == null) {
    //       _register();
    //               print('_register');

    //     } else {
    //       _showLogInSuccessDialog();
    //             print('_showLogInSuccessDialog');

    //     }
    //   });
    // }
  }

    isFaceRequired() async{

  //       String? face = await secureStorage.getFaceRequired();
  //       faceRequired = face != null ?true:null;
  //       if(faceRequired == null && widget.loginResult['faceRequired'] == true){
  //  _faceRequired = true;
  //   } else{
  //     _faceRequired = false;
  //           print('xxxxxxxxxxx');

  //   }
  //   if (_faceRequired??false) {
  //     print('_initFaceDetectionValues');
  //     _initFaceDetectionValues();
  //     setFaceReq(isRequired: _faceRequired??false);

  //   } else {
  //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //       print('timeStamp');
  //       setState(() => _inProgress = false);

  //       if (_deviceId == null) {
  //         _register();
  //                 print('_register');

  //       } else {
  //         _showLogInSuccessDialog();
  //               print('_showLogInSuccessDialog');

  //       }
  //     });
  //   }

    //////////////////////////
     //_faceRequired = widget.loginResult['faceRequired'];

     if (_faceRequired) {
      print('_initFaceDetectionValues');
      _initFaceDetectionValues();
      setFaceReq(isRequired: _faceRequired);

    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        print('timeStamp');
        setState(() => _inProgress = false);

        if (_deviceId == null) {
          _register();
                  print('_register');

        } else {

          Navigator.pushNamed(context, AppRoutes.homePage);
          _showLogInSuccessDialog();
          print('_showLogInSuccessDialog');

        }
      });
    }

   }

  void _initFaceDetectionValues() {
    _presenter.getEmployeeArray(widget.endpoint, widget.companyId, _employeeId, _employeeName);

    M7LivelynessDetection.instance.configure(
      lineColor: Colors.white,
      dotColor: Colors.purple.shade800,
      dotSize: 2.0,
      lineWidth: 2,
      dashValues: [2.0, 5.0],
      displayDots: true,
      displayLines: true,
      thresholds: [
        M7SmileDetectionThreshold(
          probability: 0.8,
        ),
        M7BlinkDetectionThreshold(
          leftEyeProbability: 0.25,
          rightEyeProbability: 0.25,
        ),
      ],
    );

    final options = FaceDetectorOptions(enableClassification: false, enableContours: false, enableLandmarks: false);

    _faceDetector = FaceDetector(options: options);

     _recognizer = Recognizer();
  }

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
        // appBar:  AppBar(
        //   leading: InkWell(
        //     onTap: (){
        //        AppMenu().openAppMenu(context: context);
        //
        //     },
        //     child: Icon(Icons.menu,color: Colors.white,)),
        //     backgroundColor: Colors.red[100],
        //     centerTitle: false,
        //     shape: Border(
        //       bottom: BorderSide(
        //         color: Colors.white,
        //         width: 1
        //       )
        //     ),
        //      elevation: 4,
        //     title: const Text('Home',style: TextStyle(color: Colors.white),),
        //   ),
       
        body: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 1,))
        // _inProgress
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     :
        //
        //     SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         const Row(
        //           children: [
        //             SizedBox(
        //               height: 80,
        //               width: 80,
        //               child: DecoratedBox(
        //                 decoration: BoxDecoration(
        //                     color: Colors.white, shape: BoxShape.circle),
        //                 child: Center(child: Text('NO IMAGE')),
        //               ),
        //             ),
        //             SizedBox(
        //               width: 15,
        //             ),
        //             Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   'ID: 24365738',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 Text(
        //                   'ID: 24365738',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //                 Text(
        //                   'Mobile applications',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         // InkWell(
        //         //   onTap: (){
        //         //                           print('0000000000');
        //
        //         //                                                               print('nnnnnnnnnnnnnnn${widget.loginResult}');
        //         //   },
        //         //   child: Text('data')),
        //         GridView.builder(
        //             shrinkWrap: true,
        //             itemCount: list.length,
        //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //                 mainAxisExtent: 180,
        //                 crossAxisCount: 3,
        //                 crossAxisSpacing: 4,
        //                 mainAxisSpacing: 4),
        //             itemBuilder: ((context, index) {
        //               return InkWell(
        //                 onTap: () {
        //                   if(index == 0){
        //                    Navigator.push(
        //                     context,
        //                     MaterialPageRoute(builder: (context) =>  AttendanceMenu(
        //                          presenter: _presenter,
        //                          businessUnitResult: widget.businessUnitResult,
        //                          loginResult: widget.loginResult,
        //                     )),
        //                   );
        //
        //
        //
        //                   }else{
        //                         Navigator.pushNamed(context, AppRoutes.leavesMenuOptions);
        //
        //                   }
        //                 },
        //                 child: DecoratedBox(
        //                   decoration: const BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.all(Radius.circular(5))),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         list[index]['title'],
        //                         style: const TextStyle(
        //                             color: Color.fromARGB(255, 88, 88, 88)),
        //                       ),
        //                       const SizedBox(
        //                         height: 8,
        //                       ),
        //                       Icon(
        //                         list[index]['icon'],
        //                         color: list[index]['color'],
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             }))
        //       ],
        //     ),
        //   ),
        // ),
         

         ///////////////////////////////
          
              // Column(children: [
              //   InkWell(
              //     onTap: (){
              //       verifyLocationAndCheckIn();
              //     },
              //     child: const Text('Check-In/Out')),
              //   InkWell(
              //     onTap: (){
              //       _openAttendancePage();
              //     },
              //     child: const Text('Attendance History'))
              // ],)
   
    );
  }

  // Future<void> _register() async {
  //   if (_faceRequired) {
  //     setState(() => _image = null);
  //     final M7CapturedImage? response = await M7LivelynessDetection.instance.detectLivelyness(
  //       context,
  //       config: M7DetectionConfig(
  //         steps: [
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.blink,
              
  //             title: "Blink",
  //             isCompleted: false,
  //             detectionColor: Colors.amber,
  //           ),
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.turnLeft,
  //             title: "Turn Your Head Left",
  //             isCompleted: false,
  //             detectionColor: Colors.green.shade800,
  //           ),
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.turnRight,
  //             title: "Turn Your Head Right",
  //             isCompleted: false,
  //             detectionColor: Colors.green.shade800,
  //           ),
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.turnUp,
  //             title: "Turn Your Head Up",
  //             isCompleted: false,
  //             detectionColor: Colors.green.shade800,
  //           ),
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.turnDown,
  //             title: "Turn Your Head Down",
  //             isCompleted: false,
  //             detectionColor: Colors.green.shade800,
  //           ),
  //           M7LivelynessStepItem(
  //             step: M7LivelynessStep.smile,
  //             title: "Smile",
  //             isCompleted: false,
  //             detectionColor: Colors.green.shade800,
  //           ),
  //         ],
  //         startWithInfoScreen: true,
  //         allowAfterMaxSec: false,
  //         maxSecToDetect: 60 * 5,
  //       ),
  //     );
  //     if (response == null) {
  //       if (context.mounted) Navigator.pop(context);
  //       return;
  //     }

  //     setState(
  //       () {
  //         _image = File(response.imgPath);
  //         _doFaceDetection(true);
  //       },
  //     );
  //   } else {
  //     _presenter.postEmployeeDeviceId(widget.endpoint, widget.companyId, _employeeId).then((value) {
  //       _showRegisteredSuccessDialog();
  //     });
  //   }
  // }

  Future<void> _register() async {
    if (_faceRequired) {
      setState(() => _image = null);
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
              step: M7LivelynessStep.turnLeft,
              title: "Turn Your Head Left",
              isCompleted: false,
              detectionColor: Colors.green.shade800,
            ),
            M7LivelynessStepItem(
              step: M7LivelynessStep.turnRight,
              title: "Turn Your Head Right",
              isCompleted: false,
              detectionColor: Colors.green.shade800,
            ),
            // M7LivelynessStepItem(
            //   step: M7LivelynessStep.turnUp,
            //   title: "Turn Your Head Up",
            //   isCompleted: false,
            //   detectionColor: Colors.green.shade800,
            // ),
            // M7LivelynessStepItem(
            //   step: M7LivelynessStep.turnDown,
            //   title: "Turn Your Head Down",
            //   isCompleted: false,
            //   detectionColor: Colors.green.shade800,
            // ),
            M7LivelynessStepItem(
              step: M7LivelynessStep.smile,
              title: "Smile",
              isCompleted: false,
              detectionColor: Colors.green.shade800,
            ),
         
         
          ],
          startWithInfoScreen: true,
          allowAfterMaxSec: false,
          maxSecToDetect: 60 * 5,
        ),
    
      );
     
      if (response == null) {
        print('............');
        if (context.mounted) Navigator.pop(context);
        return;
      }

      setState(
        () {
          _image = File(response.imgPath);
          _doFaceDetection(true,context);
        },
      );
    } else {
      _presenter.postEmployeeDeviceId(widget.endpoint, widget.companyId, _employeeId).then((value) {
        _showRegisteredSuccessDialog();
        print('forwhattttttttttttt');
      });
    }
  }

  verifyLocationAndCheckIn({required BuildContext context}) {
   _presenter.verifyLocation(widget.loginResult);
  }

  Future<void> checkIn([BuildContext? context]) async {
    // if (_faceRequired) {
     if (widget.loginResult['faceRequired']) {
    
      if (context != null) {
            //setState(() => _image = null);
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
                    step: M7LivelynessStep.turnLeft,
                    title: "Turn Your Head Left",
                    isCompleted: false,
                    detectionColor: Colors.green.shade800,
                  ),
                  M7LivelynessStepItem(
                    step: M7LivelynessStep.turnRight,
                    title: "Turn Your Head Right",
                    isCompleted: false,
                    detectionColor: Colors.green.shade800,
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
              print('nulllllllllllllllllllll');
              return;
            }
              print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
            // setState(
            //   () {
                _image = File(response.imgPath);
                _doFaceDetection(false,context);
                print('_doFaceDetection');
            //   },
            // );
        
  }
    } else {
      _presenter.postEmployeeCheckIn(widget.endpoint, widget.companyId, _employeeId, DateTime.now()).then((value) {
        _showCheckedInSuccessDialog();

        AssetsAudioPlayer.newPlayer().open(
          Audio("assets/audios/thank_you.wav"),
          autoStart: true,
        );
      });
    }
  }

  _doFaceDetection(bool register,BuildContext? context) async {
    faces.clear();
 
    _image = await _removeRotation(_image!);
        print('eeeeeeeeeeeeeeeeeeecccccccc${_image}');


    final inputImage = InputImage.fromFile(_image!);
    print('inputImage$inputImage');
    //for checkin

    final options = FaceDetectorOptions(enableClassification: false, enableContours: false, enableLandmarks: false);


     //for checkin
    _faceDetector = FaceDetector(options: options);
      faces = await _faceDetector!.processImage(inputImage);
      print('ayaaaaaaaa');
         //for checkin
       _recognizer = Recognizer();

    _performFaceRecognition(register,context);
        print('_performFaceRecognition');
        print(register);

  }

  _removeRotation(File inputImage) async {
    final img.Image? capturedImage = img.decodeImage(await File(inputImage.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(_image!.path).writeAsBytes(img.encodeJpg(orientedImage));
  }

  _performFaceRecognition(bool register,BuildContext? cxt) async {
    image = await _image?.readAsBytes();
    image = await decodeImageFromList(image);
    print("${image.width}   ${image.height}");

    for (Face face in faces) {
      Rect faceRect = face.boundingBox;
      num left = faceRect.left < 0 ? 0 : faceRect.left;
      num top = faceRect.top < 0 ? 0 : faceRect.top;
      num right = faceRect.right > image.width ? image.width - 1 : faceRect.right;
      num bottom = faceRect.bottom > image.height ? image.height - 1 : faceRect.bottom;
      num width = right - left;
      num height = bottom - top;

      File croppedFace =
          await FlutterNativeImage.cropImage(_image!.path, left.toInt(), top.toInt(), width.toInt(), height.toInt());
      final bytes = await File(croppedFace.path).readAsBytes();
      final img.Image? faceImg = img.decodeImage(bytes);

       Recognition recognition = _recognizer.recognize(faceImg!);

      if (register) {
        LocalDB.updateEmployee(Employee(id: _employeeId, name: _employeeName, array: recognition.embeddings))
            .then((value) {
          _presenter.postEmployeeArray(widget.endpoint, widget.companyId).then((value) {
            _presenter.postEmployeeDeviceId(widget.endpoint, widget.companyId, _employeeId).then((value) {
              print('/////////////////////////${_deviceId}');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(
                     presenter: _presenter,
                            businessUnitResult: widget.businessUnitResult,
                            loginResult: widget.loginResult,
                  )));

                _showRegisteredSuccessDialog(croppedFace: croppedFace);



            });
          });
        });
      } else {

        print('ooooooooooooooooooooooooooooooooooooo');
        if (recognition.distance < 1) {
          _presenter.postEmployeeCheckIn(widget.endpoint, widget.companyId, _employeeId, DateTime.now()).then((value) {
            _showCheckedInSuccessDialog(croppedFace: croppedFace, recognition: recognition,context:cxt);
             print('lnnnnnnnnnnnnnn');
            AssetsAudioPlayer.newPlayer().open(
              Audio("assets/audios/thank_you.wav"),
              autoStart: true,


              
            );
          });
        } else {
          _showCheckInFailedDialog(croppedFace, recognition);
        }
      }
    }
  }

  _showRegisteredSuccessDialog({File? croppedFace}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Registered Successfully!", textAlign: TextAlign.center),
          alignment: Alignment.center,
          content: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    if (_faceRequired)
                      Image.file(
                        croppedFace!,
                        width: 200,
                        height: 200,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Text(
                          'ID: $_employeeId',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 12),
                        Text('Name: $_employeeName', style: const TextStyle(fontSize: 24)),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (context.mounted) Navigator.pop(context);
                            return;
                        // Navigator.of(context, rootNavigator: true).pop();
                        // if (context.mounted) {
                        //   print('gg');
                        //       Navigator.pop(ctx);
                        //     }
                        // navigatorKey.currentState?.pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  _showLogInSuccessDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Login Success!", textAlign: TextAlign.center),
          alignment: Alignment.center,
          content: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Text(
                          'ID: $_employeeId',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 12),
                        Text('Name: $_employeeName', style: const TextStyle(fontSize: 24)),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  Future<void> _showCheckedInSuccessDialog({File? croppedFace,
   Recognition? recognition,BuildContext? context
   }) {
    print('jjjjjjjjjjjjjjjjjj');
return showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Thank You!", textAlign: TextAlign.center),
          alignment: Alignment.center,
          content: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    if (_faceRequired)
                      Image.file(
                        croppedFace!,
                        width: 200,
                        height: 200,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Text(
                          'ID: $_employeeId',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 12),
                        Text('Name: $_employeeName', style: const TextStyle(fontSize: 24)),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _openAttendancePage(context);
                            },
                            child: const Text('History'),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  
    
    
  }

  Future<void> _showCheckInFailedDialog(File croppedFace, 
  Recognition recognition
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Not valid!", textAlign: TextAlign.center),
          alignment: Alignment.center,
          content: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.file(
                      croppedFace,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              checkIn();
                            },
                            child: const Text('Try Again'),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Back'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  @override
  void onGetEmployeeArraySuccess() {
    setState(() => _inProgress = false);

    if (_deviceId == null || LocalDB.getEmployees().isEmpty) {
      _register();
    } else {
      _showLogInSuccessDialog();
    }
  }

  @override
  void onPostEmployeeDeviceIdSuccess(String? deviceId) {
    setState(() => _deviceId = deviceId);
  }

  @override
  void onPostEmployeeDeviceIdFailed() {
    Navigator.pop(context);
  }

  @override
  void onPostEmployeeArraySuccess() {}

  @override
  void onPostEmployeeArrayFailed() {}

  @override
  void onPostEmployeeCheckInSuccess() {}

  @override
  void onPostEmployeeCheckInFailed() {}

  @override
  void onVerifyLocationSuccess([BuildContext? context]) {
    print('eeeeeee====eeeeeeee');
     _presenter.verifyDeviceId(_deviceId,context);
  }

  @override
  void onVerifyLocationFailed(String msg) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _openAttendancePage(BuildContext? cxt) {
    print('_openAttendancePage');
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         AttendancePage(endpoint: widget.endpoint, companyId: widget.companyId, employeeId: _employeeId),
    //   ),
    // );
    Navigator.of(cxt!).push(
      MaterialPageRoute(
        builder: (cxt) =>
            CheckCheckoutPage(endpoint: widget.endpoint, companyId: widget.companyId, employeeId: _employeeId),
            //AttendancePage(endpoint: widget.endpoint, companyId: widget.companyId, employeeId: _employeeId),
      ),
    );
  }

  @override
  void onVerifyDeviceIdSuccess([BuildContext? context]) {
       print('aaaaaaaaaaaaaa');

    checkIn(context);
    
  }

  @override
  void onVerifyDeviceIdFailed(String msg) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
