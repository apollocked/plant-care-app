import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/l10n/l10n.dart';
import 'package:plant_care_app/core/theme/app_theme.dart';
import 'package:plant_care_app/data/services/notification_service.dart';
import 'package:plant_care_app/data/services/storage_service.dart';
import 'package:plant_care_app/logic/language_viewmodel.dart';
import 'package:plant_care_app/presentation/pages/home_page.dart';
import 'package:plant_care_app/logic/plant_viewmodel.dart';
import 'package:plant_care_app/logic/theme_viewmodel.dart';
import 'package:plant_care_app/presentation/pages/onboarding_page.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final StorageService storageService = StorageService();
  final NotificationService notificationService = NotificationService();

  await storageService.init();
  await notificationService.initialize();

  final PlantViewModel plantViewModel = PlantViewModel(
    storageService,
    notificationService,
  );

  final ThemeViewModel themeViewModel = ThemeViewModel(storageService);
  final LanguageService languageService = LanguageService(storageService);

  await plantViewModel.loadPlants();
  await themeViewModel.loadThemeMode();
  languageService.loadLocale();
  FlutterNativeSplash.remove();

  final bool isFirstTime = storageService.getIsFirstTime();

  runApp(
    MultiProvider(
      providers: [
        Provider<StorageService>.value(value: storageService),
        ChangeNotifierProvider<PlantViewModel>.value(value: plantViewModel),
        ChangeNotifierProvider<ThemeViewModel>.value(value: themeViewModel),
        ChangeNotifierProvider<LanguageService>.value(value: languageService),
      ],
      child: AppWidget(
        isFirstTime: isFirstTime,
        storageService: storageService,
      ),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.isFirstTime,
    required this.storageService,
  });

  final bool isFirstTime;
  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final LanguageService langService = context.watch<LanguageService>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeVm.themeMode,
      title: 'Plant Care',
      locale: langService.locale,
      localizationsDelegates: [
        KurdishMaterialLocalizations.delegate,
        KurdishWidgetsLocalizations.delegate,
        KurdishCupertinoLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: isFirstTime
          ? const OnboardingPage()
          : HomePage(storageService: storageService),
    );
  }
}
