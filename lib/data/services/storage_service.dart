import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/data/services/notification_service.dart';
import 'package:plant_care_app/logic/widget_manager_viewmodel.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() => _instance;

  StorageService._internal();

  static const String plantsBoxName = 'plants_box';
  static const String settingsBoxName = 'settings_box';
  static const String themeKey = 'theme_mode';
  static const String firstTimeKey = 'isFirstTime';
  static const int _compactThreshold = 15;
  final NotificationService _notificationService = NotificationService();
  int _operationCount = 0;

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Map>(plantsBoxName);
    await Hive.openBox(settingsBoxName);
  }

  Box<Map> get _plantsBox => Hive.box<Map>(plantsBoxName);
  Box get _settingsBox => Hive.box(settingsBoxName);

  bool getIsFirstTime() {
    return _settingsBox.get('is_first_time', defaultValue: true);
  }

  Future<void> setNotFirstTime() async {
    await _settingsBox.put('is_first_time', false);
  }

  bool hasSeenHomeTour() {
    return _settingsBox.get('seen_home_tour', defaultValue: false);
  }

  void setSeenHomeTour() {
    _settingsBox.put('seen_home_tour', true);
  }

  List<PlantModel> getPlants() {
    return _plantsBox.values
        .map((Map raw) => PlantModel.fromMap(raw))
        .toList(growable: false);
  }

  Future<void> savePlant(PlantModel plant) async {
    await _plantsBox.put(plant.id, plant.toMap());
    _operationCount++;
    if (_operationCount >= _compactThreshold) {
      await _plantsBox.compact();
      _operationCount = 0;
    }
  }

  Future<void> deletePlant(String plantId) async {
    await _plantsBox.delete(plantId);
    _operationCount++;
    if (_operationCount >= _compactThreshold) {
      await _plantsBox.compact();
      _operationCount = 0;
    }
    await _notificationService.cancelPlantReminders(plantId);
    await WidgetManager.updateHomeScreenWidget(getPlants());
  }

  String? getThemeMode() => _settingsBox.get(themeKey) as String?;

  Future<void> saveThemeMode(String modeName) async {
    await _settingsBox.put(themeKey, modeName);
  }

  String? getLanguage() => _settingsBox.get('language_code') as String?;

  Future<void> saveLanguage(String languageCode) async {
    await _settingsBox.put('language_code', languageCode);
  }

  Future<void> setIsFirstTime(bool value) async {
    await _settingsBox.put(firstTimeKey, value);
  }
}
