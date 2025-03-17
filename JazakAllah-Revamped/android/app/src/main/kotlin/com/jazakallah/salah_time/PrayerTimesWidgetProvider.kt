// package com.jazakallah.salah_time

// import android.appwidget.AppWidgetManager
// import android.appwidget.AppWidgetProvider
// import android.content.Context
// import android.widget.RemoteViews
// import es.antonborri.home_widget.HomeWidgetPlugin

// class PrayerTimesWidgetProvider : AppWidgetProvider() {
//     override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
//         for (appWidgetId in appWidgetIds) {
//             // Get the widget data from shared preferences
//             val widgetData = HomeWidgetPlugin.getData(context)
            
//             // Get prayer times
//             val fajr = widgetData.getString("fajr", "00:00")
//             val dhuhr = widgetData.getString("dhuhr", "00:00")
//             val asr = widgetData.getString("asr", "00:00")
//             val maghrib = widgetData.getString("maghrib", "00:00")
//             val isha = widgetData.getString("isha", "00:00")
//             val masjidName = widgetData.getString("masjid_name", "No masjid selected")
            
//             // Set up the widget views
//             val views = RemoteViews(context.packageName, R.layout.prayer_times_widget)
//             views.setTextViewText(R.id.text_masjid_name, masjidName)
//             views.setTextViewText(R.id.text_fajr, "Fajr: $fajr")
//             views.setTextViewText(R.id.text_dhuhr, "Dhuhr: $dhuhr")
//             views.setTextViewText(R.id.text_asr, "Asr: $asr")
//             views.setTextViewText(R.id.text_maghrib, "Maghrib: $maghrib")
//             views.setTextViewText(R.id.text_isha, "Isha: $isha")
            
//             // Update the widget
//             appWidgetManager.updateAppWidget(appWidgetId, views)
//         }
//     }
// }
