import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/l10n/l10n.dart';
import 'package:plant_care_app/data/model/plant_model.dart';
import 'package:plant_care_app/presentation/pages/privacy_policy_page.dart';

void main() {
  group('PlantModel', () {
    test('creates a plant with expected defaults', () {
      final plant = PlantModel(
        id: '1',
        name: 'Monstera',
        waterIntervalDays: 3,
        feedIntervalDays: 7,
        waterReminderHour: 9,
        waterReminderMinute: 0,
        feedReminderHour: 10,
        feedReminderMinute: 0,
      );

      expect(plant.id, '1');
      expect(plant.name, 'Monstera');
      expect(plant.waterIntervalDays, 3);
      expect(plant.feedIntervalDays, 7);
      expect(plant.remindersEnabled, true);
      expect(plant.species, isNull);
      expect(plant.imagePath, isNull);
    });

    test('toMap and fromMap round-trip correctly', () {
      final plant = PlantModel(
        id: '42',
        name: 'Fiddle Leaf',
        species: 'Ficus lyrata',
        waterIntervalDays: 5,
        feedIntervalDays: 14,
        waterReminderHour: 8,
        waterReminderMinute: 30,
        feedReminderHour: 18,
        feedReminderMinute: 0,
        remindersEnabled: false,
      );

      final map = plant.toMap();
      final restored = PlantModel.fromMap(map);

      expect(restored.id, '42');
      expect(restored.name, 'Fiddle Leaf');
      expect(restored.species, 'Ficus lyrata');
      expect(restored.waterIntervalDays, 5);
      expect(restored.feedIntervalDays, 14);
      expect(restored.waterReminderHour, 8);
      expect(restored.waterReminderMinute, 30);
      expect(restored.feedReminderHour, 18);
      expect(restored.feedReminderMinute, 0);
      expect(restored.remindersEnabled, false);
    });

    test('fromMap defaults remindersEnabled to true', () {
      final map = <dynamic, dynamic>{
        'id': '1',
        'name': 'Test',
        'waterIntervalDays': 2,
        'feedIntervalDays': 7,
        'waterReminderHour': 9,
        'waterReminderMinute': 0,
        'feedReminderHour': 10,
        'feedReminderMinute': 0,
        'lastWateredAt': '2026-05-28T12:00:00.000',
        'lastFedAt': '2026-05-28T12:00:00.000',
      };
      final plant = PlantModel.fromMap(map);
      expect(plant.remindersEnabled, true);
    });

    test('needsWaterNow returns true when overdue', () {
      final plant = PlantModel(
        id: '1',
        name: 'Test',
        waterIntervalDays: 1,
        feedIntervalDays: 7,
        waterReminderHour: 9,
        waterReminderMinute: 0,
        feedReminderHour: 10,
        feedReminderMinute: 0,
        lastWateredAt: DateTime.now().subtract(const Duration(days: 2)),
      );

      expect(plant.needsWaterNow, isTrue);
    });

    test('needsWaterNow returns false when not overdue', () {
      final plant = PlantModel(
        id: '1',
        name: 'Test',
        waterIntervalDays: 3,
        feedIntervalDays: 7,
        waterReminderHour: 9,
        waterReminderMinute: 0,
        feedReminderHour: 10,
        feedReminderMinute: 0,
        lastWateredAt: DateTime.now(),
      );

      expect(plant.needsWaterNow, isFalse);
    });

    test('waterReminderTime getter/setter works', () {
      final plant = PlantModel(
        id: '1',
        name: 'Test',
        waterIntervalDays: 2,
        feedIntervalDays: 7,
        waterReminderHour: 9,
        waterReminderMinute: 0,
        feedReminderHour: 10,
        feedReminderMinute: 0,
      );

      expect(plant.waterReminderHour, 9);
      expect(plant.waterReminderMinute, 0);

      plant.waterReminderTime = const TimeOfDay(hour: 14, minute: 30);
      expect(plant.waterReminderHour, 14);
      expect(plant.waterReminderMinute, 30);
    });
  });

  group('L10n', () {
    test('getNativeName returns English for en', () {
      expect(L10n.getNativeName('en'), 'English');
    });

    test('getNativeName returns Arabic for ar', () {
      expect(L10n.getNativeName('ar'), 'العربية');
    });

    test('getNativeName returns Kurdish for ku', () {
      expect(L10n.getNativeName('ku'), 'کوردی');
    });

    test('getNativeName returns English for unknown code', () {
      expect(L10n.getNativeName('fr'), 'English');
    });

    test('all contains supported locales', () {
      expect(L10n.all, hasLength(3));
      expect(L10n.all, contains(const Locale('en')));
      expect(L10n.all, contains(const Locale('ar')));
      expect(L10n.all, contains(const Locale('ku')));
    });
  });

  group('PrivacyPolicyPage', () {
    testWidgets('renders privacy policy title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const PrivacyPolicyPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Privacy Policy'), findsWidgets);
    });

    testWidgets('renders last updated text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const PrivacyPolicyPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Last updated'), findsWidgets);
    });

    testWidgets('renders all section headings', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const PrivacyPolicyPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Information We Collect'), findsOneWidget);
      expect(find.text('2. Notifications'), findsOneWidget);
      expect(find.textContaining('Data Storage'), findsOneWidget);
      expect(find.textContaining('Third-Party'), findsOneWidget);
      expect(find.textContaining("Children's Privacy"), findsOneWidget);
      expect(find.textContaining('Changes to This Policy'), findsOneWidget);
      expect(find.textContaining('Contact'), findsOneWidget);
    });
  });
}
