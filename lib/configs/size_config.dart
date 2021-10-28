import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double defaultSize;
  late Orientation orientation;

  SizeConfig({
    required BuildContext context,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(BuildContext context, double inputHeight) {
  double screenHeight = SizeConfig(context: context).screenHeight;
  // 815 is the layout height that designer use
  return (inputHeight / 815.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(BuildContext context, double inputWidth) {
  double screenWidth = SizeConfig(context: context).screenWidth;
  // 414 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}

// For add free space vertically (間距)
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    Key? key,
    this.of = 25,
  }) : super(key: key);
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(context, of),
    );
  }
}
