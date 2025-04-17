import 'package:flutter/material.dart';
import 'package:nba_flutter_app/task_details/widgets/take_action_btn.dart';
import 'package:nba_flutter_app/core/local_storage.dart';
import 'package:nba_flutter_app/login/view/otp.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _controller = TextEditingController();

  void _goToOtpScreen() {
    if (_controller.text.length == 10) {
      LocalStorage.setAgentPhone(_controller.text);
      pushWithTransition(context, OtpScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/wr_logo.png', width: 94, height: 103),
          const SizedBox(height: 20),
          const Text(
            "Login to\nWealthRight",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xff1A2A30),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(color: Color(0xff09161C)),
                    height: 48,
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: _controller,
                      keyboardType: TextInputType.phone,
                      maxLength:
                          13,   
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                      textAlign:
                          TextAlign
                              .start,
                      textAlignVertical:
                          TextAlignVertical
                              .center,
                      decoration: InputDecoration(
                        prefixText: '+91 ',
                        prefixStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            color: Color(0xff0E86A6),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: Color(0xff0F172A)),
                        ),
                        counterText: "",
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  TakeActionBtn(
                    title: 'SEND OTP',
                    height: 48,
                    onPressed: () {
                      _goToOtpScreen();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
