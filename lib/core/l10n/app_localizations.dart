import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ku.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ku'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Plant Care'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your green dashboard'**
  String get appSubtitle;

  /// No description provided for @addNewPlant.
  ///
  /// In en, this message translates to:
  /// **'Add New Plant'**
  String get addNewPlant;

  /// No description provided for @savePlant.
  ///
  /// In en, this message translates to:
  /// **'Save Plant'**
  String get savePlant;

  /// No description provided for @failedToSavePlant.
  ///
  /// In en, this message translates to:
  /// **'Failed to save plant: {error}'**
  String failedToSavePlant(String error);

  /// No description provided for @wellcome.
  ///
  /// In en, this message translates to:
  /// **'Wellcome'**
  String get wellcome;

  /// No description provided for @plantDetails.
  ///
  /// In en, this message translates to:
  /// **'Plant Details'**
  String get plantDetails;

  /// No description provided for @plantNotFound.
  ///
  /// In en, this message translates to:
  /// **'Plant not found'**
  String get plantNotFound;

  /// No description provided for @tabCareInfo.
  ///
  /// In en, this message translates to:
  /// **'🌿 Care Info'**
  String get tabCareInfo;

  /// No description provided for @tabSchedule.
  ///
  /// In en, this message translates to:
  /// **'📋 Schedule'**
  String get tabSchedule;

  /// No description provided for @removePlant.
  ///
  /// In en, this message translates to:
  /// **'Remove Plant'**
  String get removePlant;

  /// No description provided for @removePlantConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your garden?'**
  String removePlantConfirm(String name);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @myPlants.
  ///
  /// In en, this message translates to:
  /// **'My Plants'**
  String get myPlants;

  /// No description provided for @plantCare.
  ///
  /// In en, this message translates to:
  /// **'PlantCare'**
  String get plantCare;

  /// No description provided for @heroBannerUrgent.
  ///
  /// In en, this message translates to:
  /// **'🔔 {count} {count, plural, one{plant needs} other{plants need}} attention'**
  String heroBannerUrgent(int count);

  /// No description provided for @heroBannerAllGood.
  ///
  /// In en, this message translates to:
  /// **'✅ All plants are happy'**
  String get heroBannerAllGood;

  /// No description provided for @heroBannerHeading.
  ///
  /// In en, this message translates to:
  /// **'Your Green\nSanctuary 🌿'**
  String get heroBannerHeading;

  /// No description provided for @urgentBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, one{plant} other{plants}} need care'**
  String urgentBannerTitle(int count);

  /// No description provided for @urgentBannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap a plant card to take action'**
  String get urgentBannerSubtitle;

  /// No description provided for @statTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statTotal;

  /// No description provided for @statHealthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get statHealthy;

  /// No description provided for @statWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get statWater;

  /// No description provided for @statFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get statFeed;

  /// No description provided for @statTotalDesc.
  ///
  /// In en, this message translates to:
  /// **'Your plant collection'**
  String get statTotalDesc;

  /// No description provided for @statTotalDetailHealthy.
  ///
  /// In en, this message translates to:
  /// **'{count} healthy plants'**
  String statTotalDetailHealthy(int count);

  /// No description provided for @statTotalDetailWater.
  ///
  /// In en, this message translates to:
  /// **'{count} need water'**
  String statTotalDetailWater(int count);

  /// No description provided for @statTotalDetailFood.
  ///
  /// In en, this message translates to:
  /// **'{count} need food'**
  String statTotalDetailFood(int count);

  /// No description provided for @statHealthyDesc.
  ///
  /// In en, this message translates to:
  /// **'{p}% of your plants are thriving'**
  String statHealthyDesc(String p);

  /// No description provided for @statHealthyDetail.
  ///
  /// In en, this message translates to:
  /// **'Great job! Keep up the care!'**
  String get statHealthyDetail;

  /// No description provided for @statWaterDesc.
  ///
  /// In en, this message translates to:
  /// **'{p}% of plants need water'**
  String statWaterDesc(String p);

  /// No description provided for @statWaterDetailTap.
  ///
  /// In en, this message translates to:
  /// **'Tap on plants to water them'**
  String get statWaterDetailTap;

  /// No description provided for @statWaterDetailConsider.
  ///
  /// In en, this message translates to:
  /// **'Consider watering now'**
  String get statWaterDetailConsider;

  /// No description provided for @statFeedDesc.
  ///
  /// In en, this message translates to:
  /// **'{p}% of plants need fertilizer'**
  String statFeedDesc(String p);

  /// No description provided for @statFeedDetailWeakened.
  ///
  /// In en, this message translates to:
  /// **'Feed plants that are weakened'**
  String get statFeedDetailWeakened;

  /// No description provided for @statFeedDetailFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow feeding instructions per plant'**
  String get statFeedDetailFollow;

  /// No description provided for @noPlantsYet.
  ///
  /// In en, this message translates to:
  /// **'No Plants Yet'**
  String get noPlantsYet;

  /// No description provided for @noPlantsDesc.
  ///
  /// In en, this message translates to:
  /// **'Add your first plant and start tracking its care schedule with daily reminders.'**
  String get noPlantsDesc;

  /// No description provided for @noPlantsHint.
  ///
  /// In en, this message translates to:
  /// **'🌱 Tap \"Add Plant\" to get started'**
  String get noPlantsHint;

  /// No description provided for @addPlant.
  ///
  /// In en, this message translates to:
  /// **'Add Plant'**
  String get addPlant;

  /// No description provided for @unknownSpecies.
  ///
  /// In en, this message translates to:
  /// **'Unknown species'**
  String get unknownSpecies;

  /// No description provided for @healthThriving.
  ///
  /// In en, this message translates to:
  /// **'Thriving'**
  String get healthThriving;

  /// No description provided for @healthNeedsCare.
  ///
  /// In en, this message translates to:
  /// **'Needs care'**
  String get healthNeedsCare;

  /// No description provided for @healthUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent!'**
  String get healthUrgent;

  /// No description provided for @waterNow.
  ///
  /// In en, this message translates to:
  /// **'Water Now'**
  String get waterNow;

  /// No description provided for @waterOk.
  ///
  /// In en, this message translates to:
  /// **'Water ok'**
  String get waterOk;

  /// No description provided for @feedNow.
  ///
  /// In en, this message translates to:
  /// **'Feed Now'**
  String get feedNow;

  /// No description provided for @feedOk.
  ///
  /// In en, this message translates to:
  /// **'Food ok'**
  String get feedOk;

  /// No description provided for @sectionPlantIdentity.
  ///
  /// In en, this message translates to:
  /// **'Plant Identity'**
  String get sectionPlantIdentity;

  /// No description provided for @labelPlantName.
  ///
  /// In en, this message translates to:
  /// **'Plant Name'**
  String get labelPlantName;

  /// No description provided for @hintPlantName.
  ///
  /// In en, this message translates to:
  /// **'e.g. My Fiddle Leaf'**
  String get hintPlantName;

  /// No description provided for @labelSpecies.
  ///
  /// In en, this message translates to:
  /// **'Species (Optional)'**
  String get labelSpecies;

  /// No description provided for @hintSpecies.
  ///
  /// In en, this message translates to:
  /// **'e.g. Monstera Deliciosa'**
  String get hintSpecies;

  /// No description provided for @validatorEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get validatorEnterName;

  /// No description provided for @sectionCareSchedule.
  ///
  /// In en, this message translates to:
  /// **'Care Schedule'**
  String get sectionCareSchedule;

  /// No description provided for @labelWaterEvery.
  ///
  /// In en, this message translates to:
  /// **'Water every'**
  String get labelWaterEvery;

  /// No description provided for @labelFeedEvery.
  ///
  /// In en, this message translates to:
  /// **'Feed every'**
  String get labelFeedEvery;

  /// No description provided for @suffixDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get suffixDays;

  /// No description provided for @commonCareTips.
  ///
  /// In en, this message translates to:
  /// **'Common Care Tips'**
  String get commonCareTips;

  /// No description provided for @tipWater.
  ///
  /// In en, this message translates to:
  /// **'Water: 2-3 days for succulents, 5-7 for tropicals.'**
  String get tipWater;

  /// No description provided for @tipFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed: 7-14 days during growing season, rare in winter.'**
  String get tipFeed;

  /// No description provided for @validatorRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get validatorRequired;

  /// No description provided for @validatorMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Must be > 0'**
  String get validatorMustBePositive;

  /// No description provided for @sectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get sectionReminders;

  /// No description provided for @labelWateringReminder.
  ///
  /// In en, this message translates to:
  /// **'Watering Reminder'**
  String get labelWateringReminder;

  /// No description provided for @labelFeedingReminder.
  ///
  /// In en, this message translates to:
  /// **'Feeding Reminder'**
  String get labelFeedingReminder;

  /// No description provided for @remindersDisabled.
  ///
  /// In en, this message translates to:
  /// **'Reminders are disabled for this plant.'**
  String get remindersDisabled;

  /// No description provided for @careCardWatering.
  ///
  /// In en, this message translates to:
  /// **'Watering'**
  String get careCardWatering;

  /// No description provided for @careCardFeeding.
  ///
  /// In en, this message translates to:
  /// **'Feeding'**
  String get careCardFeeding;

  /// No description provided for @careCardWatered.
  ///
  /// In en, this message translates to:
  /// **'Watered ✓'**
  String get careCardWatered;

  /// No description provided for @careCardFed.
  ///
  /// In en, this message translates to:
  /// **'Fed ✓'**
  String get careCardFed;

  /// No description provided for @careCardWaterNow.
  ///
  /// In en, this message translates to:
  /// **'Water Now!'**
  String get careCardWaterNow;

  /// No description provided for @careCardFeedNow.
  ///
  /// In en, this message translates to:
  /// **'Feed Now!'**
  String get careCardFeedNow;

  /// No description provided for @lastWatered.
  ///
  /// In en, this message translates to:
  /// **'Last watered {time}'**
  String lastWatered(String time);

  /// No description provided for @lastFed.
  ///
  /// In en, this message translates to:
  /// **'Last fed {time}'**
  String lastFed(String time);

  /// No description provided for @everyNDays.
  ///
  /// In en, this message translates to:
  /// **'Every {n}d'**
  String everyNDays(int n);

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get justNow;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{h}h ago'**
  String hoursAgo(int h);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{d}d ago'**
  String daysAgo(int d);

  /// No description provided for @careTipsHeading.
  ///
  /// In en, this message translates to:
  /// **'💡 Care Tips'**
  String get careTipsHeading;

  /// No description provided for @tipSunlight.
  ///
  /// In en, this message translates to:
  /// **'Ensure adequate indirect sunlight every day.'**
  String get tipSunlight;

  /// No description provided for @tipTemperature.
  ///
  /// In en, this message translates to:
  /// **'Keep temperature stable — avoid cold drafts and direct heat.'**
  String get tipTemperature;

  /// No description provided for @tipPests.
  ///
  /// In en, this message translates to:
  /// **'Check for pests regularly and wipe leaves for better photosynthesis.'**
  String get tipPests;

  /// No description provided for @tipWaterInterval.
  ///
  /// In en, this message translates to:
  /// **'Water every {n} {n, plural, one{day} other{days}} for best results.'**
  String tipWaterInterval(int n);

  /// No description provided for @tipFeedInterval.
  ///
  /// In en, this message translates to:
  /// **'Feed every {n} {n, plural, one{day} other{days}} to keep it growing strong.'**
  String tipFeedInterval(int n);

  /// No description provided for @scheduleCardIntervals.
  ///
  /// In en, this message translates to:
  /// **'🔁 Care Intervals'**
  String get scheduleCardIntervals;

  /// No description provided for @scheduleCardReminders.
  ///
  /// In en, this message translates to:
  /// **'⏰ Reminder Times'**
  String get scheduleCardReminders;

  /// No description provided for @scheduleCardUpcoming.
  ///
  /// In en, this message translates to:
  /// **'📅 Upcoming Dates'**
  String get scheduleCardUpcoming;

  /// No description provided for @scheduleWatering.
  ///
  /// In en, this message translates to:
  /// **'Watering'**
  String get scheduleWatering;

  /// No description provided for @scheduleFeeding.
  ///
  /// In en, this message translates to:
  /// **'Feeding'**
  String get scheduleFeeding;

  /// No description provided for @scheduleWaterReminder.
  ///
  /// In en, this message translates to:
  /// **'Water Reminder'**
  String get scheduleWaterReminder;

  /// No description provided for @scheduleFeedReminder.
  ///
  /// In en, this message translates to:
  /// **'Feed Reminder'**
  String get scheduleFeedReminder;

  /// No description provided for @scheduleNextWatering.
  ///
  /// In en, this message translates to:
  /// **'Next watering'**
  String get scheduleNextWatering;

  /// No description provided for @scheduleNextFeeding.
  ///
  /// In en, this message translates to:
  /// **'Next feeding'**
  String get scheduleNextFeeding;

  /// No description provided for @scheduleEveryNDays.
  ///
  /// In en, this message translates to:
  /// **'Every {n} {n, plural, one{day} other{days}}'**
  String scheduleEveryNDays(int n);

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue!'**
  String get overdue;

  /// No description provided for @healthThriving2.
  ///
  /// In en, this message translates to:
  /// **'Thriving 🌟'**
  String get healthThriving2;

  /// No description provided for @healthNeedsCare2.
  ///
  /// In en, this message translates to:
  /// **'Needs Care'**
  String get healthNeedsCare2;

  /// No description provided for @healthUrgent2.
  ///
  /// In en, this message translates to:
  /// **'Urgent! 🚨'**
  String get healthUrgent2;

  /// No description provided for @remindersOn.
  ///
  /// In en, this message translates to:
  /// **'🔔 Reminders on'**
  String get remindersOn;

  /// No description provided for @remindersOff.
  ///
  /// In en, this message translates to:
  /// **'🔕 Off'**
  String get remindersOff;

  /// No description provided for @actionWatered.
  ///
  /// In en, this message translates to:
  /// **'Watered!'**
  String get actionWatered;

  /// No description provided for @actionFed.
  ///
  /// In en, this message translates to:
  /// **'Fed!'**
  String get actionFed;

  /// No description provided for @snackWatered.
  ///
  /// In en, this message translates to:
  /// **'💧 {name} has been watered!'**
  String snackWatered(String name);

  /// No description provided for @snackFed.
  ///
  /// In en, this message translates to:
  /// **'🌿 {name} has been fed!'**
  String snackFed(String name);

  /// No description provided for @pushReminders.
  ///
  /// In en, this message translates to:
  /// **'Push Reminders'**
  String get pushReminders;

  /// No description provided for @notificationsActive.
  ///
  /// In en, this message translates to:
  /// **'Daily notifications are active'**
  String get notificationsActive;

  /// No description provided for @tapToEnableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Tap to enable notifications'**
  String get tapToEnableNotifications;

  /// No description provided for @snackRemindersOn.
  ///
  /// In en, this message translates to:
  /// **'🔔 Reminders turned ON for {name}'**
  String snackRemindersOn(String name);

  /// No description provided for @snackRemindersOff.
  ///
  /// In en, this message translates to:
  /// **'🔕 Reminders turned OFF for {name}'**
  String snackRemindersOff(String name);

  /// No description provided for @editCareSchedule.
  ///
  /// In en, this message translates to:
  /// **'Edit Care Schedule'**
  String get editCareSchedule;

  /// No description provided for @labelWateringInterval.
  ///
  /// In en, this message translates to:
  /// **'Watering Interval (Days)'**
  String get labelWateringInterval;

  /// No description provided for @labelFeedingInterval.
  ///
  /// In en, this message translates to:
  /// **'Feeding Interval (Days)'**
  String get labelFeedingInterval;

  /// No description provided for @labelWateringTime.
  ///
  /// In en, this message translates to:
  /// **'Watering Time'**
  String get labelWateringTime;

  /// No description provided for @labelFeedingTime.
  ///
  /// In en, this message translates to:
  /// **'Feeding Time'**
  String get labelFeedingTime;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @notifDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay on top of\nyour plant care! 🌿'**
  String get notifDialogTitle;

  /// No description provided for @notifDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications so we can remind you when your plants need watering or fertilizing.'**
  String get notifDialogBody;

  /// No description provided for @allowNotifications.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allowNotifications;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get maybeLater;

  /// No description provided for @pillWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get pillWater;

  /// No description provided for @pillFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get pillFeed;

  /// No description provided for @pillLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get pillLight;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Grow Your\nUrban Jungle'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'A modern approach to keeping your plants alive and thriving.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingInfoTitle1.
  ///
  /// In en, this message translates to:
  /// **'Never Miss a Drop'**
  String get onboardingInfoTitle1;

  /// No description provided for @onboardingInfoBody1.
  ///
  /// In en, this message translates to:
  /// **'Set custom reminders for watering, fertilizing, and repotting. Your plants will thank you.'**
  String get onboardingInfoBody1;

  /// No description provided for @onboardingInfoTitle2.
  ///
  /// In en, this message translates to:
  /// **'Data Privacy'**
  String get onboardingInfoTitle2;

  /// No description provided for @onboardingInfoBody2.
  ///
  /// In en, this message translates to:
  /// **'Your data stays on your device.\nHigh performance tracking allows you to get the most out of your plant.'**
  String get onboardingInfoBody2;

  /// No description provided for @onboardingStartBody.
  ///
  /// In en, this message translates to:
  /// **'Enjoy the benefits of a modern approach to keeping your plants alive and thriving with Plant Care.'**
  String get onboardingStartBody;

  /// No description provided for @onboardingStartCta.
  ///
  /// In en, this message translates to:
  /// **'Ready to start your journey?'**
  String get onboardingStartCta;

  /// No description provided for @notifWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Water {name}'**
  String notifWaterTitle(String name);

  /// No description provided for @notifFeedTitle.
  ///
  /// In en, this message translates to:
  /// **'Feed {name}'**
  String notifFeedTitle(String name);

  /// No description provided for @notifWaterBody.
  ///
  /// In en, this message translates to:
  /// **'{name} needs water now.'**
  String notifWaterBody(String name);

  /// No description provided for @notifFeedBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is ready for plant food.'**
  String notifFeedBody(String name);

  /// No description provided for @notifActionMarkDone.
  ///
  /// In en, this message translates to:
  /// **'Mark Done'**
  String get notifActionMarkDone;

  /// No description provided for @tourSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings ⚙️'**
  String get tourSettingsTitle;

  /// No description provided for @tourSettingsDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap here to open Settings and customize theme, language, and more.'**
  String get tourSettingsDesc;

  /// No description provided for @tourBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Green Sanctuary 🌿'**
  String get tourBannerTitle;

  /// No description provided for @tourBannerDesc.
  ///
  /// In en, this message translates to:
  /// **'A quick overview of your garden\'s current status at a glance.'**
  String get tourBannerDesc;

  /// No description provided for @tourStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Live Statistics 📊'**
  String get tourStatsTitle;

  /// No description provided for @tourStatsDesc.
  ///
  /// In en, this message translates to:
  /// **'Track your total plants, healthy count, and upcoming watering and feeding needs.'**
  String get tourStatsDesc;

  /// No description provided for @tourSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'My Plants 🪴'**
  String get tourSectionTitle;

  /// No description provided for @tourSectionDesc.
  ///
  /// In en, this message translates to:
  /// **'Browse the full list of all your registered plants right here.'**
  String get tourSectionDesc;

  /// No description provided for @tourEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Empty Garden 🌱'**
  String get tourEmptyTitle;

  /// No description provided for @tourEmptyDesc.
  ///
  /// In en, this message translates to:
  /// **'No plants yet! Add your first plant to start your care schedule.'**
  String get tourEmptyDesc;

  /// No description provided for @tourFabTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a Plant ✨'**
  String get tourFabTitle;

  /// No description provided for @tourFabDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap here to register a new plant and set up its care reminders.'**
  String get tourFabDesc;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: May 2026'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.1'**
  String get settingsVersion;

  /// No description provided for @settingsWidget.
  ///
  /// In en, this message translates to:
  /// **'Home Screen Widget'**
  String get settingsWidget;

  /// No description provided for @settingsWidgetDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a widget on your home screen to see your plant stats at a glance'**
  String get settingsWidgetDesc;

  /// No description provided for @createWidget.
  ///
  /// In en, this message translates to:
  /// **'Create Widget'**
  String get createWidget;

  /// No description provided for @widgetCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Widget created successfully! 🎉'**
  String get widgetCreatedSuccess;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @privacySection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Information We Collect'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In en, this message translates to:
  /// **'Plant Care does not collect, store, or transmit any personal data to external servers. All information you provide — including plant names, species, care schedules, and reminder preferences — is stored exclusively on your device using local storage (Hive).\n\nWe do not use analytics SDKs, crash reporting tools, or any third-party services that collect personally identifiable information.'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Notifications'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Body.
  ///
  /// In en, this message translates to:
  /// **'If you grant permission, Plant Care uses local push notifications to remind you about watering and feeding schedules. No notification data is sent to external servers. All notification scheduling happens entirely on your device.\n\nYou can revoke notification permission at any time through your device settings or within the app.'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. Data Storage & Security'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Body.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored locally using Hive, a lightweight and encrypted local database. Since no data leaves your device, there is no risk of data breach from our side.\n\nIf you uninstall the app, all stored data is permanently deleted.'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Third-Party Services'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Body.
  ///
  /// In en, this message translates to:
  /// **'This app does not integrate any third-party analytics, advertising, or tracking services. The app uses the following packages solely for local functionality:\n  • Hive — local database\n  • Awesome Notifications — local notification scheduling\n  • Provider — in-app state management\n\nNone of these packages transmit your data externally.'**
  String get privacySection4Body;

  /// No description provided for @privacySection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Children\'s Privacy'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Body.
  ///
  /// In en, this message translates to:
  /// **'Plant Care is safe for all ages. We do not collect any personal information from anyone, including children under 13. All data remains on the user\'s device.'**
  String get privacySection5Body;

  /// No description provided for @privacySection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Changes to This Policy'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Body.
  ///
  /// In en, this message translates to:
  /// **'We may update this privacy policy from time to time. Any changes will be reflected within the app. Continued use of the app after changes constitutes acceptance of the updated policy.'**
  String get privacySection6Body;

  /// No description provided for @privacySection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Contact'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Body.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about this privacy policy, please contact us at:\nmahamadbarznji712@gmail.com'**
  String get privacySection7Body;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'ku'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'ku':
      return AppLocalizationsKu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
