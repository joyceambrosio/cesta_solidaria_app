import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormDropDownField<T> extends StatelessWidget {
  final String name;
  final String labelText;
  final String hintText;
  final String errorText;
  final bool isValid;
  final Function onChangeAction;
  final T? initialValue;
  final bool? enabled;
  final List<DropdownMenuItem<T>> lista;

  const FormDropDownField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    required this.isValid,
    required this.onChangeAction,
    this.initialValue,
    this.enabled,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(8),
      child: FormBuilderDropdown<T>(
        initialValue: initialValue,
        name: name,
        items: lista,
        onChanged: (value) => {
          onChangeAction(value),
        },
        isExpanded: true,
        enabled: enabled ?? true,
        style: const TextStyle(
          fontSize: 14,
          color: Cores.dark,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          focusColor: Cores.primary,
          errorText: errorText == "" ? "" : errorText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Cores.dark,
          ),
          hintText: hintText,
          fillColor: Cores.inputBackgroundColor,
          filled: true,
          suffixIcon: isValid
              ? null
              : const Icon(
                  Icons.error_outline,
                  color: Cores.danger,
                ),
          border: isValid
              ? const OutlineInputBorder(
                  borderRadius: borderRadiosAll,
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                )
              : const OutlineInputBorder(
                  borderRadius: borderRadiosAll,
                  borderSide: BorderSide(width: 0, style: BorderStyle.solid),
                ),
        ),
      ),
    );
  }
}
