import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class WidgetInstallerService {
  static const MethodChannel _channel = MethodChannel(
    'com.apollo.plant_care/widget',
  );

  static Future<bool> addWidgetToHomeScreen() async {
    try {
      debugPrint('📱 Attempting to add widget to home screen...');
      final bool result =
          await _channel.invokeMethod<bool>('addWidgetToHomeScreen') ?? false;
      debugPrint(
        result
            ? '✅ Widget added to home screen successfully'
            : '❌ Failed to add widget to home screen',
      );
      return result;
    } on PlatformException catch (e) {
      debugPrint('❌ Platform Error: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('❌ Error: $e');
      return false;
    }
  }
}
