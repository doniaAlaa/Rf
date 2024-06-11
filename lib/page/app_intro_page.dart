import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/const/app_routers.dart';
import 'package:test2/page/login_page.dart';

class AppIntroPage extends StatefulWidget {
  const AppIntroPage({super.key});

  @override
  State<AppIntroPage> createState() => _AppIntroPageState();
}

class _AppIntroPageState extends State<AppIntroPage> {
  late Location location = Location();

  late bool _serviceEnabled;

  late PermissionStatus _permissionGranted;



  Future<void> _handleLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
             Navigator.pushNamed(context, AppRoutes.homePage);

        //return;
      }
    }
  }

  // isUserLoggedIn()async{
  //   String? userData = await SecureStorage().getUserModel();
  //   if (userData != null){
  //           Navigator.pushNamed(context, AppRoutes.homePage);

  //   }
  // }

  //  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_)async {

  //     String? userData = await SecureStorage().getUserModel();
  //   if (userData != null){
  //           Navigator.pushNamed(context, AppRoutes.homePage);

  //   }
  //   });

    // isUserLoggedIn();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[100],
          title: const Text('RF Mobile'),
        ),
        body: FutureBuilder<void>(
            future: _handleLocationPermission(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return 
              _permissionGranted == PermissionStatus.granted
                  ? const LoginPage()
                  : 
                  Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('To use this app you must enable access to your location.'),
                        Text(_permissionGranted.toString()),
                        const SizedBox(height: 12),
                        FilledButton(
                            onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.location),
                            child: const Text('Open Location Settings')),
                      ],
                    ));
            }),
      );
  }
}