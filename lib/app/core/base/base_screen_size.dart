import 'dart:ui';

import 'package:flutter/material.dart';

class Screen{
  Size screenSize;

  Screen(this.screenSize);

  double wp(percentage) {
    return percentage / 100 * screenSize.width;
  }

  double hp(percentage) {
    return percentage / 100 * screenSize.height;
  }

  double hpWT(percentage) { ///height without toolbar
    return (percentage / 100 * screenSize.height)-kToolbarHeight;
  }
}