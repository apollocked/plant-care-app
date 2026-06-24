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
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
