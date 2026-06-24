// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Cuidado de Plantas';

  @override
  String get appSubtitle => 'Tu tablero verde';

  @override
  String get addNewPlant => 'Añadir Nueva Planta';

  @override
  String get savePlant => 'Guardar Planta';

  @override
  String failedToSavePlant(String error) {
    return 'Error al guardar la planta: $error';
  }

  @override
  String get welcome => 'Bienvenido';

  @override
  String get plantDetails => 'Detalles de la Planta';

  @override
  String get plantNotFound => 'Planta no encontrada';

  @override
  String get tabCareInfo => '🌿 Info de Cuidado';

  @override
  String get tabSchedule => '📋 Horario';

  @override
  String get removePlant => 'Eliminar Planta';

  @override
  String removePlantConfirm(String name) {
    return '¿Eliminar \"$name\" de tu jardín?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Eliminar';

  @override
  String get undo => 'Deshacer';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get skip => 'Saltar';

  @override
  String get next => 'Siguiente';

  @override
  String get myPlants => 'Mis Plantas';

  @override
  String get plantCare => 'PlantCare';

  @override
  String heroBannerUrgent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plantas necesitan',
      one: 'planta necesita',
    );
    return '🔔 $count $_temp0 atención';
  }

  @override
  String get heroBannerAllGood => '✅ Todas las plantas están felices';

  @override
  String get heroBannerHeading => 'Tu Santuario\nVerde 🌿';

  @override
  String urgentBannerTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plantas',
      one: 'planta',
    );
    return '$count $_temp0 necesitan cuidado';
  }

  @override
  String get urgentBannerSubtitle => 'Toca una tarjeta para actuar';

  @override
  String get statTotal => 'Total';

  @override
  String get statHealthy => 'Saludables';

  @override
  String get statWater => 'Agua';

  @override
  String get statFeed => 'Comida';

  @override
  String get statTotalDesc => 'Tu colección de plantas';

  @override
  String statTotalDetailHealthy(int count) {
    return '$count plantas saludables';
  }

  @override
  String statTotalDetailWater(int count) {
    return '$count necesitan agua';
  }

  @override
  String statTotalDetailFood(int count) {
    return '$count necesitan comida';
  }

  @override
  String statHealthyDesc(String p) {
    return 'El $p% de tus plantas prosperan';
  }

  @override
  String get statHealthyDetail => '¡Buen trabajo! ¡Sigue así!';

  @override
  String statWaterDesc(String p) {
    return 'El $p% de las plantas necesitan agua';
  }

  @override
  String get statWaterDetailTap => 'Toca las plantas para regarlas';

  @override
  String get statWaterDetailConsider => 'Considera regar ahora';

  @override
  String statFeedDesc(String p) {
    return 'El $p% de las plantas necesitan fertilizante';
  }

  @override
  String get statFeedDetailWeakened => 'Alimenta las plantas débiles';

  @override
  String get statFeedDetailFollow => 'Sigue las instrucciones por planta';

  @override
  String get noPlantsYet => 'Sin Plantas Aún';

  @override
  String get noPlantsDesc =>
      'Añade tu primera planta y empieza a seguir su cuidado con recordatorios diarios.';

  @override
  String get noPlantsHint => '🌱 Toca \"Añadir Planta\" para empezar';

  @override
  String get addPlant => 'Añadir Planta';

  @override
  String get unknownSpecies => 'Especie desconocida';

  @override
  String get healthThriving => 'Prosperando';

  @override
  String get healthNeedsCare => 'Necesita cuidado';

  @override
  String get healthUrgent => '¡Urgente!';

  @override
  String get waterNow => 'Regar Ahora';

  @override
  String get waterOk => 'Agua bien';

  @override
  String get feedNow => 'Alimentar Ahora';

  @override
  String get feedOk => 'Comida bien';

  @override
  String get sectionPlantIdentity => 'Identidad de la Planta';

  @override
  String get labelPlantName => 'Nombre de la Planta';

  @override
  String get hintPlantName => 'ej. Mi Higo Hoja';

  @override
  String get labelSpecies => 'Especie (Opcional)';

  @override
  String get hintSpecies => 'ej. Monstera Deliciosa';

  @override
  String get validatorEnterName => 'Por favor ingresa un nombre';

  @override
  String get sectionCareSchedule => 'Horario de Cuidado';

  @override
  String get labelWaterEvery => 'Regar cada';

  @override
  String get labelFeedEvery => 'Alimentar cada';

  @override
  String get suffixDays => 'días';

  @override
  String get suffixWeeks => 'semanas';

  @override
  String get switchToDays => 'Días';

  @override
  String get switchToWeeks => 'Semanas';

  @override
  String get commonCareTips => 'Consejos de Cuidado';

  @override
  String get tipWater =>
      'Riego: 2-3 días para suculentas, 5-7 para tropicales.';

  @override
  String get tipFeed =>
      'Abono: 7-14 días en temporada de crecimiento, raro en invierno.';

  @override
  String get validatorRequired => 'Requerido';

  @override
  String get validatorMustBePositive => 'Debe ser > 0';

  @override
  String get sectionReminders => 'Recordatorios';

  @override
  String get labelWateringReminder => 'Recordatorio de Riego';

  @override
  String get labelFeedingReminder => 'Recordatorio de Abono';

  @override
  String get remindersDisabled =>
      'Los recordatorios están desactivados para esta planta.';

  @override
  String get careCardWatering => 'Riego';

  @override
  String get careCardFeeding => 'Abono';

  @override
  String get careCardWatered => 'Regada ✓';

  @override
  String get careCardFed => 'Alimentada ✓';

  @override
  String get careCardWaterNow => '¡Regar Ahora!';

  @override
  String get careCardFeedNow => '¡Alimentar Ahora!';

  @override
  String lastWatered(String time) {
    return 'Último riego $time';
  }

  @override
  String lastFed(String time) {
    return 'Última alimentación $time';
  }

  @override
  String everyNDays(int n) {
    return 'Cada ${n}d';
  }

  @override
  String everyNWeeks(int n) {
    return 'Cada ${n}s';
  }

  @override
  String scheduleEveryNWeeks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'semanas',
      one: 'semana',
    );
    return 'Cada $n $_temp0';
  }

  @override
  String get justNow => 'justo ahora';

  @override
  String hoursAgo(int h) {
    return 'hace ${h}h';
  }

  @override
  String daysAgo(int d) {
    return 'hace ${d}d';
  }

  @override
  String get careTipsHeading => '💡 Consejos de Cuidado';

  @override
  String get tipSunlight => 'Asegura luz indirecta adecuada todos los días.';

  @override
  String get tipTemperature =>
      'Mantén la temperatura estable — evita corrientes frías y calor directo.';

  @override
  String get tipPests =>
      'Revisa plagas regularmente y limpia las hojas para mejor fotosíntesis.';

  @override
  String tipWaterInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'días',
      one: 'día',
    );
    return 'Riega cada $n $_temp0 para mejores resultados.';
  }

  @override
  String tipFeedInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'días',
      one: 'día',
    );
    return 'Abona cada $n $_temp0 para mantenerlo fuerte.';
  }

  @override
  String get scheduleCardIntervals => '🔁 Intervalos de Cuidado';

  @override
  String get scheduleCardReminders => '⏰ Horarios de Recordatorio';

  @override
  String get scheduleCardUpcoming => '📅 Próximas Fechas';

  @override
  String get scheduleWatering => 'Riego';

  @override
  String get scheduleFeeding => 'Abono';

  @override
  String get scheduleWaterReminder => 'Recordatorio de Riego';

  @override
  String get scheduleFeedReminder => 'Recordatorio de Abono';

  @override
  String get scheduleNextWatering => 'Próximo riego';

  @override
  String get scheduleNextFeeding => 'Próximo abono';

  @override
  String scheduleEveryNDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'días',
      one: 'día',
    );
    return 'Cada $n $_temp0';
  }

  @override
  String get overdue => '¡Atrasado!';

  @override
  String get healthThriving2 => 'Prosperando 🌟';

  @override
  String get healthNeedsCare2 => 'Necesita Cuidado';

  @override
  String get healthUrgent2 => '¡Urgente! 🚨';

  @override
  String get remindersOn => '🔔 Recordatorios activados';

  @override
  String get remindersOff => '🔕 Desactivados';

  @override
  String get actionWatered => '¡Regada!';

  @override
  String get actionFed => '¡Alimentada!';

  @override
  String snackWatered(String name) {
    return '💧 ¡$name ha sido regada!';
  }

  @override
  String snackFed(String name) {
    return '🌿 ¡$name ha sido alimentada!';
  }

  @override
  String get pushReminders => 'Recordatorios Push';

  @override
  String get notificationsActive => 'Notificaciones diarias activas';

  @override
  String get tapToEnableNotifications => 'Toca para activar notificaciones';

  @override
  String snackRemindersOn(String name) {
    return '🔔 Recordatorios ACTIVADOS para $name';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 Recordatorios DESACTIVADOS para $name';
  }

  @override
  String get editCareSchedule => 'Editar Horario de Cuidado';

  @override
  String get labelWateringInterval => 'Intervalo de Riego (Días)';

  @override
  String get labelFeedingInterval => 'Intervalo de Abono (Días)';

  @override
  String get labelWateringTime => 'Hora de Riego';

  @override
  String get labelFeedingTime => 'Hora de Abono';

  @override
  String get saveChanges => 'Guardar Cambios';

  @override
  String get notifDialogTitle => '¡Mantente al día con\ntus plantas! 🌿';

  @override
  String get notifDialogBody =>
      'Activa las notificaciones para recordarte cuándo regar o abonar tus plantas.';

  @override
  String get allowNotifications => 'Permitir Notificaciones';

  @override
  String get maybeLater => 'Quizás Después';

  @override
  String get pillWater => 'Agua';

  @override
  String get pillFeed => 'Comida';

  @override
  String get pillLight => 'Luz';

  @override
  String get onboardingWelcomeTitle => 'Cultiva Tu\nSelva Urbana';

  @override
  String get onboardingWelcomeBody =>
      'Un enfoque moderno para mantener tus plantas vivas y prósperas.';

  @override
  String get onboardingInfoTitle1 => 'Nunca Te Pierdas un Riego';

  @override
  String get onboardingInfoBody1 =>
      'Configura recordatorios personalizados para riego, abono y trasplante. Tus plantas te lo agradecerán.';

  @override
  String get onboardingInfoTitle2 => 'Privacidad de Datos';

  @override
  String get onboardingInfoBody2 =>
      'Tus datos permanecen en tu dispositivo.\nEl seguimiento de alto rendimiento te permite aprovechar al máximo tu planta.';

  @override
  String get onboardingStartBody =>
      'Disfruta los beneficios de un enfoque moderno para mantener tus plantas vivas y prósperas con Plant Care.';

  @override
  String get onboardingStartCta => '¿Listo para comenzar tu viaje?';

  @override
  String notifWaterTitle(String name) {
    return 'Regar $name';
  }

  @override
  String notifFeedTitle(String name) {
    return 'Alimentar $name';
  }

  @override
  String notifWaterBody(String name) {
    return '$name necesita agua ahora.';
  }

  @override
  String notifFeedBody(String name) {
    return '$name está listo para abono.';
  }

  @override
  String get notifActionMarkDone => 'Marcar Hecho';

  @override
  String get tourSettingsTitle => 'Configuración ⚙️';

  @override
  String get tourSettingsDesc =>
      'Toca aquí para abrir Configuración y personalizar tema, idioma y más.';

  @override
  String get tourBannerTitle => 'Tu Santuario Verde 🌿';

  @override
  String get tourBannerDesc =>
      'Una visión general rápida del estado actual de tu jardín.';

  @override
  String get tourStatsTitle => 'Estadísticas en Vivo 📊';

  @override
  String get tourStatsDesc =>
      'Sigue tu total de plantas, cantidad saludable y próximas necesidades de riego y abono.';

  @override
  String get tourSectionTitle => 'Mis Plantas 🪴';

  @override
  String get tourSectionDesc =>
      'Navega la lista completa de todas tus plantas registradas aquí.';

  @override
  String get tourEmptyTitle => 'Jardín Vacío 🌱';

  @override
  String get tourEmptyDesc =>
      '¡Sin plantas aún! Añade tu primera planta para comenzar tu horario de cuidado.';

  @override
  String get tourFabTitle => 'Añadir una Planta ✨';

  @override
  String get tourFabDesc =>
      'Toca aquí para registrar una nueva planta y configurar sus recordatorios.';

  @override
  String get settings => 'Configuración';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get privacyPolicyTitle => 'Política de Privacidad';

  @override
  String get privacyPolicyLastUpdated => 'Última actualización: mayo 2026';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsVersion => 'Versión 1.1.0';

  @override
  String get settingsWidget => 'Widget de Pantalla de Inicio';

  @override
  String get settingsWidgetDesc =>
      'Crea un widget en tu pantalla de inicio para ver tus estadísticas de un vistazo';

  @override
  String get createWidget => 'Crear Widget';

  @override
  String get widgetCreatedSuccess => '¡Widget creado exitosamente! 🎉';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get privacySection1Title => '1. Información que Recopilamos';

  @override
  String get privacySection1Body =>
      'Plant Care no recopila, almacena ni transmite ningún dato personal a servidores externos. Toda la información que proporcionas —incluyendo nombres de plantas, especies, horarios de cuidado y preferencias de recordatorios— se almacena exclusivamente en tu dispositivo usando almacenamiento local (Hive).\n\nNo utilizamos SDKs de análisis, herramientas de reporte de fallos ni ningún servicio de terceros que recopile información personal identificable.';

  @override
  String get privacySection2Title => '2. Notificaciones';

  @override
  String get privacySection2Body =>
      'Si concedes permiso, Plant Care usa notificaciones push locales para recordarte los horarios de riego y abono. Ningún dato de notificación se envía a servidores externos. Toda la programación de notificaciones ocurre completamente en tu dispositivo.\n\nPuedes revocar el permiso de notificaciones en cualquier momento a través de la configuración de tu dispositivo o dentro de la app.';

  @override
  String get privacySection3Title => '3. Almacenamiento y Seguridad de Datos';

  @override
  String get privacySection3Body =>
      'Tus datos se almacenan localmente usando Hive, una base de datos local ligera y encriptada. Como ningún dato sale de tu dispositivo, no hay riesgo de filtración de datos por nuestra parte.\n\nSi desinstalas la app, todos los datos almacenados se eliminan permanentemente.';

  @override
  String get privacySection4Title => '4. Servicios de Terceros';

  @override
  String get privacySection4Body =>
      'Esta app no integra servicios de análisis, publicidad o seguimiento de terceros. La app utiliza los siguientes paquetes únicamente para funcionalidad local:\n  • Hive — base de datos local\n  • Awesome Notifications — programación local de notificaciones\n  • Provider — gestión de estado en la app\n\nNinguno de estos paquetes transmite tus datos externamente.';

  @override
  String get privacySection5Title => '5. Privacidad de Menores';

  @override
  String get privacySection5Body =>
      'Plant Care es segura para todas las edades. No recopilamos información personal de nadie, incluidos niños menores de 13 años. Todos los datos permanecen en el dispositivo del usuario.';

  @override
  String get privacySection6Title => '6. Cambios a Esta Política';

  @override
  String get privacySection6Body =>
      'Podemos actualizar esta política de privacidad de vez en cuando. Cualquier cambio se reflejará dentro de la app. El uso continuado de la app después de los cambios constituye la aceptación de la política actualizada.';

  @override
  String get privacySection7Title => '7. Contacto';

  @override
  String get privacySection7Body =>
      'Si tienes alguna pregunta sobre esta política de privacidad, contáctanos en:\nmahamadbarznji712@gmail.com';
}
