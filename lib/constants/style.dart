import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Style {
  // Style for form
  static formStyle({
    IconData? icon,
  }) {
    return InputDecoration(
      icon: Icon(
        icon,
        color: Colors.greenAccent.shade200,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.greenAccent.shade200, width: 2)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.greenAccent.shade200, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.greenAccent.shade200, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.greenAccent.shade200, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.redAccent.shade200, width: 2)),
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
          color: Colors.green.shade200,
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
      prefixIcon: const Icon(
        Ionicons.search_outline,
        color: Colors.green,
      ),
      hintText: hintText,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    );
  }
}
