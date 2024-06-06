import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xff4D86BD);
  static const Color primaryOpacity10 = Color(0x1A4D86BD);
  static const Color primaryOpacity5 = Color(0x0D4D86BD);
  static const Color primaryOpacity50 = Color(0x804D86BD);
  static const Color primaryLite = Color(0xffE1EAF1);

  static const Color whiteOpacity60 = Color.fromRGBO(255, 255, 255, 0.6);

  static const Color secondary = Color(0xffEA77B2);

  static const Color lightGrey = Color(0xffE4E4E4);
  static const Color lightGrey2 = Color(0xffE8E8E8);
  static const Color lightGrey3 = Color(0xffCECECE);

  static const Color darkGrey = Color(0xff626262);
  static const Color borderColor = Color(0xffEFEFEF);
  static const Color pinPutColor = Color(0xff4EAEAB);
  static const Color hintColor = Color(0xff858585);
  static const Color hintColor2 = Color(0xffCFCFCB);
  static const Color textColor = Color(0xff585859);
  static const Color amber = Color(0xffFFC107);

  // static const Color prefixIconColor = Color(0xff45ADAB)
  static Color green = const Color(0xff5CE5BB);

  // ;
  // static const Color darkGrey = Colors.grey;
  static const Color filledColor = Color(0xffEFEEF3);

  static const Color black = Colors.black;
  static const Color blue = Colors.blue;

  static const Color blueLite = Color(0xff7FB6FF);

  static const Color blueDark = Color(0xff4467F5);

  static const Color error = Colors.red;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

  static const Color grey = Color(0xffB1B1B1);

  static const Color cfGrey = Color(0xffF7F7F7);

  static const Color blueGray = Color(0xff4EAEAB);

  static const Color lightWhite = Color(0x08584596);

  static const Color red = Color(0xffF82D2D);
  static const Color red2 = Color(0xffD22B2F);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1.0],
    colors: [
      primary,
      secondary,
    ],
  );

  static const LinearGradient primaryGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0, 1.0],
    colors: [
      primary,
      secondary,
    ],
  );

  static const LinearGradient primaryGradient3 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1.0],
    colors: [
      secondary,
      primary,
    ],
  );

  static const LinearGradient liteBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffF4F4FF),
      Color(0xffDAD9FE),
    ],
  );

  static const Color purple = Color(0xffDFA7EE);

  static const LinearGradient greyGradient =
      LinearGradient(colors: [Color(0xffE4E4E4), Color(0xffE4E4E4)]);

  static LinearGradient liteGreyGradient = LinearGradient(colors: [
    black.withOpacity(0.02),
    black.withOpacity(0.02),
  ]);

  static const LinearGradient profileGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 0.4],
    colors: [
      Color(0xff4D86BD),
      Color(0xffF5448A),
    ],
  );

  static const Color darkRed = Color(0xffD50000);

  static const Color liteGreen = Color(0xffD8FFF3);

  static const Color deepOrange = Color(0xffED8164);
  static const Color move = Color(0xff728CF2);

  static const Color green1 = Color(0xff1ABC9C);
  static const Color green2 = Color(0xff5CE5BB);

  static const Color pinkLite = Color(0xffFCB5D1);

  static const Color redLite = Color(0xffFF9090);

  static LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      primary.withOpacity(.1),
      primary.withOpacity(.1),
    ],
  );

  static const Color greyF0 = Color(0xfff0f0f0);

  static const Color greyDark = Color(0xff707070);
  static const Color greyLight = Color(0xffEDF3F8);

  static const Color blue_1 = Color(0xff0080FF);

  static const LinearGradient whiteGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffFFFFFF),
      Color(0xffFFFFFF),
    ],
  );

  static const Color orange = Color(0xffFFA327);
  static const Color goldenYellow = Color(0xffFABF35);

  static const Color lightHintGrey = Color(0xffCFCFCB);

  static const Color mediumGrey = Color(0xffAFAFAF);
  static const Color facebook = Color(0xff3b5998);
}
