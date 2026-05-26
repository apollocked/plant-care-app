import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';

class PlantDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PlantDetailsAppBar({
    super.key,
    required this.plant,
    required this.vm,
    required this.isDark,
    required this.onSurface,
    required this.onDelete,
  });
  final PlantModel plant;
  final PlantViewModel vm;
  final bool isDark;
  final Color onSurface;
  final VoidCallback onDelete;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: onSurface),
      title: Text(
        plant.name,
        style: TextStyle(
          color: onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onDelete,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withValues(alpha: isDark ? 0.15 : 0.08),
            ),
            child: const Icon(
              Icons.delete_outline_rounded,
              size: 20,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
