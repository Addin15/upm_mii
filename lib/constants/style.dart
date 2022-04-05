import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';

class Style {
  // Style for form
  static formStyle({
    IconData? icon,
    String? hintText,
  }) {
    return InputDecoration(
      filled: true,
      isDense: true,
      fillColor: const Color(0xff00AAE0),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      icon: Icon(
        icon,
        color: const Color(0xff00AAE0),
      ),
      border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      disabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    );
  }

  // Style for button
  static buttonStyle({
    Color? color,
  }) {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
