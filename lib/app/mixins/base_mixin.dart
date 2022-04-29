import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_demo/app/bloc/login/login_bloc.dart';

import '../bloc/app/app_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../res/app_size_config.dart';
import '../res/colors.dart';
import '../res/localization/constants.dart';
import '../res/localization/localization.dart';
import '../ui/home/home_screen.dart';
import '../ui/login/login_screen.dart';
import '../widgets/buttons.dart';
import '../widgets/text_widget.dart';

//we will write some important methods here which are used in multiple screens
mixin BaseMixin {
  //Alert for confirmation to exit app on back press
  Future<bool> onWillPop(BuildContext context) async {
    return (await showAlertDialog(
      context: context,
      title: Localization.of(context)?.txtAreYouSure,
      content: Localization.of(context)?.txtExitApp,
      actionYes: () {
        exit(0);
      },
    ));
  }

  Future<bool> showAlertDialog(
      {required BuildContext context,
      required Function actionYes,
      required String? title,
      required String? content}) async {
    return await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              if (Platform.isIOS) {
                return CupertinoAlertDialog(
                  title: Text(title ?? ''),
                  content: Text(content ?? ''),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text(Localization.of(context)?.txtNo ?? '',
                          style: TextStyle(color: AppColors.colorSearchText)),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    CupertinoDialogAction(
                      child: Text(Localization.of(context)?.txtYes ?? '',
                          style: const TextStyle(color: Colors.red)),
                      onPressed: () => actionYes(),
                    ),
                  ],
                );
              } else {
                return AlertDialog(
                  title: Text(title ?? ''),
                  content: Text(content ?? ''),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(Localization.of(context)?.txtNo ?? '',
                          style: TextStyle(color: AppColors.colorSearchText)),
                    ),
                    TextButton(
                      onPressed: () => actionYes(),
                      child: Text(Localization.of(context)?.txtYes ?? '',
                          style: const TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              }
            }) ??
        false;
  }

  //show Menu Dialog at home screen
  showMenuDialog({required BuildContext context}) {
    BorderedButton _getLanguageButton(
            AppState state, String languageCode, String? language) =>
        BorderedButton(
            buttonText: languageCode,
            buttonSubText: language,
            borderColor: AppColors.colorBorderBlue,
            textColor: state.currentLanguage == languageCode
                ? AppColors.colorWhite
                : AppColors.colorBorderBlue,
            subTextColor: state.currentLanguage == languageCode
                ? AppColors.colorWhite
                : AppColors.colorBorderBlue,
            buttonColor: state.currentLanguage == languageCode
                ? AppColors.colorBorderBlue
                : AppColors.colorWhite,
            minHeight: SizeConfig.size_40,
            minWidth: SizeConfig.size_150,
            radius: SizeConfig.size_20,
            onPressed: () {
              context
                  .read<AppBloc>()
                  .add(CurrentLanguageChanged(currentLanguage: languageCode));
              Navigator.pop(context);
            });

    Dialog menuDialog = Dialog(
      insetPadding: EdgeInsets.all(SizeConfig.size_12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.size_12)),
      //this right here
      child: SizedBox(
        height: SizeConfig.size_250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.size_16),
                  child: Icon(
                    Icons.clear_rounded,
                    size: SizeConfig.size_28,
                    color: AppColors.colorBorderBlue,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.size_16),
              child: TextWidget(
                  text: Localization.of(context)?.changeLanguage,
                  textSize: SizeConfig.font_20),
            ),
            BlocBuilder<AppBloc, AppState>(
                buildWhen: (previous, current) =>
                    previous.currentLanguage != current.currentLanguage,
                builder: (cxt, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _getLanguageButton(state, Languages.english.languageCode!,
                          Localization.of(context)?.english),
                      _getLanguageButton(
                          state,
                          Languages.japanese.languageCode!,
                          Localization.of(context)?.japanese),
                    ],
                  );
                }),
            Padding(
              padding: EdgeInsets.all(SizeConfig.size_20),
              child: BlocListener<HomeBloc, HomeState>(
                  listener: (cxt, state) {
                    if (state.isLoggedOut!) {
                      context.read<LoginBloc>().add(const LoginInit());
                      context.read<HomeBloc>().add(const HomeInit());
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.id, (route) => false);
                    }
                  },
                  listenWhen: (previous, current) =>
                      previous.isLoggedOut != current.isLoggedOut,
                  child: RoundedButton(
                    text: Localization.of(context)?.txtLogout.toUpperCase(),
                    color: AppColors.colorWhite,
                    backgroundColor: AppColors.colorBorderBlue,
                    onTap: () {
                      showAlertDialog(
                          context: context,
                          actionYes: () {
                            context.read<HomeBloc>().add(const LogOut());
                          },
                          title: Localization.of(context)?.txtAreYouSure,
                          content: Localization.of(context)?.txtWantToLogout);
                    },
                  )),
            )
          ],
        ),
      ),
    );
    return showDialog(
        context: context, builder: (BuildContext context) => menuDialog);
  }
}
