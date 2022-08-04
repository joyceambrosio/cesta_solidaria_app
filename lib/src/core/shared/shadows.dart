import 'package:flutter/material.dart';

class Shadows {
  static BoxShadow muitoLeve() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 1), // changes position of shadow
    );
  }

  static BoxShadow leve() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 2,
      offset: const Offset(0, 2), // changes position of shadow
    );
  }

  static BoxShadow padrao() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }
}
