import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';
import 'package:plant_care_app/core/l10n/l10n.dart';
import 'package:plant_care_app/logic/language_viewmodel.dart';
import 'package:plant_care_app/logic/theme_viewmodel.dart';
import 'package:plant_care_app/presentation/pages/privacy_policy_page.dart';
import 'package:plant_care_app/presentation/widgets/settings/glass_container.dart';
import 'package:plant_care_app/presentation/widgets/settings/gradient_scaffold.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final ThemeViewModel themeVm = context.watch<ThemeViewModel>();
    final LanguageService langService = context.watch<LanguageService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.settings),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GradientScaffold(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SettingsSectionHeader(
                  label: loc.settingsAppearance,
                  icon: Icons.palette_outlined,
                  scheme: scheme,
                ),
                const SizedBox(height: 10),
                GlassContainer(
                  borderRadius: 16,
                  padding: EdgeInsets.zero,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: [
                        _SettingsSwitchTile(
                          icon: themeVm.isDarkMode
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          title: themeVm.isDarkMode
                              ? loc.darkMode
                              : loc.lightMode,
                          value: themeVm.isDarkMode,
                          onChanged: (_) => themeVm.toggleTheme(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SettingsSectionHeader(
                  label: loc.settingsLanguage,
                  icon: Icons.translate_rounded,
                  scheme: scheme,
                ),
                const SizedBox(height: 10),
                GlassContainer(
                  borderRadius: 16,
                  padding: EdgeInsets.zero,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: L10n.all.map((Locale locale) {
                        final bool isSelected = langService.locale == locale;
                        return ListTile(
                          leading: Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.language_outlined,
                            color: isSelected ? scheme.primary : null,
                            size: 22,
                          ),
                          title: Text(
                            L10n.getNativeName(locale.languageCode),
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.w600 : null,
                              color: isSelected ? scheme.primary : null,
                            ),
                          ),
                          trailing: isSelected
                              ? Icon(
                                  Icons.check,
                                  size: 18,
                                  color: scheme.primary,
                                )
                              : null,
                          onTap: () => langService.setLocale(locale),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SettingsSectionHeader(
                  label: loc.settingsAbout,
                  icon: Icons.info_outline_rounded,
                  scheme: scheme,
                ),
                const SizedBox(height: 10),
                GlassContainer(
                  borderRadius: 16,
                  padding: EdgeInsets.zero,
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(16),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.privacy_tip_outlined,
                            color: scheme.primary,
                            size: 22,
                          ),
                          title: Text(loc.privacyPolicy),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: scheme.onSurface.withValues(alpha: 0.5),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PrivacyPolicyPage(),
                            ),
                          ),
                        ),
                        const Divider(height: 1, indent: 56, endIndent: 16),
                        ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: scheme.primary,
                            size: 22,
                          ),
                          title: Text(loc.settingsVersion),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    '2026 - Apollo © - All rights reserved \n Made with ❤️ in Kurdistan',
                    style: TextStyle(
                      fontSize: 12,
                      color: scheme.onSurface.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsSectionHeader extends StatelessWidget {
  const _SettingsSectionHeader({
    required this.label,
    required this.icon,
    required this.scheme,
  });

  final String label;
  final IconData icon;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: scheme.primary),
          const SizedBox(width: 8),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: scheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  const _SettingsSwitchTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return SwitchListTile(
      secondary: Icon(icon, color: scheme.primary, size: 22),
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeThumbColor: scheme.primary,
      inactiveThumbColor: Theme.of(context).disabledColor,
      inactiveTrackColor: Theme.of(
        context,
      ).disabledColor.withValues(alpha: 0.3),
    );
  }
}
