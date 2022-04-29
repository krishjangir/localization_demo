import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_size_config.dart';

import 'app_text_theme.dart';
import 'colors.dart';
import 'font_family.dart';

//This class is used to handle our app theme
class AppTheme {
  AppTheme._();

  //app theme
  static appTheme(context) {
    return ThemeData(
      fontFamily: FontFamily.appFontFamily,
      primaryColor: AppColors.colorPrimary,
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: AppColors.colorBackground,
      brightness: Brightness.light,
      hintColor: Colors.grey,
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppColors.colorAccent),
      inputDecorationTheme:
          const InputDecorationTheme(hintStyle: TextStyle(color: Colors.grey)),
      dividerColor: Colors.grey.withOpacity(0.7),
      backgroundColor: Colors.white54,
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.colorPrimary,
          elevation: SizeConfig.standardElevation,
          contentTextStyle: const TextStyle(color: Colors.white)),
      textTheme: AppTextTheme.textTheme,
      floatingActionButtonTheme: Theme.of(context)
          .floatingActionButtonTheme
          .copyWith(
              backgroundColor: AppColors.colorPrimary,
              splashColor: AppColors.colorPrimary.withOpacity(0.7)),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: const ColorScheme.light(),
          buttonColor: AppColors.colorPrimary,
          splashColor: AppColors.colorPrimary.withOpacity(0.7)),
      bottomNavigationBarTheme: Theme.of(context)
          .bottomNavigationBarTheme
          .copyWith(
            backgroundColor: CupertinoColors.tertiarySystemGroupedBackground,
            elevation: SizeConfig.smallerFontSize,
            selectedItemColor: AppColors.materialColorPrimary,
            selectedLabelStyle:
                TextStyle(fontSize: SizeConfig.standardFontSize),
            unselectedLabelStyle:
                TextStyle(fontSize: SizeConfig.standardFontSize),
          ),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
          color: Colors.white,
          elevation: SizeConfig.standardElevation,
          iconTheme: const IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarTextStyle: TextTheme(
                  headline6: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.headlineFontSize))
              .bodyText2,
          titleTextStyle: TextTheme(
                  headline6: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.headlineFontSize))
              .headline6),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: AppColors.materialColorPrimary)
              .copyWith(secondary: AppColors.colorAccent),
    );
  }
}
