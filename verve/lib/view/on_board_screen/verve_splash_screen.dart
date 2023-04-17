import 'package:flutter/material.dart';
import 'package:verve/core/h_w.dart';
import 'package:verve/view/on_board_screen/verve_number_registertion_screen.dart';

class VervevSplashScreen extends StatefulWidget {
  const VervevSplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VervevSplashScreenState createState() => _VervevSplashScreenState();
}

class _VervevSplashScreenState extends State<VervevSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Gradient> _vervevSplashScreen;

  @override
  void initState() {
    super.initState();

    // animation controller--------------------------------------
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    // animation tween-----------------------------------------------
    final gradientTween = LinearGradientTween(
      begin: const LinearGradient(
        colors: [
          Color.fromRGBO(154, 105, 225, 1),
          Color.fromRGBO(255, 173, 237, 1),
          Color.fromRGBO(152, 210, 235, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      end: const LinearGradient(
        colors: [
          Color.fromRGBO(152, 210, 235, 1),
          Color.fromRGBO(255, 173, 237, 1),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    );

    //  animated gradient---------------------------------------------
    _vervevSplashScreen = gradientTween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: _vervevSplashScreen.value,
            ),
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/verve_white.png'),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: Text(
                      "Connecting hearts \nbeyond the binary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        height: 1.14,
                        letterSpacing: -0.3333333432674408,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VreveNumberRegistretion(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15,
                    vertical: screenHeight * 0.03,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
                ),
                child: Text(
                  "LET'S GET \nSTARTED",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: screenHeight * 0.024,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            conHeight20,
          ],
        ));
  }
}

class LinearGradientTween extends Tween<Gradient> {
  LinearGradientTween({required Gradient begin, required Gradient end})
      : super(begin: begin, end: end);

  @override
  Gradient lerp(double t) {
    return Gradient.lerp(begin, end, t)!;
  }
}
