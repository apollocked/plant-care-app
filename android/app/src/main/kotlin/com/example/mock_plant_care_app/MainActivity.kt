package com.apollo.plant_care

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.apollo.plant_care/widget"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "addWidgetToHomeScreen" -> {
                    val success = addWidgetToHomeScreen()
                    result.success(success)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun addWidgetToHomeScreen(): Boolean {
        return try {
            val appWidgetManager = AppWidgetManager.getInstance(this)
            val myProvider = ComponentName(this, MyWidgetProvider::class.java)

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                // Android 8+ (API 26+): requestPinAppWidget shows a simple confirmation dialog
                val pendingIntent = android.app.PendingIntent.getActivity(
                    this,
                    0,
                    Intent(this, MainActivity::class.java),
                    android.app.PendingIntent.FLAG_UPDATE_CURRENT or
                    android.app.PendingIntent.FLAG_IMMUTABLE,
                )
                appWidgetManager.requestPinAppWidget(myProvider, null, pendingIntent)
            } else {
                // Fallback: just update the widget if already placed
                appWidgetManager.notifyAppWidgetViewDataChanged(
                    appWidgetManager.getAppWidgetIds(myProvider),
                    android.R.id.list,
                )
            }
            true
        } catch (e: Exception) {
            android.util.Log.e("WidgetInstall", "Error: ${e.message}")
            false
        }
    }
}


