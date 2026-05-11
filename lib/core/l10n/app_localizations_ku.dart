// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kurdish (`ku`).
class AppLocalizationsKu extends AppLocalizations {
  AppLocalizationsKu([String locale = 'ku']) : super(locale);

  @override
  String get appTitle => 'چاودێری ڕووەک';

  @override
  String get appSubtitle => 'داشبۆردە سەوزەکەت';

  @override
  String get addNewPlant => 'زیادکردنی ڕووەکێکی نوێ';

  @override
  String get savePlant => 'هەڵگرتنی ڕووەک';

  @override
  String failedToSavePlant(String error) {
    return 'هەڵگرتنی ڕووەک سەرنەکەوت: $error';
  }

  @override
  String get plantDetails => 'وردەکارییەکانی ڕووەک';

  @override
  String get plantNotFound => 'ڕووەک نەدۆزرایەوە';

  @override
  String get tabCareInfo => '🌿 زانیاری چاودێری';

  @override
  String get tabSchedule => '📋 خشتە';

  @override
  String get removePlant => 'لابردنی ڕووەک';

  @override
  String removePlantConfirm(String name) {
    return 'دەتەوێت \"$name\" لە باخچەکەت لاببەیت؟';
  }

  @override
  String get cancel => 'هەڵوەشاندنەوە';

  @override
  String get remove => 'لابردن';

  @override
  String get getStarted => 'دەستپێکردن';

  @override
  String get skip => 'تێپەڕاندن';

  @override
  String get next => 'دواتر';

  @override
  String get myPlants => 'ڕووەکەکانم';

  @override
  String get plantCare => 'چاودێری ڕووەک';

  @override
  String heroBannerUrgent(int count) {
    return '🔔 $count ڕووەک پێویستی بە سەرنجە';
  }

  @override
  String get heroBannerAllGood => '✅ هەموو ڕووەکەکان تەندروستن';

  @override
  String get heroBannerHeading => 'پەناگە سەوزەکەت 🌿';

  @override
  String urgentBannerTitle(int count) {
    return '$count ڕووەک پێویستی بە چاودێرییە';
  }

  @override
  String get urgentBannerSubtitle => 'کرتە لە کارتی ڕووەکێک بکە بۆ کاردانەوە';

  @override
  String get statTotal => 'کۆی گشتی';

  @override
  String get statHealthy => 'تەندروست';

  @override
  String get statWater => 'ئاو';

  @override
  String get statFeed => 'خۆراک';

  @override
  String get noPlantsYet => 'هیچ ڕووەکێک نییە';

  @override
  String get noPlantsDesc =>
      'یەکەم ڕووەکت زیاد بکە و بەدواداچوون بۆ خشتەی چاودێرییەکەی بکە لەگەڵ بیرخستنەوەی ڕۆژانە.';

  @override
  String get noPlantsHint => '🌱 کرتە لە \"زیادکردنی ڕووەک\" بکە بۆ دەستپێکردن';

  @override
  String get addPlant => 'زیادکردنی ڕووەک';

  @override
  String get unknownSpecies => 'جۆری نەناسراو';

  @override
  String get healthThriving => 'گەشاوە';

  @override
  String get healthNeedsCare => 'پێویستی بە چاودێرییە';

  @override
  String get healthUrgent => 'بەپەلە!';

  @override
  String get waterNow => 'ئێستا ئاوی بدە';

  @override
  String get waterOk => 'ئاو باشە';

  @override
  String get feedNow => 'ئێستا خۆراکی پێبدە';

  @override
  String get feedOk => 'خۆراک باشە';

  @override
  String get sectionPlantIdentity => 'ناسنامەی ڕووەک';

  @override
  String get labelPlantName => 'ناوی ڕووەک';

  @override
  String get hintPlantName => 'بۆ نموونە: فیدل لیف';

  @override
  String get labelSpecies => 'جۆر (ئارەزوومەندانە)';

  @override
  String get hintSpecies => 'بۆ نموونە: مۆنستێرا دەلیسیۆسا';

  @override
  String get validatorEnterName => 'تکایە ناوێک بنووسە';

  @override
  String get sectionCareSchedule => 'خشتەی چاودێری';

