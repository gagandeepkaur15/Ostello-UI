import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ostello/theme/app_theme.dart';
import 'package:ostello/widgets/app_bar.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String number;
  const OtpVerificationScreen({
    super.key,
    required this.number,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late Timer _timer;
  int _start = 18;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _isButtonDisabled = true;
    _start = 18;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = false;
        });
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendOtp() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: const OstelloAppBar(isBackVisible: true),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 292,
                width: 263,
                child: Image.asset("assets/images/otp.png"),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP",
                    style: context.theme.textTheme.titleMedium!.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Text(
                    " Verfication",
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter the OTP sent to ${widget.number}  ",
                    style: context.theme.textTheme.displayMedium!.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  Image.asset("assets/images/edit.png")
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Pinput(
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.theme.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  showCursor: true,
                  onCompleted: (pin) {
                    debugPrint('Entered PIN: $pin');
                    Navigator.pushNamed(
                      context,
                      '/name',
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn’t receive the code? ",
                    style: context.theme.textTheme.displayMedium,
                  ),
                  _isButtonDisabled
                      ? Text(
                          "Resend in ${_start}s ",
                          style:
                              context.theme.textTheme.displayMedium!.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        )
                      : TextButton(
                          onPressed: _isButtonDisabled ? null : _resendOtp,
                          child: Text(
                            "Resend OTP",
                            style:
                                context.theme.textTheme.displayMedium!.copyWith(
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
