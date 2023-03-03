import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffF8F8F8),
    primaryColor: Color(0xffFFFFFF),
    bannerTheme: MaterialBannerThemeData(backgroundColor: Colors.grey[200]),
    appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
    cardTheme: CardTheme(
      color: Color(0xffFFFFFF),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.black,
      ),
      caption: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      headline1: TextStyle(
        color: Colors.black,
      ),
      headline2: TextStyle(
        color: Colors.black,
      ),
      headline3: TextStyle(
        color: Colors.black,
      ),
      headline4: TextStyle(
        color: Colors.black,
      ),
      headline5: TextStyle(
        color: Colors.black,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ).copyWith(secondary: Color(0xffE5E5E5)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff303030),
    primaryColor: Color(0xff424242),
    cardColor: Color(0xff242526),
    bannerTheme: MaterialBannerThemeData(backgroundColor: Color(0xff424242)),
    appBarTheme: AppBarTheme(
        color: Color(0xff212121),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
    cardTheme: CardTheme(
      color: Color(0xff424242),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      overline: TextStyle(
        color: Colors.black,
      ),
      button: TextStyle(
        color: Colors.black,
      ),
      caption: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      headline1: TextStyle(
        color: Colors.black,
      ),
      headline2: TextStyle(
        color: Colors.black,
      ),
      headline3: TextStyle(
        color: Colors.black,
      ),
      headline4: TextStyle(
        color: Colors.black,
      ),
      headline5: TextStyle(
        color: Colors.black,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF73BDBF),
      onPrimary: Colors.black,
      onSurface: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ).copyWith(secondary: Color(0xff3D3D3D)),
  );
}
