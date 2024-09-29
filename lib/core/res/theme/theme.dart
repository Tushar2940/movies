
import 'package:flutter/material.dart';
import 'package:movies/core/res/colors/movie_colors.dart';
import 'appbar_theme.dart';
import 'text_form_field_theme.dart';
import 'text_theme.dart';

class MTheme{
  const MTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: MColors.primaryColor,
    scaffoldBackgroundColor: MColors.white,
    textTheme: MTextTheme.lightTextTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: AppbarTheme.lightAppBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: MColors.primaryColor,
      scaffoldBackgroundColor: MColors.scaffoldBgColorDark,
      textTheme: MTextTheme.darkTextTheme,
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
      appBarTheme: AppbarTheme.darkAppBarTheme,
  );
}