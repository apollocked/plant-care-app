import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onSurface,
  });
  final String icon;
  final String text;
  final Color onSurface;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 10)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: onSurface.withValues(alpha: 0.7),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
