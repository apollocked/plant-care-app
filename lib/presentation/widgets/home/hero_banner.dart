import 'package:flutter/material.dart';
import 'package:plant_care_app/core/l10n/app_localizations.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.urgentCount,
    required this.plantCount,
  });

  final int urgentCount;
  final int plantCount;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Image.asset('assets/images/cover.png', fit: BoxFit.cover),
          ),
          Container(
            height: 190,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.62),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    loc.heroBannerHeading,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      urgentCount > 0
                          ? loc.heroBannerUrgent(urgentCount)
                          : plantCount > 0
                          ? loc.heroBannerAllGood
                          : loc.noPlantsYet,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
