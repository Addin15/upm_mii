import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';

class Style {
  // Style for form
  static formStyle({
    IconData? icon,
  }) {
    return InputDecoration(
      icon: icon == null
          ? const SizedBox.shrink()
          : Icon(
              icon,
              color: AppColor.primary,
            ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primary, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primary, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primary, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primary, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColor.primary, width: 2)),
    );
  }

  // Style for button
  static buttonStyle({
    Color? color,
  }) {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: AppColor.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      backgroundColor: color,
    );
  }

  // Style for search bar
  static searchStyle({
    String? hintText,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0),
      prefixIcon: const Icon(
        Ionicons.search_outline,
        color: Color(0xff243E82),
      ),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xff243E82)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xff243E82)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xff243E82)),
      ),
    );
  }
}
