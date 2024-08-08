import 'package:m7_livelyness_detection/index.dart';
import 'package:test2/core/reusable_widgets/app_button.dart';

class FaceRegisterPage extends StatelessWidget {
  const FaceRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 80),
              child: Text(
                'Registeration',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Lottie.asset(
                'assets/lottie/livelyness-start.json',
                // package: M7AssetConstants.packageName,
                animate: true,
                repeat: true,
                reverse: false,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 153, 151, 151)
                            .withOpacity(0.5), // Semi-transparent black
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      RegisterationOption(),
                      SizedBox(
                        height: 80,
                      ),
                      RegisterationOption(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryAppButton(
              buttonWidth: 170,
              buttonRadius: 30,
              buttonHeight: 60,
              buttonTile: 'Start!!!',
              buttonTitleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
              onPress: () async{
                 //  Navigator.pushNamed(context, AppRoutes.faceDetectionPage);

                   
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
     

                // if (_formKey.currentState!.validate()) {
                //   // If the form is valid, display a snackbar. In the real world,
                //   // you'd often call a server or save the information in a database.
                //   LoginCubit.get(context).login(
                //       url: urlController.text,
                //       username: usernameController.text,
                //       password: passwordController.text,
                //       companyId: compIdController.text,
                //       context: context);
                //   // ScaffoldMessenger.of(context).showSnackBar(
                //   //   const SnackBar(content: Text('Processing Data')),
                //   // );
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}

class RegisterationOption extends StatelessWidget {
  const RegisterationOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40,
            width: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 48, 98, 17),
                  shape: BoxShape.circle),
              child: Center(
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Lighting',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              child: const Text(
                'Make sure you are in a well lit area and both ears are uncovered',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
