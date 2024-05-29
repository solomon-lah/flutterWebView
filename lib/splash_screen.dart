import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_view/web_browser/screens/attachments/animated_row.dart';
import 'package:web_view/web_browser/screens/custom_browser.dart';
import 'package:web_view/web_browser/utilities/assets_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _animationController.addListener(_animationFunction);
    _animationController.repeat();
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomBroswer(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            splashScreenBackgroundImage,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(
                    0.5,
                  ),
                  Colors.black
                ],
                begin: Alignment.centerLeft,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Image.asset(
                    logoImage,
                    height: 10.h,
                    width: 30.w,
                  ),
                ),
                AnimatedRow(currentIndex: _currentIndex)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _animationFunction() {
    if (_animationController.value >= 0 && _animationController.value <= 0.3) {
      _currentIndex = 0;
    } else if (_animationController.value > 0.3 &&
        _animationController.value <= 0.7) {
      _currentIndex = 1;
    } else {
      _currentIndex = 2;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
