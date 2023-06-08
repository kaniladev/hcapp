import 'package:flutter/material.dart';

import 'constants.dart';

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: bgColorLightTheme,
  textTheme: const TextTheme(),
  elevatedButtonTheme: elevatedButtonThemeData,
  colorScheme: ThemeData.light().colorScheme.copyWith(
    secondary: secondaryColorLightTheme
  )
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: bgColorDarkTheme,
  textTheme: const TextTheme(),
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    secondary: secondaryColorDarkTheme)
);

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: primaryColor,
    padding: EdgeInsets.all(defaultPadding),
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(defaultBorderRadius)
      )
    )
  )
);