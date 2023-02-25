import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // button animation
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    // button animation
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND START ==================================================
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: SizedBox(),
            ),
          ),
          // BACKGROUND END ====================================================

          // TEXT START ========================================================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: const [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Don't skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools")
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  // BUTTON START =================================================
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                        // close it while tap outside
                        barrierDismissible: true,
                        barrierLabel: "Sign in",
                        context: context,
                        pageBuilder: (context, _, __) => Center(
                          child: Container(
                            height: 620,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(
                              vertical: 32,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.94),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                children: [
                                  Text(
                                    "Sign in",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Text(
                                      "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SignInForm(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // BUTTON END ===================================================

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                    ),
                  ),
                ],
              ),
            ),
          )
          // TEXT END===========================================================
        ],
      ),
    );
  }
}


