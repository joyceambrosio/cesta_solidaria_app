import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';

class FormTextIconField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final bool isValid;
  final Function validateAction;
  final bool? obscure;
  final TextInputType fieldType;
  final bool? enabled;
  final IconData icon;
  final VoidCallback iconAction;
  final Widget? popupMenuButton;
  final bool? readOnly;

  const FormTextIconField(
      {Key? key,
      this.controller,
      required this.labelText,
      required this.hintText,
      required this.errorText,
      required this.isValid,
      required this.validateAction,
      this.obscure,
      required this.fieldType,
      this.enabled,
      required this.icon,
      required this.iconAction,
      this.popupMenuButton,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              readOnly: readOnly ?? false,
              controller: controller,
              enabled: enabled ?? true,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 14,
                color: Cores.dark,
              ),
              obscureText: obscure ?? false,
              onChanged: (value) => {
                validateAction(value),
              },
              decoration: InputDecoration(
                labelText: labelText,
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                focusColor: Cores.primary,
                errorText: errorText == "" ? "" : errorText,
                hintText: hintText,
                fillColor: Cores.inputBackgroundColor,
                filled: true,
                suffixIcon: InkWell(
                  onTap: iconAction,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Icon(
                    icon,
                    color: isValid ? Cores.dark : Cores.danger,
                  ),
                ),
                border: isValid
                    ? const OutlineInputBorder(
                        borderRadius: borderRadiosAll,
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      )
                    : const OutlineInputBorder(
                        borderRadius: borderRadiosAll,
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.solid),
                      ),
              ),
              cursorColor: Cores.textColor,
              keyboardType: fieldType,
            ),
          ),
          popupMenuButton ?? const SizedBox(),
        ],
      ),
    );
  }
}
