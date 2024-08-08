// import 'package:camera/camera.dart';
// import 'package:camera/camera.dart';
// import 'package:camera/camera.dart';
import 'package:m7_livelyness_detection/index.dart';
// import 'package:rf/main.dart';

List<CameraDescription> availableCams = [];

class FaceDetectionPage extends StatefulWidget {
  const FaceDetectionPage({super.key});

  @override
  State<FaceDetectionPage> createState() => _FaceDetectionPageState();
  
}

class _FaceDetectionPageState extends State<FaceDetectionPage> {

    // CameraController? controller;
    // List<CameraDescription>? cameras;

     CameraController? controller;
   late List<CameraDescription> cameras;
   late final List<M7LivelynessStepItem> steps;
     late final List<M7LivelynessStepItem> _steps;


  //  List<Face> faceDetected = [];

  // test()async{
  //     cameras = await availableCameras();
  //     print('object');
  // }

  startCamera(int camera)async{
    
      cameras = await availableCameras();

      controller = CameraController(cameras[1],ResolutionPreset.high,enableAudio: false,imageFormatGroup: ImageFormatGroup.yuv420,);
      controller?.initialize().then((_) {
      if (!mounted) {
        print(mounted);
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      print('error:$e');
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void initState() {
        // test();
    startCamera(0);
    super.initState();
   
    //  if(cameras != null)
    // controller = CameraController(cameras![0], ResolutionPreset.max);
    // controller?.initialize().then((_) {
    //   if (!mounted) {
    //     print(mounted);
    //     return;
    //   }
    //   setState(() {});
    // }).catchError((Object e) {
    //   print(e);
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         // Handle access errors here.
    //         break;
    //       default:
    //         // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
  }
   @override
  void dispose() {
    controller?.dispose();
      //  controller?.dispose();

    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
  
    // if(controller != null){
    //   if ( !controller!.value.isInitialized) {
    //         return Container();
    //       }
    //       return Scaffold(
    //         body: CameraPreview(controller!),
    //       );
    // }else{
    //        return Container();

    // }

     if (controller != null && controller!.value.isInitialized) {
      return Scaffold(
        body:  CameraPreview(controller!),
      );
           }else{
            return Container();
           }
    

  }
}