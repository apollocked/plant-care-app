import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mock_plant_care_app/core/l10n/app_localizations.dart';

const String basicChannelKey = 'basic_channel';
const String scheduledChannelKey = 'scheduled_channel';

enum PlantReminderType { water, food }

int notificationIdForPlant(String plantId, PlantReminderType type) {
  final int hash = plantId.hashCode.abs().remainder(99999);
  if (type == PlantReminderType.water) {
    return hash * 10 + 1;
  }
  return hash * 10 + 2;
}

Future<void> createPlantReminderNotification({
  required BuildContext context,
  required int id,
  required String plantId,
  required String plantName,
  required PlantReminderType type,
  required int hour,
  required int minute,
}) async {
  final bool isWater = type == PlantReminderType.water;
  final l10n = AppLocalizations.of(context)!;
  final String title = isWater
      ? '${Emojis.icon_sweat_droplets} ${l10n.notifWaterTitle(plantName)}'
      : '${Emojis.plant_cactus} ${l10n.notifFeedTitle(plantName)}';

  final String body = isWater
      ? l10n.notifWaterBody(plantName)
      : l10n.notifFeedBody(plantName);

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: scheduledChannelKey,
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
      payload: <String, String>{'plantId': plantId, 'reminderType': type.name},
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: l10n.notifActionMarkDone,
      ),
    ],
    schedule: NotificationCalendar(
      hour: hour,
      minute: minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> cancelPlantNotifications(String plantId) async {
  await AwesomeNotifications().cancel(
    notificationIdForPlant(plantId, PlantReminderType.water),
  );
  await AwesomeNotifications().cancel(
    notificationIdForPlant(plantId, PlantReminderType.food),
  );
}
