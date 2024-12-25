import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'ResetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isCaptchaVerified = false;
  bool isOtpSent = false;

  // OTP enter Boxes
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();
  final TextEditingController otpController6 = TextEditingController();
  Future<bool> backbutton(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    return false;
  }
  bool isOtpExpired = false;
  String timerText = '60';
  late Timer timer;
  @override
  void dispose() {
    // Cancel the timer if the widget is disposed
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  void startOtpTimer() {
    setState(() {
      isOtpExpired = false;
      timerText = '60';
    });

    int counter = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
          timerText = counter.toString();
        } else {
          isOtpExpired = true;
          timer.cancel();
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return backbutton(context);
        },
        child: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(

              children: [
                Stack(
                  alignment: Alignment.center,
                  // Centers the content in the Stack
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child:  Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 30,
                          ),
                        ),

                        Spacer(),
                      ],
                    ),
                    Image.asset(
                      "assets/img/splash.png",
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                if (!isOtpSent)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.5),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I'm not a robot",
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: isCaptchaVerified,
                              onChanged: (value) {
                                setState(() {
                                  isCaptchaVerified = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: isCaptchaVerified
                              ? () {
                                  setState(() {
                                    isOtpSent = true;
                                  });
                                  startOtpTimer();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('OTP Sent!')),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isCaptchaVerified ? Colors.orange : Colors.grey,
                          ),
                          child: Text('Send OTP'),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),

                // OTP Input Container
                if (isOtpSent)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildOtpTextField(otpController1),
                            SizedBox(width: 10),
                            buildOtpTextField(otpController2),
                            SizedBox(width: 10),
                            buildOtpTextField(otpController3),
                            SizedBox(width: 10),
                            buildOtpTextField(otpController4),
                            SizedBox(width: 10),
                            buildOtpTextField(otpController5),
                            SizedBox(width: 10),
                            buildOtpTextField(otpController6),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('OTP Submitted!')),
                                );
                                // Submition api and match this OTP
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>resetpassword()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isOtpSent && isOtpExpired)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isOtpSent = false;
                                    isOtpExpired = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                child: Text('Resend OTP',
                                style: TextStyle(color: Colors.white),
                                ),
                              ),

                            // Timer Text
                            if (isOtpSent && !isOtpExpired)
                              Text(
                                'Resend OTP in: $timerText seconds',
                                style: TextStyle(fontSize: 14, color: Colors.red),
                              ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )))));
  }
  Widget buildOtpTextField(TextEditingController controller) {
    return Container(
      width: 40,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // Limit the number of characters to 1
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.5),
          ),
          hintText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to next TextField automatically
          }
        },
      ),
    );
  }
}
