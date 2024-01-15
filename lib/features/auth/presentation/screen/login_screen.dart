import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/navigator_manager.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';
import 'package:think_hat_test/core/util.dart';
import 'package:think_hat_test/features/home/presentation/widget/page_wrapper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appColor.transparent),
    );
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: appColor.transparent),
      child: Scaffold(
        backgroundColor: appColor.yellow,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 140,
                height: 161,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        loginTopLines,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(loginCurve), fit: BoxFit.fill),
                ),
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 88),
                      _OnboardSlideScrollWidget(),
                      SizedBox(height: 50),
                      _LoginButton(),
                      SizedBox(height: 50),
                      _SignUpTextWidget(),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String prefixImage,
      {Color? fillColor, String? hintText}) {
    return InputDecoration(
      fillColor: fillColor,
      hintText: hintText,
      hintStyle:
          appTheme.light.textTheme.titleMedium?.copyWith(color: appColor.gray),
      prefixIconConstraints: BoxConstraints(
          maxHeight: prefixImage == shipItem ? 30.0 : 20, maxWidth: 63),
      // constraints: const BoxConstraints(maxHeight: 43),
      prefixIcon: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 2),
              child: Image.asset(prefixImage)),
          const SizedBox(width: 8),
          Container(
            color: appColor.gray,
            width: 1,
            height: 32,
          ),
        ],
      ),
    );
  }
}

class _OnboardSlideScrollWidget extends StatefulWidget {
  const _OnboardSlideScrollWidget({
    super.key,
  });

  @override
  State<_OnboardSlideScrollWidget> createState() =>
      _OnboardSlideScrollWidgetState();
}

class _OnboardSlideScrollWidgetState extends State<_OnboardSlideScrollWidget> {
  final onboardList = List.generate(3, (index) => loginSlide1);
  var selectedIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 480,
          child: PageView(
            controller: pageController,
            onPageChanged: (change) {
              setState(() {
                selectedIndex = change;
              });
            },
            children: onboardList
                .map((e) => Column(
                      children: [
                        Image.asset(e),
                        const SizedBox(
                          height: 97,
                        ),
                        Text(
                          'Welcome to E-Bikes',
                          style:
                              context.theme.textTheme.headlineLarge?.copyWith(
                            color: Color(0xFF041C2E),
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                            letterSpacing: 0.48,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Buying Electric bikes just got a lot easier, \nTry us today.',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.titleSmall?.copyWith(
                            color: Color(0xFF95823C),
                            height: 1.8,
                            letterSpacing: 0.50,
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: onboardList.asMap().entries.map((e) {
            final index = e.key;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                pageController.animateToPage(selectedIndex,
                    curve: Curves.ease, duration: Duration(milliseconds: 500));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor:
                      selectedIndex == index ? appColor.black : appColor.white,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(NavigatorManager.home);
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12)),
      child: SizedBox(
        height: 30,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: SvgPicture.asset(googleIcon),
              backgroundColor: appColor.white,
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Login with Google",
                    style: context.theme.textTheme.titleMedium?.copyWith(
                        height: 0.12,
                        letterSpacing: 0.50,
                        fontWeight: FontWeight.w500,
                        color: appColor.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _SignUpTextWidget extends StatelessWidget {
  const _SignUpTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don’t have any account?",
        children: [
          TextSpan(
            text: " Sign Up",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showSuccess(context, "Sign Up page coming soon");
              },
            style: context.theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
      style: context.theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: appColor.black.withOpacity(0.55)),
    );
  }
}
