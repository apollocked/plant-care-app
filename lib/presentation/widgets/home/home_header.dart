import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';
import 'package:mock_plant_care_app/core/l10n/l10n.dart';
import 'package:mock_plant_care_app/logic/language_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
    required this.onSurface,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;
  final Color onSurface;

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
              Text(
                loc.plantCare,
                style: TextStyle(fontSize: 17, color: onSurface),
              ),
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
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onToggleTheme,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.06),
                  ),
                  child: Icon(
                    isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: 20,
                    color: onSurface.withValues(alpha: 0.8),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Consumer<LanguageService>(
                builder: (context, langService, _) {
                  return PopupMenuButton<Locale>(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    offset: const Offset(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.1)
                            : Colors.black.withValues(alpha: 0.06),
                      ),
                      child: Icon(
                        Icons.translate_rounded,
                        size: 20,
                        color: onSurface.withValues(alpha: 0.8),
                      ),
                    ),
                    onSelected: (Locale locale) {
                      langService.setLocale(locale);
                    },
                    itemBuilder: (BuildContext context) {
                      return L10n.all.map((Locale locale) {
                        final bool isSelected = langService.locale == locale;
                        return PopupMenuItem(
                          value: locale,
                          child: Row(
                            children: [
                              Text(
                                L10n.getNativeName(locale.languageCode),
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : null,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                              ),
                              if (isSelected) ...[
                                const Spacer(),
                                Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ],
                            ],
                          ),
                        );
                      }).toList();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
