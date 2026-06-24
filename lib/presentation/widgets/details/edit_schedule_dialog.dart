import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';

class EditScheduleDialog extends StatefulWidget {
  const EditScheduleDialog({super.key, required this.plant, required this.vm});
  final PlantModel plant;
  final PlantViewModel vm;

  @override
  State<EditScheduleDialog> createState() => _EditScheduleDialogState();
}

class _EditScheduleDialogState extends State<EditScheduleDialog> {
  late TextEditingController _waterIntervalCtrl;
  late TextEditingController _feedIntervalCtrl;
  late TimeOfDay _waterTime;
  late TimeOfDay _feedTime;
  bool _waterInWeeks = false;
  bool _feedInWeeks = false;

  @override
  void initState() {
    super.initState();
    final int wDays = widget.plant.waterIntervalDays;
    final int fDays = widget.plant.feedIntervalDays;
    _waterInWeeks = wDays > 0 && wDays % 7 == 0;
    _feedInWeeks = fDays > 0 && fDays % 7 == 0;
    _waterIntervalCtrl = TextEditingController(
      text: _waterInWeeks ? (wDays ~/ 7).toString() : wDays.toString(),
    );
    _feedIntervalCtrl = TextEditingController(
      text: _feedInWeeks ? (fDays ~/ 7).toString() : fDays.toString(),
    );
    _waterTime = widget.plant.waterReminderTime;
    _feedTime = widget.plant.feedReminderTime;
  }

  Future<void> _save() async {
    final int rawWater =
        int.tryParse(_waterIntervalCtrl.text) ?? widget.plant.waterIntervalDays;
    final int rawFeed =
        int.tryParse(_feedIntervalCtrl.text) ?? widget.plant.feedIntervalDays;

    widget.plant.waterIntervalDays = _waterInWeeks ? rawWater * 7 : rawWater;
    widget.plant.feedIntervalDays = _feedInWeeks ? rawFeed * 7 : rawFeed;
    widget.plant.waterReminderTime = _waterTime;
    widget.plant.feedReminderTime = _feedTime;

    await widget.vm.updatePlant(widget.plant, context);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(loc.editCareSchedule),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIntervalField(loc.labelWateringInterval, _waterIntervalCtrl),
            _buildUnitToggle(_waterInWeeks, (v) => setState(() {
              if (_waterInWeeks == v) return;
              final int cur = int.tryParse(_waterIntervalCtrl.text) ?? 0;
              if (v) {
                _waterIntervalCtrl.text = (cur > 0 && cur % 7 == 0)
                    ? (cur ~/ 7).toString()
                    : '';
              } else {
                _waterIntervalCtrl.text = (cur * 7).toString();
              }
              _waterInWeeks = v;
            })),
            const SizedBox(height: 12),
            _buildIntervalField(loc.labelFeedingInterval, _feedIntervalCtrl),
            _buildUnitToggle(_feedInWeeks, (v) => setState(() {
              if (_feedInWeeks == v) return;
              final int cur = int.tryParse(_feedIntervalCtrl.text) ?? 0;
              if (v) {
                _feedIntervalCtrl.text = (cur > 0 && cur % 7 == 0)
                    ? (cur ~/ 7).toString()
                    : '';
              } else {
                _feedIntervalCtrl.text = (cur * 7).toString();
              }
              _feedInWeeks = v;
            })),
            const Divider(height: 32),
            _buildTimeTile(
              loc.labelWateringTime,
              _waterTime,
              (t) => setState(() => _waterTime = t),
            ),
            const SizedBox(height: 8),
            _buildTimeTile(
              loc.labelFeedingTime,
              _feedTime,
              (t) => setState(() => _feedTime = t),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        ElevatedButton(onPressed: _save, child: Text(loc.saveChanges)),
      ],
    );
  }

  Widget _buildIntervalField(String label, TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildUnitToggle(bool isWeeks, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _UnitChip(
            label: AppLocalizations.of(context)!.switchToDays,
            selected: !isWeeks,
            onTap: () => onChanged(false),
          ),
          const SizedBox(width: 8),
          _UnitChip(
            label: AppLocalizations.of(context)!.switchToWeeks,
            selected: isWeeks,
            onTap: () => onChanged(true),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTile(
    String label,
    TimeOfDay time,
    Function(TimeOfDay) onPick,
  ) {
    return ListTile(
      title: Text(label),
      subtitle: Text(time.format(context)),
      trailing: const Icon(Icons.access_time),
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: time,
        );
        if (picked != null) onPick(picked);
      },
    );
  }
}

class _UnitChip extends StatelessWidget {
  const _UnitChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primary.withValues(alpha: 0.4)),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: selected ? Colors.white : primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
