// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'رعاية النبات';

  @override
  String get appSubtitle => 'لوحة تحكم خضراء';

  @override
  String get addNewPlant => 'إضافة نبات جديد';

  @override
  String get savePlant => 'حفظ النبات';

  @override
  String failedToSavePlant(String error) {
    return 'فشل حفظ النبات: $error';
  }

  @override
  String get plantDetails => 'تفاصيل النبات';

  @override
  String get plantNotFound => 'النبات غير موجود';

  @override
  String get tabCareInfo => '🌿 معلومات الرعاية';

  @override
  String get tabSchedule => '📋 الجدول';

  @override
  String get removePlant => 'إزالة النبات';

  @override
  String removePlantConfirm(String name) {
    return 'هل تريد إزالة \"$name\" من حديقتك؟';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get remove => 'إزالة';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get myPlants => 'نباتاتي';

  @override
  String get plantCare => 'رعاية النبات';

  @override
  String heroBannerUrgent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'نباتات تحتاج',
      one: 'نبات يحتاج',
    );
    return '🔔 $count $_temp0 انتباهاً';
  }

  @override
  String get heroBannerAllGood => '✅ جميع النباتات بخير';

  @override
  String get heroBannerHeading => 'ملاذك الأخضر 🌿';

  @override
  String urgentBannerTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'نباتات تحتاج',
      one: 'نبات يحتاج',
    );
    return '$count $_temp0 رعاية';
  }

  @override
  String get urgentBannerSubtitle => 'اضغط على بطاقة نبات لاتخاذ إجراء';

  @override
  String get statTotal => 'الإجمالي';

  @override
  String get statHealthy => 'صحي';

  @override
  String get statWater => 'ماء';

  @override
  String get statFeed => 'غذاء';

  @override
  String get noPlantsYet => 'لا نباتات بعد';

  @override
  String get noPlantsDesc =>
      'أضف نباتك الأول وابدأ في تتبع جدول رعايته مع تذكيرات يومية.';

  @override
  String get noPlantsHint => '🌱 اضغط على \"إضافة نبات\" للبدء';

  @override
  String get addPlant => 'إضافة نبات';

  @override
  String get unknownSpecies => 'نوع غير معروف';

  @override
  String get healthThriving => 'مزدهر';

  @override
  String get healthNeedsCare => 'يحتاج رعاية';

  @override
  String get healthUrgent => 'عاجل!';

  @override
  String get waterNow => 'اسقِ الآن';

  @override
  String get waterOk => 'تمّ السقي';

  @override
  String get feedNow => 'أطعِم الآن';

  @override
  String get feedOk => 'تمّ الإطعام';

  @override
  String get sectionPlantIdentity => 'هوية النبات';

  @override
  String get labelPlantName => 'اسم النبات';

  @override
  String get hintPlantName => 'مثال: فيدل ليف';

  @override
  String get labelSpecies => 'النوع (اختياري)';

  @override
  String get hintSpecies => 'مثال: مونستيرا ديليسيوسا';

  @override
  String get validatorEnterName => 'الرجاء إدخال اسم';

  @override
  String get sectionCareSchedule => 'جدول الرعاية';

  @override
  String get labelWaterEvery => 'اسقِ كل';

  @override
  String get labelFeedEvery => 'أطعِم كل';

  @override
  String get suffixDays => 'أيام';

  @override
  String get commonCareTips => 'نصائح الرعاية الشائعة';

  @override
  String get tipWater =>
      'الري: 2-3 أيام للنباتات العصارية، 5-7 للنباتات الاستوائية.';

  @override
  String get tipFeed => 'التغذية: 7-14 يوماً في موسم النمو، نادرة في الشتاء.';

  @override
  String get validatorRequired => 'مطلوب';

  @override
  String get validatorMustBePositive => 'يجب أن يكون > 0';

  @override
  String get sectionReminders => 'التذكيرات';

  @override
  String get labelWateringReminder => 'تذكير السقي';

  @override
  String get labelFeedingReminder => 'تذكير الإطعام';

  @override
  String get remindersDisabled => 'التذكيرات معطلة لهذا النبات.';

  @override
  String get careCardWatering => 'الري';

  @override
  String get careCardFeeding => 'التغذية';

  @override
  String get careCardWatered => 'تمّ الري ✓';

  @override
  String get careCardFed => 'تمّ الإطعام ✓';

  @override
  String get careCardWaterNow => 'اسقِ الآن!';

  @override
  String get careCardFeedNow => 'أطعِم الآن!';

  @override
  String lastWatered(String time) {
    return 'آخر ري $time';
  }

  @override
  String lastFed(String time) {
    return 'آخر إطعام $time';
  }

  @override
  String everyNDays(int n) {
    return 'كل $nي';
  }

  @override
  String get justNow => 'الآن';

  @override
  String hoursAgo(int h) {
    return 'منذ $h ساعة';
  }

  @override
  String daysAgo(int d) {
    return 'منذ $d يوم';
  }

  @override
  String get careTipsHeading => '💡 نصائح الرعاية';

  @override
  String get tipSunlight => 'تأكد من الحصول على ضوء غير مباشر كافٍ كل يوم.';

  @override
  String get tipTemperature =>
      'حافظ على درجة حرارة ثابتة — تجنب التيارات الباردة والحرارة المباشرة.';

  @override
  String get tipPests =>
      'افحص النبات بانتظام وامسح الأوراق لتحسين التمثيل الضوئي.';

  @override
  String tipWaterInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'أيام',
      one: 'يوم',
    );
    return 'اسقِ كل $n $_temp0 للحصول على أفضل النتائج.';
  }

  @override
  String tipFeedInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'أيام',
      one: 'يوم',
    );
    return 'أطعِم كل $n $_temp0 ليستمر في النمو.';
  }

  @override
  String get scheduleCardIntervals => '🔁 فترات الرعاية';

  @override
  String get scheduleCardReminders => '⏰ أوقات التذكير';

  @override
  String get scheduleCardUpcoming => '📅 المواعيد القادمة';

  @override
  String get scheduleWatering => 'الري';

  @override
  String get scheduleFeeding => 'التغذية';

  @override
  String get scheduleWaterReminder => 'تذكير الري';

  @override
  String get scheduleFeedReminder => 'تذكير الإطعام';

  @override
  String get scheduleNextWatering => 'الري القادم';

  @override
  String get scheduleNextFeeding => 'الإطعام القادم';

  @override
  String scheduleEveryNDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'أيام',
      one: 'يوم',
    );
    return 'كل $n $_temp0';
  }

  @override
  String get overdue => 'متأخر!';

  @override
  String get healthThriving2 => 'مزدهر 🌟';

  @override
  String get healthNeedsCare2 => 'يحتاج رعاية';

  @override
  String get healthUrgent2 => 'عاجل! 🚨';

  @override
  String get remindersOn => '🔔 التذكيرات مفعّلة';

  @override
  String get remindersOff => '🔕 معطّلة';

  @override
  String get actionWatered => 'تمّ الري!';

  @override
  String get actionFed => 'تمّ الإطعام!';

  @override
  String snackWatered(String name) {
    return '💧 تمّ سقي $name!';
  }

  @override
  String snackFed(String name) {
    return '🌿 تمّ إطعام $name!';
  }

  @override
  String get pushReminders => 'تذكيرات فورية';

  @override
  String get notificationsActive => 'الإشعارات اليومية مفعّلة';

  @override
  String get tapToEnableNotifications => 'اضغط لتفعيل الإشعارات';

  @override
  String snackRemindersOn(String name) {
    return '🔔 تمّ تشغيل التذكيرات لـ $name';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 تمّ إيقاف التذكيرات لـ $name';
  }

  @override
  String get editCareSchedule => 'تعديل جدول الرعاية';

  @override
  String get labelWateringInterval => 'فترة الري (أيام)';

  @override
  String get labelFeedingInterval => 'فترة الإطعام (أيام)';

  @override
  String get labelWateringTime => 'وقت الري';

  @override
  String get labelFeedingTime => 'وقت الإطعام';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get notifDialogTitle => 'ابقَ على اطلاع\nبرعاية نباتاتك! 🌿';

  @override
  String get notifDialogBody =>
      'فعّل الإشعارات حتى نذكّرك عندما تحتاج نباتاتك إلى الري أو التسميد.';

  @override
  String get allowNotifications => 'السماح بالإشعارات';

  @override
  String get maybeLater => 'ربما لاحقاً';

  @override
  String get pillWater => 'ماء';

  @override
  String get pillFeed => 'غذاء';

  @override
  String get pillLight => 'ضوء';

  @override
  String get onboardingWelcomeTitle => 'أنشئ غابتك\nالحضرية';

  @override
  String get onboardingWelcomeBody =>
      'نهج حديث للحفاظ على نباتاتك حية ومزدهرة.';

  @override
  String get onboardingInfoTitle1 => 'لا تفوّت قطرة';

  @override
  String get onboardingInfoBody1 =>
      'اضبط تذكيرات مخصصة للري والتسميد وإعادة الزراعة. نباتاتك ستشكرك.';

  @override
  String get onboardingInfoTitle2 => 'خصوصية البيانات';

  @override
  String get onboardingInfoBody2 =>
      'تبقى بياناتك على جهازك.\nيتيح لك التتبع عالي الأداء الاستفادة القصوى من نباتاتك.';

  @override
  String get onboardingStartBody =>
      'استمتع بفوائد النهج الحديث للحفاظ على نباتاتك حية ومزدهرة مع رعاية النبات.';

  @override
  String get onboardingStartCta => 'هل أنت مستعد لبدء رحلتك؟';
}
