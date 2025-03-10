
import 'package:emptest/app/Routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.nearbyWifiDevices,
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.microphone]!.isDenied) {
      print("Microphone permission denied.");
    } else if (statuses[Permission.microphone]!.isPermanentlyDenied) {
      openAppSettings(); // Redirect user to app settings
    }
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: ApPages.routes,

    );
  }
}

