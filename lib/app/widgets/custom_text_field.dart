import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization_demo/app/widgets/text_widget.dart';

import '../res/app_size_config.dart';
import '../res/colors.dart';
import '../res/font_family.dart';

class CustomRoundTextField extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String? hintText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool? isEmail;
  final bool? enable;
  final bool showHintText;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const CustomRoundTextField(
      {Key? key,
      this.icon,
      this.hintText = "",
      this.isEmail = false,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.isPassword = false,
      this.keyboardType,
      this.controller,
      this.enable,
      this.minLines = 1,
      this.maxLines = 1,
      this.maxLength = 120,
      this.readOnly = false,
      this.showHintText = true,
      this.initialValue,
      this.onTap,
      this.inputFormatters,
      this.iconAsset = '',
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, SizeConfig.size_10, 0, SizeConfig.size_5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: showHintText,
            child: TextWidget(
                text: hintText,
                textSize: SizeConfig.font_16,
                fontWeight: FontStyles.semiBold),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, SizeConfig.size_5, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38.withOpacity(0.1),
                    blurRadius: 35,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: TextFormField(
                textInputAction: textInputAction,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                readOnly: readOnly,
                controller: controller,
                enabled: enable,
                minLines: minLines,
                maxLines: maxLines,
                maxLength: maxLength,
                initialValue: initialValue,
                onTap: onTap,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  prefixIcon: iconAsset != null
                      ? Transform.scale(
                          scale: 0.6,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(iconAsset!),
                          ),
                        )
                      : Icon(
                          icon,
                          color: AppColors.colorPrimary,
                        ),
                  hintText: hintText,
                  errorMaxLines: 4,
                  counterText: '',
                  contentPadding: EdgeInsets.all(SizeConfig.size_15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.size_25),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.colorPrimary,
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: isPassword ? true : false,
                validator: validator,
                onSaved: onSaved,
                onChanged: onChanged,
                keyboardType: keyboardType,
                autocorrect: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModifiedLengthLimitingTextInputFormatter
    extends LengthLimitingTextInputFormatter {
  // ignore: unused_field
  final int _maxLength;

  ModifiedLengthLimitingTextInputFormatter(this._maxLength) : super(_maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Return the new value when the old value has not reached the max
    // limit or the old value is composing too.
    if (newValue.composing.isValid) {
      if (maxLength != null &&
          maxLength! > 0 &&
          oldValue.text.characters.length == maxLength &&
          !oldValue.composing.isValid) {
        return oldValue;
        //START OF FIX
      } else if (newValue.text.characters.length > maxLength!) {
        return oldValue;
      }
      //END OF FIX
      return newValue;
    }
    if (maxLength != null &&
        maxLength! > 0 &&
        newValue.text.characters.length > maxLength!) {
      // If already at the maximum and tried to enter even more, keep the old
      // value.
      if (oldValue.text.characters.length == maxLength) {
        return oldValue;
      }
      return truncate(newValue, maxLength!);
    }
    return newValue;
  }

  static TextEditingValue truncate(TextEditingValue value, int maxLength) {
    final CharacterRange iterator = CharacterRange(value.text);
    if (value.text.characters.length > maxLength) {
      iterator.expandNext(maxLength);
    }
    final String truncated = iterator.current;
    return TextEditingValue(
      text: truncated,
      selection: value.selection.copyWith(
        baseOffset: min(value.selection.start, truncated.length),
        extentOffset: min(value.selection.end, truncated.length),
      ),
      composing: TextRange.empty,
    );
  }
}