  @override
  String get labelWaterEvery => 'ئاودان هەموو';

  @override
  String get labelFeedEvery => 'خۆراکدان هەموو';

  @override
  String get suffixDays => 'ڕۆژ';

  @override
  String get commonCareTips => 'ئامۆژگارییە باوەکانی چاودێری';

  @override
  String get tipWater =>
      'ئاودان: ٢-٣ ڕۆژ بۆ کاکتۆس، ٥-٧ بۆ ڕووەکە خولگەییەکان.';

  @override
  String get tipFeed =>
      'خۆراکدان: ٧-١٤ ڕۆژ لە وەرزی گەشەکردندا، دەگمەن لە زستاندا.';

  @override
  String get validatorRequired => 'پێویستە';

  @override
  String get validatorMustBePositive => 'دەبێت لە ٠ گەورەتر بێت';

  @override
  String get sectionReminders => 'بیرخستنەوەکان';

  @override
  String get labelWateringReminder => 'بیرخستنەوەی ئاودان';

  @override
  String get labelFeedingReminder => 'بیرخستنەوەی خۆراکدان';

  @override
  String get remindersDisabled => 'بیرخستنەوەکان بۆ ئەم ڕووەکە ناچالاکن.';

  @override
  String get careCardWatering => 'ئاودان';

  @override
  String get careCardFeeding => 'خۆراکدان';

  @override
  String get careCardWatered => 'ئاودرا ✓';

  @override
  String get careCardFed => 'خۆراکی پێدرا ✓';

  @override
  String get careCardWaterNow => 'ئێستا ئاوی بدە!';

  @override
  String get careCardFeedNow => 'ئێستا خۆراکی پێبدە!';

  @override
  String lastWatered(String time) {
    return 'دواین ئاودان $time';
  }

  @override
  String lastFed(String time) {
    return 'دواین خۆراکدان $time';
  }

  @override
  String everyNDays(int n) {
    return 'هەموو $n ڕۆژێک';
  }

  @override
  String get justNow => 'هەر ئێستا';

  @override
  String hoursAgo(int h) {
    return 'پێش $h کاتژمێر';
  }

  @override
  String daysAgo(int d) {
    return 'پێش $d ڕۆژ';
  }

  @override
  String get careTipsHeading => '💡 ئامۆژگارییەکانی چاودێری';

  @override
  String get tipSunlight =>
      'دڵنیابە لە پێدانی تیشکی خۆری ناڕاستەوخۆی پێویست هەموو ڕۆژێک.';

  @override
  String get tipTemperature =>
      'پلەی گەرمی بە جێگیری بهێڵەوە — لە هەوای سارد و گەرمای ڕاستەوخۆ بەدووربە.';

  @override
  String get tipPests =>
      'بەردەوام پشکنین بۆ مێرووە زیانبەخشەکان بکە و گەڵاکان بسڕەوە بۆ باشترکردنی ڕۆشنەپێکهاتن.';

  @override
  String tipWaterInterval(int n) {
    return 'هەموو $n ڕۆژ ئاوی بدە بۆ باشترین ئەنجام.';
  }

  @override
  String tipFeedInterval(int n) {
    return 'هەموو $n ڕۆژ خۆراکی پێبدە بۆ ئەوەی بەهێزتر گەشە بکات.';
  }

  @override
  String get scheduleCardIntervals => '🔁 ماوەکانی چاودێری';

  @override
  String get scheduleCardReminders => '⏰ کاتەکانی بیرخستنەوە';

  @override
  String get scheduleCardUpcoming => '📅 بەروارەکانی داهاتوو';

  @override
  String get scheduleWatering => 'ئاودان';

  @override
  String get scheduleFeeding => 'خۆراکدان';

  @override
  String get scheduleWaterReminder => 'بیرخستنەوەی ئاودان';

  @override
  String get scheduleFeedReminder => 'بیرخستنەوەی خۆراکدان';

  @override
  String get scheduleNextWatering => 'ئاودانی داهاتوو';

  @override
  String get scheduleNextFeeding => 'خۆراکدانی داهاتوو';

