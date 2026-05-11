// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kurdish (`ku`).
class AppLocalizationsKu extends AppLocalizations {
  AppLocalizationsKu([String locale = 'ku']) : super(locale);

  @override
  String get appTitle => 'چاودێری رووەک';

  @override
  String get appSubtitle => 'داشبۆردی سەوزەکەت';

  @override
  String get addNewPlant => 'زیادکردنی رووەکێکی نوێ';

  @override
  String get savePlant => 'پاشەکەوتکردنی رووەک';

  @override
  String failedToSavePlant(String error) {
    return 'پاشەکەوتکردنی رووەک سەرنەکەوت: $error';
  }

  @override
  String get plantDetails => 'وردەکارییەکانی رووەک';

  @override
  String get plantNotFound => 'رووەک نەدۆزرایەوە';

  @override
  String get tabCareInfo => '🌿 زانیاری چاودێری';

  @override
  String get tabSchedule => '📋 خشتە';

  @override
  String get removePlant => 'لابردنی رووەک';

  @override
  String removePlantConfirm(String name) {
    return 'ئایا دەتەوێت \"$name\" لە بەستانەکەت لابببەیت؟';
  }

  @override
  String get cancel => 'پاشگەزبوونەوە';

  @override
  String get remove => 'لابردن';

  @override
  String get getStarted => 'دەستپێبکە';

  @override
  String get skip => 'تێپەڕین';

  @override
  String get next => 'دواتر';

  @override
  String get myPlants => 'رووەکەکانم';

  @override
  String get plantCare => 'چاودێری رووەک';

  @override
  String heroBannerUrgent(int count) {
    return '🔔 $count رووەک پێویستی ئامادەبوون هەیە';
  }

  @override
  String get heroBannerAllGood => '✅ هەموو رووەکەکان باشن';

  @override
  String get heroBannerHeading => 'پەنایگای سەوزەکەت 🌿';

  @override
  String urgentBannerTitle(int count) {
    return '$count رووەک پێویستی چاودێری هەیە';
  }

  @override
  String get urgentBannerSubtitle => 'تەختەی رووەکێک بپەڕێنە بۆ کردارەکەی';

  @override
  String get statTotal => 'کۆی گشتی';

  @override
  String get statHealthy => 'تەندروست';

  @override
  String get statWater => 'ئاو';

  @override
  String get statFeed => 'خواردن';

  @override
  String get noPlantsYet => 'هیچ رووەکێک نییە';

  @override
  String get noPlantsDesc =>
      'یەکەم رووەکەت زیاد بکە و خشتەی چاودێریەکەی بشوێنە بە ئاگاداریکردنەوەی ڕۆژانە.';

  @override
  String get noPlantsHint => '🌱 \"زیادکردنی رووەک\" بپەڕێنە بۆ دەستپێکردن';

  @override
  String get addPlant => 'زیادکردنی رووەک';

  @override
  String get unknownSpecies => 'جۆری نەناسراو';

  @override
  String get healthThriving => 'گەشەسەندوو';

  @override
  String get healthNeedsCare => 'پێویستی چاودێری هەیە';

  @override
  String get healthUrgent => 'فریاکەوتن!';

  @override
  String get waterNow => 'ئێستا ئاوی بدە';

  @override
  String get waterOk => 'ئاوی دراوە';

  @override
  String get feedNow => 'ئێستا بیخوێنە';

  @override
  String get feedOk => 'خواردنی دراوە';

  @override
  String get sectionPlantIdentity => 'ناسنامەی رووەک';

  @override
  String get labelPlantName => 'ناوی رووەک';

  @override
  String get hintPlantName => 'بۆ نموونە: فیدل لیف';

  @override
  String get labelSpecies => 'جۆر (ئارەزوومەند)';

  @override
  String get hintSpecies => 'بۆ نموونە: مۆنستێرا دەلیسیۆسا';

  @override
  String get validatorEnterName => 'تکایە ناوێک بنووسە';

  @override
  String get sectionCareSchedule => 'خشتەی چاودێری';

