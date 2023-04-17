import 'package:flutter/material.dart';
import 'package:verve/core/h_w.dart';
import 'package:verve/core/padding.dart';
import 'package:verve/core/text_style.dart';
import 'package:verve/view/on_board_screen/verve_otp_screen.dart';
import 'package:verve/widget/button.dart';

class VreveNumberRegistretion extends StatefulWidget {
  const VreveNumberRegistretion({super.key});

  @override
  State<VreveNumberRegistretion> createState() =>
      _VreveNumberRegistretionState();
}

class _VreveNumberRegistretionState extends State<VreveNumberRegistretion> {
  String _selectedCountryCode = '+1';
  final TextEditingController _phoneNumberController = TextEditingController();

  final List<Map<String, dynamic>> _countryCodes = [
    {'code': '+1', 'flag': 'assets/download.jpeg'},
    {'code': '+44', 'flag': 'assets/flag.jpg'},
    {'code': '+91', 'flag': 'assets/download (1).jpeg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(135, 63, 159, 1)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: pRL20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            conHeight20,
            const Text(
              "My mobile",
              style: textStyleLarge,
            ),
            conHeight20,
            const Text(
                "Please enter your valid phone number. We \nwill send you a 4-digit code to verify your \naccount. ",
                style: textStyleSmall),
            conHeight20,
            Container(
              padding: p10,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButtonFormField<Map<String, dynamic>>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Country Code',
                        ),
                        value: _countryCodes.firstWhere(
                          (country) => country['code'] == _selectedCountryCode,
                        ),
                        onChanged: (Map<String, dynamic>? value) {
                          setState(() {
                            _selectedCountryCode = value!['code'];
                          });
                        },
                        items: _countryCodes.map((country) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: country,
                            child: Row(
                              children: [
                                Image.asset(
                                  country['flag'],
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 5),
                                Text(country['code']),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            conHeight20,
            const Text(
                "We will never share your private information \nwith anyone and it won’t appear on your \nprofile. ",
                style: textStyleSmall),
            const Spacer(),
            const CoustemButton(
                colorB: Color.fromRGBO(195, 52, 138, 1),
                colorF: Colors.white,
                title: "CONTINUE",
                style: textSmallBold,
                classname: VerveOTPScreen()),
            conHeight20
          ],
        ),
      )),
    );
  }
}
