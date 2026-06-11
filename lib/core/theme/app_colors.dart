import 'package:flutter/material.dart';

abstract final class AppColors {
  // ── Theme Core ──
  static const Color primaryGreen = Color(0xFF2E7D52);
  static const Color primaryGreenDark = Color(0xFF4CAF82);

  static const Color lightBg = Color(0xFFEBF0EC);
  static const Color lightSurface = Color(0xFFF7FAF8);
  static const Color lightText = Color(0xFF1A2E25);
  static const Color lightSubtext = Color(0xFF4A6355);

  static const Color darkBg = Color(0xFF0B1A16);
  static const Color darkSurface = Color(0xFF132218);

  // ── Semantic ──
  static const Color success = Color(0xFF4CAF50);    // healthy / ok state
  static const Color warning = Color(0xFFFF9800);    // needs attention
  static const Color error = Color(0xFFF44336);      // danger / overdue / delete
  static const Color water = Color(0xFF2196F3);      // water-related

  // ── Health ──
  static const Color healthHigh = Color(0xFF4CAF50);
  static const Color healthMid = Color(0xFFFF9800);
  static const Color healthLow = Color(0xFFF44336);

  // ── Action Button Gradients ──
  static const Color actionWaterStart = Color(0xFF42A5F5);   // blue.shade400
  static const Color actionWaterEnd = Color(0xFF1976D2);     // blue.shade700
  static const Color actionFeedStart = Color(0xFF66BB6A);    // green.shade500
  static const Color actionFeedEnd = Color(0xFF00897B);      // teal.shade600

  // ── Form & Reminder Icons ──
  static const Color formWaterIcon = Color(0xFF42A5F5);     // blue.shade400
  static const Color formFeedIcon = Color(0xFF43A047);      // green.shade600
  static const Color reminderFeed = Color(0xFF66BB6A);      // green.shade500

  // ── Feature Pills ──
  static const Color pillWater = Color(0xFF2196F3);
  static const Color pillFeed = Color(0xFF4CAF50);
  static const Color pillLight = Color(0xFFFF9800);

  // ── Widget Creation ──
  static const Color widgetSuccess = Color(0xFF66BB6A);   // green.shade400
  static const Color widgetFailure = Color(0xFFEF5350);   // red.shade400

  // ── Gradient Accent ──
  static const Color tealAccent = Color(0xFF009688);     // Colors.teal

  // ── Widget / Component Specific ──
  static const Color darkBottomBar = Color(0xFF0E1C1D);
  static const Color emptyStateText = Color(0xFF14312C);
  static const Color tooltipBg = Color(0xFF1B4332);
  static const Color tooltipBgDark = Color(0xFF0D2B1F);
  static const Color overlay = Color(0xFF000000);

  // ── SnackBar ──
  static const Color snackbarBg = Color(0xFF1A2E25);
  static const Color snackbarText = Colors.white;
  static const Color snackbarAction = Color(0xFF4CAF82);
}