  @override
  String scheduleEveryNDays(int n) {
    return 'هەموو $n ڕۆژێک';
  }

  @override
  String get overdue => 'دواکەوتووە!';

  @override
  String get healthThriving2 => 'گەشاوە 🌟';

  @override
  String get healthNeedsCare2 => 'پێویستی بە چاودێرییە';

  @override
  String get healthUrgent2 => 'بەپەلە! 🚨';

  @override
  String get remindersOn => '🔔 بیرخستنەوەکان چالاکن';

  @override
  String get remindersOff => '🔕 ناچالاکن';

  @override
  String get actionWatered => 'ئاودرا!';

  @override
  String get actionFed => 'خۆراکی پێدرا!';

  @override
  String snackWatered(String name) {
    return '💧 $name ئاودراوە!';
  }

  @override
  String snackFed(String name) {
    return '🌿 $name خۆراکی پێدراوە!';
  }

  @override
  String get pushReminders => 'بیرخستنەوەکان';

  @override
  String get notificationsActive => 'ئاگادارکردنەوەی ڕۆژانە چالاکە';

  @override
  String get tapToEnableNotifications =>
      'کرتە بکە بۆ چالاککردنی ئاگادارکردنەوەکان';

  @override
  String snackRemindersOn(String name) {
    return '🔔 بیرخستنەوەکان بۆ $name چالاک کران';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 بیرخستنەوەکان بۆ $name ناچالاک کران';
  }

  @override
  String get editCareSchedule => 'دەستکاریکردنی خشتەی چاودێری';

  @override
  String get labelWateringInterval => 'ماوەی ئاودان (ڕۆژ)';

  @override
  String get labelFeedingInterval => 'ماوەی خۆراکدان (ڕۆژ)';

  @override
  String get labelWateringTime => 'کاتی ئاودان';

  @override
  String get labelFeedingTime => 'کاتی خۆراکدان';

  @override
  String get saveChanges => 'هەڵگرتنی گۆڕانکارییەکان';

  @override
  String get notifDialogTitle => 'ئاگاداری ڕووەکەکانت بە! 🌿';

  @override
  String get notifDialogBody =>
      'ئاگادارکردنەوەکان چالاک بکە بۆ ئەوەی کاتێک ڕووەکەکانت پێویستیان بە ئاو یان پەینە، بیرت بخەینەوە.';

  @override
  String get allowNotifications => 'ڕێگەدان بە ئاگادارکردنەوە';

  @override
  String get maybeLater => 'لەوانەیە دواتر';

  @override
  String get pillWater => 'ئاو';

  @override
  String get pillFeed => 'خۆراک';

  @override
  String get pillLight => 'ڕووناکی';

  @override
  String get onboardingWelcomeTitle => 'جیهانە سەوزەکەت\nگەشە پێبدە';

  @override
  String get onboardingWelcomeBody =>
      'ڕێگەیەکی سەردەمیانە بۆ هێشتنەوەی ڕووەکەکانت بە زیندوویی و گەشاوەیی.';

  @override
  String get onboardingInfoTitle1 => 'هەرگیز دڵۆپێک لەدەست مەدە';

  @override
  String get onboardingInfoBody1 =>
      'بیرخستنەوەی تایبەت دابنێ بۆ ئاودان، پەیندان و گۆڕینی گۆزە. ڕووەکەکانت سوپاست دەکەن.';

  @override
  String get onboardingInfoTitle2 => 'پاراستنی زانیارییەکان';

  @override
  String get onboardingInfoBody2 =>
      'داتاکەت لەسەر ئامێرەکەت دەمێنێتەوە.\nبەدواداچوونی ئاستبەرز ڕێگەت پێدەدات زۆرترین سوود لە ڕووەکەکەت وەربگریت.';

  @override
  String get onboardingStartBody =>
      'چێژ لە سوودەکانی ڕێگەیەکی سەردەمیانە وەربگرە بۆ هێشتنەوەی ڕووەکەکانت بە زیندوویی و گەشاوەیی لەگەڵ چاودێری ڕووەک.';

  @override
  String get onboardingStartCta => 'ئامادەی بۆ دەستپێکردنی گەشتەکەت؟';
}
