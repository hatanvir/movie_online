import 'dart:ffi';

import 'package:flutter/cupertino.dart';

extension SpaceExtension on int{
  get height => SizedBox(height: toDouble());
  get width => SizedBox(width: toDouble());
}