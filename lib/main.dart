import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mock_plant_care_app/core/theme/app_theme.dart';
import 'package:mock_plant_care_app/data/services/notification_service.dart';
import 'package:mock_plant_care_app/data/services/storage_service.dart';
import 'package:mock_plant_care_app/presentation/pages/home_page.dart';
import 'package:mock_plant_care_app/logic/plant_viewmodel.dart';
import 'package:mock_plant_care_app/logic/theme_viewmodel.dart';
import 'package:mock_plant_care_app/presentation/pages/onboarding_page.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final StorageService storageService = StorageService();
  final NotificationService notificationService = NotificationService();
  await storageService.init();
  await notificationService.initialize();
  final Box box = await Hive.openBox('settings');
  final PlantViewModel plantViewModel = PlantViewModel(
    storageService,
    notificationService,
  );
  final ThemeViewModel themeViewModel = ThemeViewModel(storageService);
  await plantViewModel.loadPlants();
  await themeViewModel.loadThemeMode();
  bool isFirstTime = box.get('isFirstTime', defaultValue: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlantViewModel>.value(value: plantViewModel),
        ChangeNotifierProvider<ThemeViewModel>.value(value: themeViewModel),
      ],
      child: AppWidget(isFerstTime: isFirstTime),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key, required this.isFerstTime});
  final bool isFerstTime;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (BuildContext context, ThemeViewModel themeVm, _) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: snackbarKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeVm.themeMode,
          title: 'Plant Care',
          home: isFerstTime ? const OnboardingPage() : const HomePage(),
        );
      },
    );
  }
}
