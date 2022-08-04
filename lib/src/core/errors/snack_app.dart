import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';
import 'package:cartallum_app/src/core/shared/globals.dart';

class SnackApp {
  static void sucess(String message) {
    final SnackBar snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Cores.success,
        duration: const Duration(seconds: 5));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void error(String message) {
    final SnackBar snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Cores.danger,
        duration: const Duration(seconds: 5));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void info(String message) {
    final SnackBar snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Cores.info,
        duration: const Duration(seconds: 5));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  static void warning(String message) {
    final SnackBar snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Cores.warning,
        duration: const Duration(seconds: 5));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
