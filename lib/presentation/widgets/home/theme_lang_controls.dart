import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/l10n.dart';
import 'package:mock_plant_care_app/logic/language_viewmodel.dart';
import 'package:provider/provider.dart';

class ThemeLangControls extends StatelessWidget {
  const ThemeLangControls({
    super.key,
    required this.isDark,
    required this.onSurface,
    required this.onToggleTheme,
  });

  final bool isDark;
  final Color onSurface;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
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
                onSelected: (Locale locale) => langService.setLocale(locale),
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
                              fontWeight: isSelected ? FontWeight.bold : null,
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
    );
  }
}
