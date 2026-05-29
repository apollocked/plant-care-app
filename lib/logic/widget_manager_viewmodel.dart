import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/logic/language_viewmodel.dart';
import 'package:mock_plant_care_app/main.dart';
import 'package:mock_plant_care_app/presentation/widgets/home_screen_widget/plant_widget_canvas.dart';
import 'package:provider/provider.dart';

class WidgetManager {
  static const String _androidWidgetName = 'MyWidgetProvider';
  static const String _iosWidgetName = 'MyWidgetExtension';
  static const String _widgetKey = 'widget_image_path';

  static Future<void> updateHomeScreenWidget(List<PlantModel> plants) async {
    try {
      final context = navigatorKey.currentContext;
      if (context == null) return;

      final l10n = AppLocalizations.of(context);
      if (l10n == null) return;

      final locale = context.read<LanguageService>().locale;

      final int total = plants.length;
      final int needWater = plants.where((p) => p.needsWaterNow).length;
      final int needFood = plants.where((p) => p.needsFoodNow).length;
      final int happy =
          total - plants.where((p) => p.needsWaterNow || p.needsFoodNow).length;

      await HomeWidget.renderFlutterWidget(
        Theme(
          data: Theme.of(context),
          child: PlantWidgetCanvas(
            total: total,
            happy: happy,
            needWater: needWater,
            needFood: needFood,
            locale: locale,
            textMyPlants: l10n.myPlants,
            textTotal: l10n.statTotal,
            textHealthy: l10n.statHealthy,
            textWater: l10n.statWater,
            textFeed: l10n.statFeed,
          ),
        ),
        key: _widgetKey,
        logicalSize: const Size(360, 180),
        pixelRatio: 3.0,
      );

      await HomeWidget.updateWidget(
        androidName: _androidWidgetName,
        iOSName: _iosWidgetName,
      );
    } catch (e) {
      debugPrint('Failed to sync widget: $e');
    }
  }
}
