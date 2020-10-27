import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  final Widget title;
  final Widget action;

  CommonAppBar({this.title, this.action})
      : super(
            centerTitle: true,
            elevation: 0,
            actions: action != null ? [action] : null);
}
