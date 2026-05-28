import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/core/l10n/l10n.dart';
import 'package:mock_plant_care_app/data/model/plant_model.dart';
import 'package:mock_plant_care_app/presentation/pages/privacy_policy_page.dart';
import 'package:mock_plant_care_app/presentation/widgets/add/form_helpers.dart';

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

  group('form_helpers', () {
    test('validatePositiveInt returns null for valid input', () {
      expect(validatePositiveInt('5', _MockLoc()), isNull);
      expect(validatePositiveInt('1', _MockLoc()), isNull);
    });

    test('validatePositiveInt returns error for empty input', () {
      expect(validatePositiveInt('', _MockLoc()), isNotEmpty);
      expect(validatePositiveInt(null, _MockLoc()), isNotEmpty);
    });

    test('validatePositiveInt returns error for non-positive input', () {
      expect(validatePositiveInt('0', _MockLoc()), isNotEmpty);
      expect(validatePositiveInt('-1', _MockLoc()), isNotEmpty);
      expect(validatePositiveInt('abc', _MockLoc()), isNotEmpty);
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

class _MockLoc extends AppLocalizations {
  _MockLoc() : super('en');

  @override
  String get appTitle => 'Plant Care';

  @override
  String get appSubtitle => 'Your green dashboard';

  @override
  String get addNewPlant => 'Add New Plant';

  @override
  String get savePlant => 'Save Plant';

  @override
  String failedToSavePlant(String error) => 'Failed to save plant: $error';

  @override
  String get wellcome => 'Wellcome';

  @override
  String get plantDetails => 'Plant Details';

  @override
  String get plantNotFound => 'Plant not found';

  @override
  String get tabCareInfo => 'Care Info';

  @override
  String get tabSchedule => 'Schedule';

  @override
  String get removePlant => 'Remove Plant';

  @override
  String removePlantConfirm(String name) => 'Remove "$name"?';

  @override
  String get cancel => 'Cancel';

  @override
  String get remove => 'Remove';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get myPlants => 'My Plants';

  @override
  String get plantCare => 'PlantCare';

  @override
  String heroBannerUrgent(int count) => '$count plants need attention';

  @override
  String get heroBannerAllGood => 'All good';

  @override
  String get heroBannerHeading => 'Your Green Sanctuary';

  @override
  String urgentBannerTitle(int count) => '$count plants need care';

  @override
  String get urgentBannerSubtitle => 'Tap a plant card';

  @override
  String get statTotal => 'Total';

  @override
  String get statHealthy => 'Healthy';

  @override
  String get statWater => 'Water';

  @override
  String get statFeed => 'Feed';

  @override
  String get noPlantsYet => 'No Plants Yet';

  @override
  String get noPlantsDesc => 'Add your first plant';

  @override
  String get noPlantsHint => 'Tap Add Plant';

  @override
  String get addPlant => 'Add Plant';

  @override
  String get unknownSpecies => 'Unknown';

  @override
  String get healthThriving => 'Thriving';

  @override
  String get healthNeedsCare => 'Needs care';

  @override
  String get healthUrgent => 'Urgent';

  @override
  String get waterNow => 'Water Now';

  @override
  String get waterOk => 'Water ok';

  @override
  String get feedNow => 'Feed Now';

  @override
  String get feedOk => 'Food ok';

  @override
  String get sectionPlantIdentity => 'Plant Identity';

  @override
  String get labelPlantName => 'Plant Name';

  @override
  String get hintPlantName => 'Name';

  @override
  String get labelSpecies => 'Species';

  @override
  String get hintSpecies => 'Species';

  @override
  String get validatorEnterName => 'Enter a name';

  @override
  String get sectionCareSchedule => 'Care Schedule';

  @override
  String get labelWaterEvery => 'Water every';

  @override
  String get labelFeedEvery => 'Feed every';

  @override
  String get suffixDays => 'days';

  @override
  String get commonCareTips => 'Care Tips';

  @override
  String get tipWater => 'Water tips';

  @override
  String get tipFeed => 'Feed tips';

  @override
  String get validatorRequired => 'Required';

  @override
  String get validatorMustBePositive => 'Must be > 0';

  @override
  String get sectionReminders => 'Reminders';

  @override
  String get labelWateringReminder => 'Water Reminder';

  @override
  String get labelFeedingReminder => 'Feed Reminder';

  @override
  String get remindersDisabled => 'Reminders disabled';

  @override
  String get careCardWatering => 'Watering';

  @override
  String get careCardFeeding => 'Feeding';

  @override
  String get careCardWatered => 'Watered';

  @override
  String get careCardFed => 'Fed';

  @override
  String get careCardWaterNow => 'Water Now!';

  @override
  String get careCardFeedNow => 'Feed Now!';

  @override
  String lastWatered(String time) => 'Last watered $time';

  @override
  String lastFed(String time) => 'Last fed $time';

  @override
  String everyNDays(int n) => 'Every ${n}d';

  @override
  String get justNow => 'just now';

  @override
  String hoursAgo(int h) => '${h}h ago';

  @override
  String daysAgo(int d) => '${d}d ago';

  @override
  String get careTipsHeading => 'Care Tips';

  @override
  String get tipSunlight => 'Sunlight tip';

  @override
  String get tipTemperature => 'Temperature tip';

  @override
  String get tipPests => 'Pest tip';

  @override
  String tipWaterInterval(int n) => 'Water every $n days';

  @override
  String tipFeedInterval(int n) => 'Feed every $n days';

  @override
  String get scheduleCardIntervals => 'Intervals';

  @override
  String get scheduleCardReminders => 'Reminder Times';

  @override
  String get scheduleCardUpcoming => 'Upcoming';

  @override
  String get scheduleWatering => 'Watering';

  @override
  String get scheduleFeeding => 'Feeding';

  @override
  String get scheduleWaterReminder => 'Water Reminder';

  @override
  String get scheduleFeedReminder => 'Feed Reminder';

  @override
  String get scheduleNextWatering => 'Next watering';

  @override
  String get scheduleNextFeeding => 'Next feeding';

  @override
  String scheduleEveryNDays(int n) => 'Every $n days';

  @override
  String get overdue => 'Overdue';

  @override
  String get healthThriving2 => 'Thriving';

  @override
  String get healthNeedsCare2 => 'Needs Care';

  @override
  String get healthUrgent2 => 'Urgent';

  @override
  String get remindersOn => 'Reminders on';

  @override
  String get remindersOff => 'Off';

  @override
  String get actionWatered => 'Watered!';

  @override
  String get actionFed => 'Fed!';

  @override
  String snackWatered(String name) => '$name watered!';

  @override
  String snackFed(String name) => '$name fed!';

  @override
  String get pushReminders => 'Push Reminders';

  @override
  String get notificationsActive => 'Notifications active';

  @override
  String get tapToEnableNotifications => 'Tap to enable';

  @override
  String snackRemindersOn(String name) => 'Reminders ON for $name';

  @override
  String snackRemindersOff(String name) => 'Reminders OFF for $name';

  @override
  String get editCareSchedule => 'Edit Schedule';

  @override
  String get labelWateringInterval => 'Water Interval';

  @override
  String get labelFeedingInterval => 'Feed Interval';

  @override
  String get labelWateringTime => 'Water Time';

  @override
  String get labelFeedingTime => 'Feed Time';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get notifDialogTitle => 'Notifications';

  @override
  String get notifDialogBody => 'Enable notifications';

  @override
  String get allowNotifications => 'Allow';

  @override
  String get maybeLater => 'Later';

  @override
  String get pillWater => 'Water';

  @override
  String get pillFeed => 'Feed';

  @override
  String get pillLight => 'Light';

  @override
  String get onboardingWelcomeTitle => 'Welcome';

  @override
  String get onboardingWelcomeBody => 'Welcome body';

  @override
  String get onboardingInfoTitle1 => 'Info 1';

  @override
  String get onboardingInfoBody1 => 'Info body 1';

  @override
  String get onboardingInfoTitle2 => 'Info 2';

  @override
  String get onboardingInfoBody2 => 'Info body 2';

  @override
  String get onboardingStartBody => 'Start body';

  @override
  String get onboardingStartCta => 'Ready?';

  @override
  String notifWaterTitle(String name) => 'Water $name';

  @override
  String notifFeedTitle(String name) => 'Feed $name';

  @override
  String notifWaterBody(String name) => '$name needs water';

  @override
  String notifFeedBody(String name) => '$name needs food';

  @override
  String get notifActionMarkDone => 'Done';

  @override
  String get tourSettingsTitle => 'Settings';

  @override
  String get tourSettingsDesc => 'Settings desc';

  @override
  String get tourBannerTitle => 'Banner';

  @override
  String get tourBannerDesc => 'Banner desc';

  @override
  String get tourStatsTitle => 'Stats';

  @override
  String get tourStatsDesc => 'Stats desc';

  @override
  String get tourSectionTitle => 'Section';

  @override
  String get tourSectionDesc => 'Section desc';

  @override
  String get tourEmptyTitle => 'Empty';

  @override
  String get tourEmptyDesc => 'Empty desc';

  @override
  String get tourFabTitle => 'Fab';

  @override
  String get tourFabDesc => 'Fab desc';

  @override
  String get settings => 'Settings';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: May 2026';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsVersion => 'Version 1.0.0';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get privacySection1Title => '1. Information We Collect';

  @override
  String get privacySection1Body => 'Body text';

  @override
  String get privacySection2Title => '2. Notifications';

  @override
  String get privacySection2Body => 'Body text';

  @override
  String get privacySection3Title => '3. Data Storage';

  @override
  String get privacySection3Body => 'Body text';

  @override
  String get privacySection4Title => '4. Third-Party';

  @override
  String get privacySection4Body => 'Body text';

  @override
  String get privacySection5Title => "5. Children's Privacy";

  @override
  String get privacySection5Body => 'Body text';

  @override
  String get privacySection6Title => '6. Changes';

  @override
  String get privacySection6Body => 'Body text';

  @override
  String get privacySection7Title => '7. Contact';

  @override
  String get privacySection7Body => 'Body text';
}
