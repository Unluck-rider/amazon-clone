import 'package:emptest/app/Screens/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
 // void backClick() {}

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen() ));
    });


  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildlogo(),
      ),
      onWillPop: () async {
      //  backClick();
        return false;
      },
    );
  }

  Container buildlogo() {
    return Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/img/splash.png",
            height: 130,
            width: 130,
          ),
        ));
  }
}
