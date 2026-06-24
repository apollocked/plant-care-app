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
  String get welcome => 'بەخێربێیت';

  @override
  String get plantDetails => 'وردەکارییەکانی ڕووەک';

  @override
  String get plantNotFound => 'ڕووەک نەدۆزرایەوە';

  @override
  String get tabCareInfo => '🌿 زانیاری چاودێری';

  @override
  String get tabSchedule => '📋 خشتە';

  @override
  String get removePlant => 'سڕینەوەی ڕووەک';

  @override
  String removePlantConfirm(String name) {
    return 'دەتەوێت \"$name\" لە باخچەکەت بسڕیتەوە؟';
  }

  @override
  String get cancel => 'هەڵوەشاندنەوە';

  @override
  String get remove => 'سڕینەوە';

  @override
  String get undo => 'پووچاندنەوە';

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
  String get statTotalDesc => 'کۆمەڵە ڕووەکەکانت';

  @override
  String statTotalDetailHealthy(int count) {
    return '$count ڕووەکی تەندروست';
  }

  @override
  String statTotalDetailWater(int count) {
    return '$count پێویستیان بە ئاوە';
  }

  @override
  String statTotalDetailFood(int count) {
    return '$count پێویستیان بە خۆراکە';
  }

  @override
  String statHealthyDesc(String p) {
    return '$p% لە ڕووەکەکانت گەشاوەن';
  }

  @override
  String get statHealthyDetail => 'زۆر باشە! بەردەوام بە لە چاودێری!';

  @override
  String statWaterDesc(String p) {
    return '$p% لە ڕووەکەکان پێویستیان بە ئاوە';
  }

  @override
  String get statWaterDetailTap => 'کرتە لە ڕووەکەکان بکە بۆ ئاودانیان';

  @override
  String get statWaterDetailConsider => 'بیربکەرەوە لە ئاودانی ئێستا';

  @override
  String statFeedDesc(String p) {
    return '$p% لە ڕووەکەکان پێویستیان بە پەینە';
  }

  @override
  String get statFeedDetailWeakened => 'خۆراک بە ڕووەکە لاوازەکان ببەخشە';

  @override
  String get statFeedDetailFollow =>
      'ڕێنماییەکانی خۆراکدان بۆ هەر ڕووەکێک پەیڕەو بکە';

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
  String get healthNeedsCare => 'پێویستی بە چاودێريیە';

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
  String get suffixWeeks => 'هەفتە';

  @override
  String get switchToDays => 'ڕۆژ';

  @override
  String get switchToWeeks => 'هەفتە';

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
  String everyNWeeks(int n) {
    return 'هەموو $n هەفتەیەک';
  }

  @override
  String scheduleEveryNWeeks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'هەفتە',
      one: 'هەفتەیەک',
    );
    return 'هەموو $n $_temp0';
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
      'ئەپێکی سەردەمیانە بۆ هێشتنەوەی ڕووەکەکانت بە زیندوویی و گەشاوەیی.';

  @override
  String get onboardingInfoTitle1 => 'هەرگیز دڵۆپێک لەبیر مەکە';

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

  @override
  String notifWaterTitle(String name) {
    return 'ئاودانی $name';
  }

  @override
  String notifFeedTitle(String name) {
    return 'خۆراکدانی $name';
  }

  @override
  String notifWaterBody(String name) {
    return '$name ئێستا پێویستی بە ئاوە.';
  }

  @override
  String notifFeedBody(String name) {
    return '$name ئامادەیە بۆ وەرگرتنی خۆراک.';
  }

  @override
  String get notifActionMarkDone => 'تەواو';

  @override
  String get tourSettingsTitle => 'ڕێکخستنەکان ⚙️';

  @override
  String get tourSettingsDesc =>
      'لێرەدا کرتە بکە بۆ کردنەوەی ڕێکخستنەکان و گۆڕینی ڕووکار و زمان.';

  @override
  String get tourBannerTitle => 'پەناگە سەوزەکەت 🌿';

  @override
  String get tourBannerDesc => 'لێرەدا کورتەیەک لە دۆخی گشتی باخچەکەت دەبینیت.';

  @override
  String get tourStatsTitle => 'ئامارە زیندوەکان 📊';

  @override
  String get tourStatsDesc =>
      'چاودێری کۆی گشتی ڕووەکەکان، ئاودان، و پێدانی کود بکە بە شێوەیەکی خێرا.';

  @override
  String get tourSectionTitle => 'ڕووەکەکانم 🪴';

  @override
  String get tourSectionDesc =>
      'لێرەوە دەتوانیت سەیری لیستی تەواوی ڕووەکە تۆمارکراوەکانت بکەیت.';

  @override
  String get tourEmptyTitle => 'باخچەکەت خاڵییە 🌱';

  @override
  String get tourEmptyDesc =>
      'ئێستا هیچ ڕووەکێک لێرە نییە. یەکەم ڕووەکت زیادبکە بۆ دەستپێکردنی خشتەی چاودێری.';

  @override
  String get tourFabTitle => 'زیادکردنی ڕووەک ✨';

  @override
  String get tourFabDesc =>
      'لەم دوگمەیەوە دەتوانیت جۆرە جیاوازەکانی ڕووەک لای خۆت تۆمار بکەیت.';

  @override
  String get settings => 'ڕێکخستنەکان';

  @override
  String get privacyPolicy => 'سیاسەی تایبەتی';

  @override
  String get privacyPolicyTitle => 'سیاسەی تایبەتی';

  @override
  String get privacyPolicyLastUpdated => 'دوایین نوێکردنەوە: ئایاری 2026';

  @override
  String get settingsAppearance => 'ڕووکار';

  @override
  String get settingsLanguage => 'زمان';

  @override
  String get settingsAbout => 'دەربارە';

  @override
  String get settingsVersion => 'وەشانی 1.1.0';

  @override
  String get settingsWidget => 'وێجەتی شاشە';

  @override
  String get settingsWidgetDesc =>
      'وێجەت لەسەر شاشە دروست بکە بۆ بینینی ئامار ڕووەکانت بە خێرا';

  @override
  String get createWidget => 'دروستکردنی وێجەت';

  @override
  String get widgetCreatedSuccess => 'وێجەت بە سەرکەوتویی دروست کرا! 🎉';

  @override
  String get darkMode => 'ڕووکاری تاریک';

  @override
  String get lightMode => 'ڕووکاری ڕووناک';

  @override
  String get privacySection1Title => '1. زانیارییەکانی کۆیان دەکەینەوە';

  @override
  String get privacySection1Body =>
      'Plant Care هیچ داتایەکی تایبەتی کۆناکاتەوە، هەڵی ناگرێت، یان بۆ سێرڤەری دەرەکی نانێرێت. هەموو ئەو زانیارییانەی کە دابینی دەکەیت — لەوانە ناوی ڕووەک، جۆرەکانی، خشتەکانی چاودێری و هەڵبژاردەی بیرخستنەوە — تەنها لەسەر ئامێرەکەت هەڵدەگیرێت بە بەکارهێنانی Hive.\n\nئێمە هیچ SDK شیکاری، ئامرازی ڕاپۆرتی کێشە، یان هیچ خزمەتگوزارییەکی دەرەکی کە زانیاری تایبەتی کۆدەکەنەوە بەکارناهێنین.';

  @override
  String get privacySection2Title => '2. ئاگادارکردنەوەکان';

  @override
  String get privacySection2Body =>
      'ئەگەر ڕێگەپێدانی بدەیت، Plant Care ئاگادارکردنەوەی ناوخۆیی بەکاردەهێنێت بۆ بیرخستنەوەت لە کاتی ئاودان و خۆراکدان. هیچ داتایەکی ئاگادارکردنەوە بۆ سێرڤەری دەرەکی نانێردرێت. هەموو خشتەکانی ئاگادارکردنەوە بە تەواوی لەسەر ئامێرەکەت جێبەجێ دەبن.\n\nدەتوانی لە هەر کاتێکدا ڕێگەپێدانی ئاگادارکردنەوەکان هەڵبوەشێنیتەوە لە ڕێکخستنەکانی ئامێرەکەت یان لەناو ئەپەکە.';

  @override
  String get privacySection3Title => '3. هەڵگرتنی داتا و ئاسایش';

  @override
  String get privacySection3Body =>
      'داتاکەت بە شێوەیەکی ناوخۆیی هەڵدەگیرێت بە بەکارهێنانی Hive، کە بنکەدراوەیەکی ناوخۆیی و ڕمزکراوە. بەهۆی ئەوەی هیچ داتایەک ئامێرەکەت بەرنەدەوێت، مەترسی دزینی داتا لەلایەن ئێمەوە نییە.\n\nئەگەر ئەپەکەت سڕییەوە، هەموو داتا هەڵگیراوەکان بە شێوەیەکی هەرەمەکی دەسڕدرێنەوە.';

  @override
  String get privacySection4Title => '4. خزمەتگوزارییەکانی لایەنی سێیەم';

  @override
  String get privacySection4Body =>
      'ئەم ئەپە هیچ خزمەتگوزارییەکی شیکاری، ڕێکلام، یان شوێنکەوتنی لایەنی سێیەم تێدا نییە. ئەپەکە تەنها پاکێجەکانی خوارەوە بەکاردەهێنێت بۆ کارە ناوخۆییەکان:\n  • Hive — بنکەدراوەی ناوخۆیی\n  • Awesome Notifications — خشتەکردنی ئاگادارکردنەوەی ناوخۆیی\n  • Provider — بەڕێوەبردنی دۆخی ئەپ\n\nهیچ کام لەم پاکێجانە داتاکەت بۆ دەرەوە نانێرن.';

  @override
  String get privacySection5Title => '5. تایبەتی منداڵان';

  @override
  String get privacySection5Body =>
      'Plant Care بۆ هەموو تەمەنەکان سەلامەتە. ئێمە هیچ زانیارییەکی تایبەتی کەسێک کۆناکەینەوە، لەوانە منداڵانی خوار ١٣ ساڵ. هەموو داتاکان لەسەر ئامێری بەکارهێنەر دەمێننەوە.';

  @override
  String get privacySection6Title => '6. گۆڕانکارییەکانی ئەم سیاسەتە';

  @override
  String get privacySection6Body =>
      'لەوانەیە ئەم سیاسەی تایبەتییە لە کات بۆ کات نوێ بکەینەوە. هەر گۆڕانکارییەک لەناو ئەپەکەدا دەردەکەوێت. بەردەوامبوون لە بەکارهێنانی ئەپەکە دوای گۆڕانکارییەکان بە مانای قبوڵکردنی سیاسەتی نوێکراوە دێت.';

  @override
  String get privacySection7Title => '7. پەیوەندی';

  @override
  String get privacySection7Body =>
      'ئەگەر پرسیارێکت هەبێت دەربارەی ئەم سیاسەی تایبەتییە، تکایە پەیوەندیمان پێوە بکە لە:\nmahamadbarznji712@gmail.com';
}
