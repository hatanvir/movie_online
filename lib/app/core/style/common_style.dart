import 'package:flutter/material.dart';
import 'package:movie_online/app/core/values/app_colors.dart';

class CommonStyle {

  ///text field style date picker
  static InputDecoration textFieldStyleSearch({
    String labelTextStr = "",
    String hintTextStr = "",
    double verPadding = 0.0,
    double horPadding = 0.0,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        hintText: hintTextStr,
        hintStyle: const TextStyle(
          color: AppColor.grey
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: verPadding, horizontal: horPadding),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppColor.whitGrey)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColor.whitGrey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColor.whitGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        prefixIcon: const Icon(Icons.search,color: AppColor.whitGrey,));
  }
}
