// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/data/services/notification_service.dart';
import 'package:plant_care_app/data/services/storage_service.dart';

class AddPlantViewModel extends ChangeNotifier {
  AddPlantViewModel(this._storageService, this._notificationService);

  final StorageService _storageService;
  final NotificationService _notificationService;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController speciesCtrl = TextEditingController();
  final TextEditingController waterDaysCtrl = TextEditingController(text: '2');
  final TextEditingController feedDaysCtrl = TextEditingController(text: '1');

  TimeOfDay waterTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay feedTime = const TimeOfDay(hour: 10, minute: 0);
  bool remindersEnabled = true;
  bool isSaving = false;

  bool waterUnitIsWeeks = false;
  bool feedUnitIsWeeks = true;

  void updateWaterTime(TimeOfDay time) {
    waterTime = time;
    notifyListeners();
  }

  void updateFeedTime(TimeOfDay time) {
    feedTime = time;
    notifyListeners();
  }

  void toggleReminders(bool value) {
    remindersEnabled = value;
    notifyListeners();
  }

  void setWaterUnit(bool isWeeks) {
    if (waterUnitIsWeeks == isWeeks) return;
    final int current = int.tryParse(waterDaysCtrl.text) ?? 0;
    if (isWeeks) {
      if (current > 0 && current % 7 == 0) {
        waterDaysCtrl.text = (current ~/ 7).toString();
      } else {
        waterDaysCtrl.text = '';
      }
    } else {
      waterDaysCtrl.text = (current * 7).toString();
    }
    waterUnitIsWeeks = isWeeks;
    notifyListeners();
  }

  void setFeedUnit(bool isWeeks) {
    if (feedUnitIsWeeks == isWeeks) return;
    final int current = int.tryParse(feedDaysCtrl.text) ?? 0;
    if (isWeeks) {
      if (current > 0 && current % 7 == 0) {
        feedDaysCtrl.text = (current ~/ 7).toString();
      } else {
        feedDaysCtrl.text = '';
      }
    } else {
      feedDaysCtrl.text = (current * 7).toString();
    }
    feedUnitIsWeeks = isWeeks;
    notifyListeners();
  }

  int _resolveInterval(String text, bool isWeeks) {
    final int value = int.tryParse(text) ?? 1;
    return isWeeks ? value * 7 : value;
  }

  Future<PlantModel> createPlant() async {
    return PlantModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: nameCtrl.text.trim(),
      species: speciesCtrl.text.trim().isEmpty ? null : speciesCtrl.text.trim(),
      waterIntervalDays: _resolveInterval(waterDaysCtrl.text, waterUnitIsWeeks),
      feedIntervalDays: _resolveInterval(feedDaysCtrl.text, feedUnitIsWeeks),
      waterReminderHour: waterTime.hour,
      waterReminderMinute: waterTime.minute,
      feedReminderHour: feedTime.hour,
      feedReminderMinute: feedTime.minute,
      remindersEnabled: remindersEnabled,
    );
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    speciesCtrl.dispose();
    waterDaysCtrl.dispose();
    feedDaysCtrl.dispose();
    super.dispose();
  }
}
