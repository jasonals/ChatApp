import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  final Widget? action;

  CommonAppBar({Key? key, this.action})
      : super(
            key: key,
            centerTitle: true,
            elevation: 0,
            actions: action != null ? [action] : null);
}
