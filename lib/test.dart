import 'package:ecommerceapp/core/functions/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  intialData() async {
    res = await checkInternet();
        print(res);

  }

  @override
  void initState() {
    // TODO: implement initState
    intialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OtpTextField(
        fieldWidth: 50,
        borderRadius: BorderRadius.circular(8),
        numberOfFields: 4,
        borderColor: const Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Verification Code"),
                  content: Text('Code entered is $verificationCode'),
                );
              });
        }, // end onSubmit
      ),
    );
  }
}
