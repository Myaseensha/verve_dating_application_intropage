import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:verve/core/h_w.dart';
import '../../core/text_style.dart';
import '../../widget/button.dart';
import '../../widget/opt_coustem.dart';
import 'verve_userinfo_screen.dart';

class VerveOTPScreen extends StatefulWidget {
  const VerveOTPScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerveOTPScreenState createState() => _VerveOTPScreenState();
}

class _VerveOTPScreenState extends State<VerveOTPScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  late Timer _timer;
  int _countdown = 45;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String text = "";

  onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(135, 63, 159, 1)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '00:$_countdown',
              style: textStyleLarge,
            ),
            conHeight10,
            const Text(
              'Type the verification code \nwe’ve sent you',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Sk-Modernist",
                  fontSize: 18),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_focusNode);
              },
              child: AbsorbPointer(
                child: Pinput(
                  readOnly: true,
                  focusNode: _focusNode,
                  controller: _pinPutController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: (String otp) {
                    _focusNode.unfocus();
                  },
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            NumericKeyboard(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              onKeyboardTap: (String value) {
                _pinPutController.text = _pinPutController.text + value;
              },
              rightButtonFn: () {
                if (_pinPutController.text.isNotEmpty) {
                  _pinPutController.text = _pinPutController.text
                      .substring(0, _pinPutController.text.length - 1);
                }
              },
              rightIcon: const Icon(Icons.backspace_outlined),
            ),
            conHeight20,
            const Text(
              'Resend verification code',
              style: TextStyle(
                  color: Color.fromRGBO(154, 105, 225, 1),
                  fontFamily: "Raleway",
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            conHeight20,
            const CoustemButton(
                colorB: Color.fromRGBO(195, 52, 138, 1),
                colorF: Colors.white,
                title: "CONTINUE",
                style: textSmallBold,
                classname: VervevUserScreen()),
          ],
        ),
      ),
    );
  }
}