  @override
  String get labelWaterEvery => 'ئاوی بدە هەموو';

  @override
  String get labelFeedEvery => 'بیخوێنە هەموو';

  @override
  String get suffixDays => 'ڕۆژ';

  @override
  String get commonCareTips => 'ئامۆژگارییە باوەکان';

  @override
  String get tipWater => 'ئاوداندن: 2-3 ڕۆژ بۆ کاکتوس، 5-7 بۆ تڕۆپیکال.';

  @override
  String get tipFeed => 'خوراندن: 7-14 ڕۆژ لە مەوسەمی گەشەکردن، کەم لە زستان.';

  @override
  String get validatorRequired => 'پێویستە';

  @override
  String get validatorMustBePositive => 'دەبێت > 0 بێت';

  @override
  String get sectionReminders => 'ئاگاداریکردنەوەکان';

  @override
  String get labelWateringReminder => 'ئاگاداریکردنەوەی ئاوداندن';

  @override
  String get labelFeedingReminder => 'ئاگاداریکردنەوەی خوراندن';

  @override
  String get remindersDisabled => 'ئاگاداریکردنەوەکان بۆ ئەم رووەکە ناچالاکن.';

  @override
  String get careCardWatering => 'ئاوداندن';

  @override
  String get careCardFeeding => 'خوراندن';

  @override
  String get careCardWatered => 'ئاوی درا ✓';

  @override
  String get careCardFed => 'خواردنی درا ✓';

  @override
  String get careCardWaterNow => 'ئێستا ئاوی بدە!';

  @override
  String get careCardFeedNow => 'ئێستا بیخوێنە!';

  @override
  String lastWatered(String time) {
    return 'دوایین ئاوداندن $time';
  }

  @override
  String lastFed(String time) {
    return 'دوایین خوراندن $time';
  }

  @override
  String everyNDays(int n) {
    return 'هەموو $nڕ';
  }

  @override
  String get justNow => 'ئێستا';

  @override
  String hoursAgo(int h) {
    return 'پێش $h کاتژمێر';
  }

  @override
  String daysAgo(int d) {
    return 'پێش $d ڕۆژ';
  }

  @override
  String get careTipsHeading => '💡 ئامۆژگارییەکان';

  @override
  String get tipSunlight =>
      'دڵنیابە لە وەرگرتنی ڕووناکی ناڕاستەوخۆی پێویست هەموو ڕۆژ.';

  @override
  String get tipTemperature =>
      'پلەی گەرمی جێگیر بپارێزە — لە هەوای سارد و گەرمای ڕاستەوخۆ دووربە.';

  @override
  String get tipPests =>
      'بەرپرسانەوار مامناوەند بپشکنە و پەلەکان بسووچێنە بۆ باشترکردنی فۆتۆسینتیز.';

  @override
  String tipWaterInterval(int n) {
    return 'هەموو $n ڕۆژ ئاوی بدە بۆ باشترین ئەنجام.';
  }

  @override
  String tipFeedInterval(int n) {
    return 'هەموو $n ڕۆژ بیخوێنە بۆ ئەوەی بەهێزتر گەشە بکات.';
  }

  @override
  String get scheduleCardIntervals => '🔁 ماوەکانی چاودێری';

  @override
  String get scheduleCardReminders => '⏰ کاتەکانی ئاگاداریکردنەوە';

  @override
  String get scheduleCardUpcoming => '📅 بەرواری داهاتوو';

  @override
  String get scheduleWatering => 'ئاوداندن';

  @override
  String get scheduleFeeding => 'خوراندن';

  @override
  String get scheduleWaterReminder => 'ئاگاداریکردنەوەی ئاوداندن';

  @override
  String get scheduleFeedReminder => 'ئاگاداریکردنەوەی خوراندن';

  @override
  String get scheduleNextWatering => 'ئاوداندنی داهاتوو';

  @override
  String get scheduleNextFeeding => 'خوراندنی داهاتوو';

