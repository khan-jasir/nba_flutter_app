import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/task_details/widgets/take_action_btn.dart';
import 'package:nba_flutter_app/dashboard.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/view/home.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode());
  int _resendIn = 30;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendIn > 0) {
        setState(() {
          _resendIn--;
        });
        _startResendTimer();
      }
    });
  }

  @override
  void dispose() {
    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _login() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 6) {
      pushWithTransition(context, Dashboard());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1D26),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/wr_logo.png',
            width: 94,
            height: 103,
          ),
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
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xff1A2A30),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 40,
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          counterText: '',
                          fillColor: const Color(0xFF1C2E36),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFF0E86A6),
                              width: 2,
                            ),
                          )
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (index < 5) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            } else {
                              FocusScope.of(context).unfocus(); // Hide keyboard
                            }
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                TakeActionBtn(
                  title: 'LOGIN',
                  onPressed: _login,
                  height: 48,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
