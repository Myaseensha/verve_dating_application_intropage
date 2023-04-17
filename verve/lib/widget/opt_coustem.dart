import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(232, 230, 234, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color.fromRGBO(232, 230, 234, 1),
    ),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(224, 117, 181, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color.fromRGBO(195, 52, 138, 1),
    ),
    borderRadius: BorderRadius.circular(20),
  ),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!
      .copyWith(color: const Color.fromRGBO(154, 105, 225, 1)),
);