  @override
  String scheduleEveryNDays(int n) {
    return 'هەموو $n ڕۆژ';
  }

  @override
  String get overdue => 'دواخراوە!';

  @override
  String get healthThriving2 => 'گەشەسەندوو 🌟';

  @override
  String get healthNeedsCare2 => 'پێویستی چاودێری هەیە';

  @override
  String get healthUrgent2 => 'فریاکەوتن! 🚨';

  @override
  String get remindersOn => '🔔 ئاگاداریکردنەوەکان چالاکن';

  @override
  String get remindersOff => '🔕 ناچالاک';

  @override
  String get actionWatered => 'ئاوی درا!';

  @override
  String get actionFed => 'خواردنی درا!';

  @override
  String snackWatered(String name) {
    return '💧 $name ئاوی دراوە!';
  }

  @override
  String snackFed(String name) {
    return '🌿 $name خواردنی دراوە!';
  }

  @override
  String get pushReminders => 'ئاگاداریکردنەوەی فووری';

  @override
  String get notificationsActive => 'ئاگاداریکردنەوەی ڕۆژانە چالاکە';

  @override
  String get tapToEnableNotifications =>
      'بپەڕێنە بۆ چالاککردنی ئاگاداریکردنەوەکان';

  @override
  String snackRemindersOn(String name) {
    return '🔔 ئاگاداریکردنەوەکان بۆ $name چالاک کران';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 ئاگاداریکردنەوەکان بۆ $name ناچالاک کران';
  }

  @override
  String get editCareSchedule => 'دەستکاریکردنی خشتەی چاودێری';

  @override
  String get labelWateringInterval => 'ماوەی ئاوداندن (ڕۆژ)';

  @override
  String get labelFeedingInterval => 'ماوەی خوراندن (ڕۆژ)';

  @override
  String get labelWateringTime => 'کاتی ئاوداندن';

  @override
  String get labelFeedingTime => 'کاتی خوراندن';

  @override
  String get saveChanges => 'پاشەکەوتکردنی گۆڕانکاریەکان';

  @override
  String get notifDialogTitle => 'لەسەر چاودێری\nرووەکەکانت بمێنەوە! 🌿';

  @override
  String get notifDialogBody =>
      'ئاگاداریکردنەوەکان چالاک بکە تا کاتێک رووەکەکانت پێویستی ئاو یان کۆد هەبوون ئاگادارت بکەینەوە.';

  @override
  String get allowNotifications => 'ڕێگەدان بە ئاگاداریکردنەوەکان';

  @override
  String get maybeLater => 'دواتر';

  @override
  String get pillWater => 'ئاو';

  @override
  String get pillFeed => 'خواردن';

  @override
  String get pillLight => 'ڕووناکی';

  @override
  String get onboardingWelcomeTitle => 'دەستەی شارستانی\nخۆت بچێژاندنەوە';

  @override
  String get onboardingWelcomeBody =>
      'نزیکترین ڕێگە بۆ زیندەهێشتنی رووەکەکانت.';

  @override
  String get onboardingInfoTitle1 => 'قەتری وەرمەگرە';

  @override
  String get onboardingInfoBody1 =>
      'ئاگاداریکردنەوەی تایبەت دابنێ بۆ ئاوداندن و تەقنەکردن و گواستنەوە. رووەکەکانت سوپاست دەکەن.';

  @override
  String get onboardingInfoTitle2 => 'پاراستنی داتا';

  @override
  String get onboardingInfoBody2 =>
      'داتاکەت لەسەر ئامێرەکەت دەمێنێتەوە.\nشوێنکەوتنی بەرجەستە ڕێگەی پێ دەدات زیاترین سوود لە رووەکەکەت وەربگریت.';

  @override
  String get onboardingStartBody =>
      'چێژی ئامرازی دیجیتاڵی نوێ بۆ زیندەهێشتنی رووەکەکانت وەربگرە لەگەڵ چاودێری رووەک.';

  @override
  String get onboardingStartCta => 'ئامادەی دەستپێکردنی گەشتەکەتی؟';
}
