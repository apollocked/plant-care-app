import 'package:flutter/material.dart';

class StatCardData {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final String description;
  final List<String> details;

  const StatCardData({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
    required this.description,
    required this.details,
  });
}
