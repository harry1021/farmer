import 'package:flutter/material.dart';

class AppThemes {
  /*//Light Theme Colors
  static Color lightBackgroundColor = const Color(0xffFFFFFF);
  static Color lightPrimaryColor = const Color(0xffF5E8EA);
  static Color lightSecondaryColor = const Color(0xff192533);
  static Color iconColor = const Color(0xffEEF0EB);

  ///Light Theme configuration
  static final lightTheme = ThemeData(
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    backgroundColor: lightBackgroundColor,
    primaryColorLight: lightPrimaryColor,
    accentColor: lightSecondaryColor,
    selectedRowColor: tertiaryColor,
    unselectedWidgetColor: iconColor,
    toggleButtonsTheme:
    ToggleButtonsThemeData(color: tertiaryColor, disabledColor: iconColor),
    //buttonTheme: ButtonThemeData(buttonColor: tertiaryColor),
    toggleableActiveColor: tertiaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );*/
  ///Light TextTheme configuration
  static final TextTheme lightTextTheme = TextTheme(
    headline3: mainTitle,
    headline4: title,
    headline5: title_location,
    subtitle1: subtitle,
    bodyText1: body,
    bodyText2: detail,
  );
  /// single view Main Title
  static final TextStyle mainTitle = TextStyle(
     fontSize: 16,
  );

  /// Title
  static final TextStyle title = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400
  );
/// Title
  static final TextStyle title_location = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w600
  );

  /// sell screen title
  static final TextStyle subtitle = TextStyle(
    fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600
  );

  /// Body
  static final TextStyle body = TextStyle(
    fontSize: 16,
  );

  /// Detail
  static final TextStyle detail = TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold
  );
  /// Description
  static final TextStyle description = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400
  );
}