import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';

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

  @override
  void initState() {
    super.initState();
    _waterIntervalCtrl = TextEditingController(
      text: widget.plant.waterIntervalDays.toString(),
    );
    _feedIntervalCtrl = TextEditingController(
      text: widget.plant.feedIntervalDays.toString(),
    );
    _waterTime = widget.plant.waterReminderTime;
    _feedTime = widget.plant.feedReminderTime;
  }

  Future<void> _save() async {
    final int waterInterval =
        int.tryParse(_waterIntervalCtrl.text) ?? widget.plant.waterIntervalDays;
    final int feedInterval =
        int.tryParse(_feedIntervalCtrl.text) ?? widget.plant.feedIntervalDays;

    widget.plant.waterIntervalDays = waterInterval;
    widget.plant.feedIntervalDays = feedInterval;
    widget.plant.waterReminderTime = _waterTime;
    widget.plant.feedReminderTime = _feedTime;

    await widget.vm.updatePlant(widget.plant);
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
            const SizedBox(height: 12),
            _buildIntervalField(loc.labelFeedingInterval, _feedIntervalCtrl),
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
        ElevatedButton(
          onPressed: _save,
          child: Text(loc.saveChanges),
        ),
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
