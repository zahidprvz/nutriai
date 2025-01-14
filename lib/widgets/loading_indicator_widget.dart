import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends AnimatedWidget {
  const LoadingIndicatorWidget(
      {Key? key, required AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Your custom animation using _progress.value
          // For example, a custom painter or a rotating image
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value:
                  _progress.value, // Use the animation value for the indicator
              strokeWidth: 5,
            ),
          ),
          // An example of a child widget that rotates
          Transform.rotate(
            angle: _progress.value * 2.0 * 3.14159, // Full rotation
            child: Image.asset(
              'assets/logo.png', // Replace with your logo
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
