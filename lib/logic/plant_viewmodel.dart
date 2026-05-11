// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/data/services/notification_service.dart';
import 'package:mock_plant_care_app/data/services/storage_service.dart';

class PlantViewModel extends ChangeNotifier {
  PlantViewModel(this._storageService, this._notificationService);

  final StorageService _storageService;
  final NotificationService _notificationService;
  final List<PlantModel> _plants = <PlantModel>[];

  List<PlantModel> get plants => List<PlantModel>.unmodifiable(_plants);

  Future<void> loadPlants() async {
    _plants
      ..clear()
      ..addAll(_storageService.getPlants());
    notifyListeners();
  }

  PlantModel? getPlantById(String id) {
    try {
      return _plants.firstWhere((PlantModel p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addPlant(PlantModel plant, BuildContext context) async {
    _plants.add(plant);
    await _storageService.savePlant(plant);
    await _reschedulePlant(plant, context);
    notifyListeners();
  }

  Future<void> updatePlant(PlantModel plant, BuildContext context) async {
    final int index = _plants.indexWhere((PlantModel p) => p.id == plant.id);
    if (index == -1) {
      return;
    }
    _plants[index] = plant;
    await _storageService.savePlant(plant);
    await _reschedulePlant(plant, context);
    notifyListeners();
  }

  Future<void> deletePlant(String plantId) async {
    _plants.removeWhere((PlantModel p) => p.id == plantId);
    await _storageService.deletePlant(plantId);
    await _notificationService.cancelPlantReminders(plantId);
    notifyListeners();
  }

  Future<void> markPlantWatered(String plantId, BuildContext context) async {
    final PlantModel? plant = getPlantById(plantId);
    if (plant == null) {
      return;
    }
    plant.lastWateredAt = DateTime.now();
    await _storageService.savePlant(plant);
    await _reschedulePlant(plant, context);
    notifyListeners();
  }

  Future<void> markPlantFed(String plantId, BuildContext context) async {
    final PlantModel? plant = getPlantById(plantId);
    if (plant == null) {
      return;
    }
    plant.lastFedAt = DateTime.now();
    await _storageService.savePlant(plant);
    await _reschedulePlant(plant, context);
    notifyListeners();
  }

  Future<void> _reschedulePlant(PlantModel plant, BuildContext context) async {
    try {
      await _notificationService.cancelPlantReminders(plant.id);
      if (!plant.remindersEnabled) {
        return;
      }
      await _notificationService.scheduleDailyWaterReminder(plant, context);
      await _notificationService.scheduleDailyFeedReminder(plant, context);
    } catch (e) {
      debugPrint('Failed to reschedule plant reminders: $e');
    }
  }
}
