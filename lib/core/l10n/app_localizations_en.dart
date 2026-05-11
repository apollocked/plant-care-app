// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Plant Care';

  @override
  String get appSubtitle => 'Your green dashboard';

  @override
  String get addNewPlant => 'Add New Plant';

  @override
  String get savePlant => 'Save Plant';

  @override
  String failedToSavePlant(String error) {
    return 'Failed to save plant: $error';
  }

  @override
  String get plantDetails => 'Plant Details';

  @override
  String get plantNotFound => 'Plant not found';

  @override
  String get tabCareInfo => '🌿 Care Info';

  @override
  String get tabSchedule => '📋 Schedule';

  @override
  String get removePlant => 'Remove Plant';

  @override
  String removePlantConfirm(String name) {
    return 'Remove \"$name\" from your garden?';
  }

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
  String heroBannerUrgent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plants need',
      one: 'plant needs',
    );
    return '🔔 $count $_temp0 attention';
  }

  @override
  String get heroBannerAllGood => '✅ All plants are happy';

  @override
  String get heroBannerHeading => 'Your Green\nSanctuary 🌿';

  @override
  String urgentBannerTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plants',
      one: 'plant',
    );
    return '$count $_temp0 need care';
  }

  @override
  String get urgentBannerSubtitle => 'Tap a plant card to take action';

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
  String get noPlantsDesc =>
      'Add your first plant and start tracking its care schedule with daily reminders.';

  @override
  String get noPlantsHint => '🌱 Tap \"Add Plant\" to get started';

  @override
  String get addPlant => 'Add Plant';

  @override
  String get unknownSpecies => 'Unknown species';

  @override
  String get healthThriving => 'Thriving';

  @override
  String get healthNeedsCare => 'Needs care';

  @override
  String get healthUrgent => 'Urgent!';

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
  String get hintPlantName => 'e.g. My Fiddle Leaf';

  @override
  String get labelSpecies => 'Species (Optional)';

  @override
  String get hintSpecies => 'e.g. Monstera Deliciosa';

  @override
  String get validatorEnterName => 'Please enter a name';

  @override
  String get sectionCareSchedule => 'Care Schedule';

  @override
  String get labelWaterEvery => 'Water every';

  @override
  String get labelFeedEvery => 'Feed every';

  @override
  String get suffixDays => 'days';

  @override
  String get commonCareTips => 'Common Care Tips';

  @override
  String get tipWater => 'Water: 2-3 days for succulents, 5-7 for tropicals.';

  @override
  String get tipFeed =>
      'Feed: 7-14 days during growing season, rare in winter.';

  @override
  String get validatorRequired => 'Required';

  @override
  String get validatorMustBePositive => 'Must be > 0';

  @override
  String get sectionReminders => 'Reminders';

  @override
  String get labelWateringReminder => 'Watering Reminder';

  @override
  String get labelFeedingReminder => 'Feeding Reminder';

  @override
  String get remindersDisabled => 'Reminders are disabled for this plant.';

  @override
  String get careCardWatering => 'Watering';

  @override
  String get careCardFeeding => 'Feeding';

  @override
  String get careCardWatered => 'Watered ✓';

  @override
  String get careCardFed => 'Fed ✓';

  @override
  String get careCardWaterNow => 'Water Now!';

  @override
  String get careCardFeedNow => 'Feed Now!';

  @override
  String lastWatered(String time) {
    return 'Last watered $time';
  }

  @override
  String lastFed(String time) {
    return 'Last fed $time';
  }

  @override
  String everyNDays(int n) {
    return 'Every ${n}d';
  }

  @override
  String get justNow => 'just now';

  @override
  String hoursAgo(int h) {
    return '${h}h ago';
  }

  @override
  String daysAgo(int d) {
    return '${d}d ago';
  }

  @override
  String get careTipsHeading => '💡 Care Tips';

  @override
  String get tipSunlight => 'Ensure adequate indirect sunlight every day.';

  @override
  String get tipTemperature =>
      'Keep temperature stable — avoid cold drafts and direct heat.';

  @override
  String get tipPests =>
      'Check for pests regularly and wipe leaves for better photosynthesis.';

  @override
  String tipWaterInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return 'Water every $n $_temp0 for best results.';
  }

  @override
  String tipFeedInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return 'Feed every $n $_temp0 to keep it growing strong.';
  }

  @override
  String get scheduleCardIntervals => '🔁 Care Intervals';

  @override
  String get scheduleCardReminders => '⏰ Reminder Times';

  @override
  String get scheduleCardUpcoming => '📅 Upcoming Dates';

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
  String scheduleEveryNDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return 'Every $n $_temp0';
  }

  @override
  String get overdue => 'Overdue!';

  @override
  String get healthThriving2 => 'Thriving 🌟';

  @override
  String get healthNeedsCare2 => 'Needs Care';

  @override
  String get healthUrgent2 => 'Urgent! 🚨';

  @override
  String get remindersOn => '🔔 Reminders on';

  @override
  String get remindersOff => '🔕 Off';

  @override
  String get actionWatered => 'Watered!';

  @override
  String get actionFed => 'Fed!';

  @override
  String snackWatered(String name) {
    return '💧 $name has been watered!';
  }

  @override
  String snackFed(String name) {
    return '🌿 $name has been fed!';
  }

  @override
  String get pushReminders => 'Push Reminders';

  @override
  String get notificationsActive => 'Daily notifications are active';

  @override
  String get tapToEnableNotifications => 'Tap to enable notifications';

  @override
  String snackRemindersOn(String name) {
    return '🔔 Reminders turned ON for $name';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 Reminders turned OFF for $name';
  }

  @override
  String get editCareSchedule => 'Edit Care Schedule';

  @override
  String get labelWateringInterval => 'Watering Interval (Days)';

  @override
  String get labelFeedingInterval => 'Feeding Interval (Days)';

  @override
  String get labelWateringTime => 'Watering Time';

  @override
  String get labelFeedingTime => 'Feeding Time';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get notifDialogTitle => 'Stay on top of\nyour plant care! 🌿';

  @override
  String get notifDialogBody =>
      'Enable notifications so we can remind you when your plants need watering or fertilizing.';

  @override
  String get allowNotifications => 'Allow Notifications';

  @override
  String get maybeLater => 'Maybe Later';

  @override
  String get pillWater => 'Water';

  @override
  String get pillFeed => 'Feed';

  @override
  String get pillLight => 'Light';

  @override
  String get onboardingWelcomeTitle => 'Grow Your\nUrban Jungle';

  @override
  String get onboardingWelcomeBody =>
      'A modern approach to keeping your plants alive and thriving.';

  @override
  String get onboardingInfoTitle1 => 'Never Miss a Drop';

  @override
  String get onboardingInfoBody1 =>
      'Set custom reminders for watering, fertilizing, and repotting. Your plants will thank you.';

  @override
  String get onboardingInfoTitle2 => 'Data Privacy';

  @override
  String get onboardingInfoBody2 =>
      'Your data stays on your device.\nHigh performance tracking allows you to get the most out of your plant.';

  @override
  String get onboardingStartBody =>
      'Enjoy the benefits of a modern approach to keeping your plants alive and thriving with Plant Care.';

  @override
  String get onboardingStartCta => 'Ready to start your journey?';

  @override
  String notifWaterTitle(String name) {
    return 'Water $name';
  }

  @override
  String notifFeedTitle(String name) {
    return 'Feed $name';
  }

  @override
  String notifWaterBody(String name) {
    return '$name needs water now.';
  }

  @override
  String notifFeedBody(String name) {
    return '$name is ready for plant food.';
  }

  @override
  String get notifActionMarkDone => 'Mark Done';
}
