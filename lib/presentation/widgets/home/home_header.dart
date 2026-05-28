import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/settings_icon.dart';
import 'package:mock_plant_care_app/presentation/widgets/home/theme_lang_controls.dart';
import 'package:mock_plant_care_app/presentation/widgets/onboarding/build_showcase.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.isDark,
    required this.onSurface,
    this.onToggleTheme,
    this.showcaseKey,
    this.showcaseTitle,
    this.showcaseDesc,
    this.onSettingsTap,
  });

  final bool isDark;
  final Color onSurface;
  final VoidCallback? onToggleTheme;
  final VoidCallback? onSettingsTap;
  final GlobalKey? showcaseKey;
  final String? showcaseTitle;
  final String? showcaseDesc;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Image.asset('assets/icons/plant_icon.png', width: 32, height: 32),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loc.plantCare, style: TextStyle(fontSize: 17, color: onSurface)),
              Text(
                loc.appSubtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: onSurface.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        if (onToggleTheme != null)
          ThemeLangControls(
            isDark: isDark,
            onSurface: onSurface,
            onToggleTheme: onToggleTheme!,
          )
        else ...[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: showcaseKey != null
                ? buildShowcase(
                    key: showcaseKey!,
                    title: showcaseTitle ?? '',
                    description: showcaseDesc ?? '',
                    isDark: isDark,
                    targetBorderRadius: BorderRadius.circular(32),
                    child: SettingsIcon(
                      isDark: isDark,
                      onSurface: onSurface,
                      onTap: onSettingsTap,
                    ),
                  )
                : SettingsIcon(
                    isDark: isDark,
                    onSurface: onSurface,
                    onTap: onSettingsTap,
                  ),
          ),
        ],
      ],
    );
  }
}
