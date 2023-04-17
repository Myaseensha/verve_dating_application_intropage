import 'package:flutter/material.dart';

class VervevUserScreen extends StatelessWidget {
  const VervevUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("UserInfo"),
      )),
    );
  }
}
