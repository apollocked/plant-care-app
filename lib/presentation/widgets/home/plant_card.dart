import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'package:plant_care_app/presentation/widgets/details/delete_plant_dialog.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'package:plant_care_app/presentation/widgets/home/plant_card_components.dart';
import 'package:provider/provider.dart';

class PlantCard extends StatefulWidget {
  const PlantCard({
    super.key,
    required this.plant,
    required this.onTap,
    required this.onWaterTap,
    required this.onFeedTap,
  });

  final PlantModel plant;
  final VoidCallback onTap;
  final VoidCallback onWaterTap;
  final VoidCallback onFeedTap;

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.97,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _healthScore() {
    if (!widget.plant.needsWaterNow && !widget.plant.needsFoodNow) return 1.0;
    if (widget.plant.needsWaterNow && widget.plant.needsFoodNow) return 0.2;
    return 0.6;
  }

  Color _healthColor() {
    final double s = _healthScore();
    if (s >= 0.9) return Colors.green;
    if (s >= 0.5) return Colors.orange;
    return Colors.red;
  }

  String _healthLabel(AppLocalizations loc) {
    final double s = _healthScore();
    if (s >= 0.9) return loc.healthThriving;
    if (s >= 0.5) return loc.healthNeedsCare;
    return loc.healthUrgent;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final viewModel = context.read<PlantViewModel>();
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) =>
          Transform.scale(scale: _controller.value, child: child),
      child: GlassContainer(
        borderRadius: 20,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),

          onLongPress: () => _controller.reverse(),

          onLongPressUp: () {
            _controller.forward();
            showDialog(
              context: context,
              builder: (_) =>
                  DeletePlantDialog(plant: widget.plant, vm: viewModel),
            );
          },
          onTap: widget.onTap,
          onTapDown: (_) => _controller.reverse(),
          onTapUp: (_) => _controller.forward(),
          onTapCancel: () => _controller.forward(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardHeader(
                  plant: widget.plant,
                  healthScore: _healthScore(),
                  healthColor: _healthColor(),
                  healthLabel: _healthLabel(loc),
                  onSurface: scheme.onSurface,
                ),
                const SizedBox(height: 14),
                CardActions(
                  plant: widget.plant,
                  scheme: scheme,
                  onWaterTap: widget.onWaterTap,
                  onFeedTap: widget.onFeedTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
