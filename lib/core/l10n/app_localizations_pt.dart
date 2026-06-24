// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Cuidado de Plantas';

  @override
  String get appSubtitle => 'Seu painel verde';

  @override
  String get addNewPlant => 'Adicionar Nova Planta';

  @override
  String get savePlant => 'Salvar Planta';

  @override
  String failedToSavePlant(String error) {
    return 'Erro ao salvar a planta: $error';
  }

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get plantDetails => 'Detalhes da Planta';

  @override
  String get plantNotFound => 'Planta não encontrada';

  @override
  String get tabCareInfo => '🌿 Info de Cuidados';

  @override
  String get tabSchedule => '📋 Agenda';

  @override
  String get removePlant => 'Remover Planta';

  @override
  String removePlantConfirm(String name) {
    return 'Remover \"$name\" do seu jardim?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Remover';

  @override
  String get undo => 'Desfazer';

  @override
  String get getStarted => 'Começar';

  @override
  String get skip => 'Pular';

  @override
  String get next => 'Próximo';

  @override
  String get myPlants => 'Minhas Plantas';

  @override
  String get plantCare => 'PlantCare';

  @override
  String heroBannerUrgent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plantas precisam',
      one: 'planta precisa',
    );
    return '🔔 $count $_temp0 de atenção';
  }

  @override
  String get heroBannerAllGood => '✅ Todas as plantas estão felizes';

  @override
  String get heroBannerHeading => 'Seu Santuário\nVerde 🌿';

  @override
  String urgentBannerTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'plantas',
      one: 'planta',
    );
    return '$count $_temp0 precisa(m) de cuidados';
  }

  @override
  String get urgentBannerSubtitle => 'Toque em um cartão para agir';

  @override
  String get statTotal => 'Total';

  @override
  String get statHealthy => 'Saudáveis';

  @override
  String get statWater => 'Água';

  @override
  String get statFeed => 'Comida';

  @override
  String get statTotalDesc => 'Sua coleção de plantas';

  @override
  String statTotalDetailHealthy(int count) {
    return '$count plantas saudáveis';
  }

  @override
  String statTotalDetailWater(int count) {
    return '$count precisam de água';
  }

  @override
  String statTotalDetailFood(int count) {
    return '$count precisam de comida';
  }

  @override
  String statHealthyDesc(String p) {
    return '$p% das suas plantas estão prosperando';
  }

  @override
  String get statHealthyDetail => 'Ótimo trabalho! Continue assim!';

  @override
  String statWaterDesc(String p) {
    return '$p% das plantas precisam de água';
  }

  @override
  String get statWaterDetailTap => 'Toque nas plantas para regá-las';

  @override
  String get statWaterDetailConsider => 'Considere regar agora';

  @override
  String statFeedDesc(String p) {
    return '$p% das plantas precisam de fertilizante';
  }

  @override
  String get statFeedDetailWeakened => 'Alimente plantas que estão fracas';

  @override
  String get statFeedDetailFollow =>
      'Siga as instruções de alimentação por planta';

  @override
  String get noPlantsYet => 'Nenhuma Planta Ainda';

  @override
  String get noPlantsDesc =>
      'Adicione sua primeira planta e comece a acompanhar seus cuidados com lembretes diários.';

  @override
  String get noPlantsHint => '🌱 Toque em \"Adicionar Planta\" para começar';

  @override
  String get addPlant => 'Adicionar Planta';

  @override
  String get unknownSpecies => 'Espécie desconhecida';

  @override
  String get healthThriving => 'Prosperando';

  @override
  String get healthNeedsCare => 'Precisa de cuidados';

  @override
  String get healthUrgent => 'Urgente!';

  @override
  String get waterNow => 'Regar Agora';

  @override
  String get waterOk => 'Água ok';

  @override
  String get feedNow => 'Alimentar Agora';

  @override
  String get feedOk => 'Comida ok';

  @override
  String get sectionPlantIdentity => 'Identidade da Planta';

  @override
  String get labelPlantName => 'Nome da Planta';

  @override
  String get hintPlantName => 'ex. Minha Figueira';

  @override
  String get labelSpecies => 'Espécie (Opcional)';

  @override
  String get hintSpecies => 'ex. Monstera Deliciosa';

  @override
  String get validatorEnterName => 'Por favor insira um nome';

  @override
  String get sectionCareSchedule => 'Agenda de Cuidados';

  @override
  String get labelWaterEvery => 'Regar a cada';

  @override
  String get labelFeedEvery => 'Alimentar a cada';

  @override
  String get suffixDays => 'dias';

  @override
  String get suffixWeeks => 'semanas';

  @override
  String get switchToDays => 'Dias';

  @override
  String get switchToWeeks => 'Semanas';

  @override
  String get commonCareTips => 'Dicas de Cuidados';

  @override
  String get tipWater => 'Rega: 2-3 dias para suculentas, 5-7 para tropicais.';

  @override
  String get tipFeed =>
      'Adubo: 7-14 dias durante estação de crescimento, raro no inverno.';

  @override
  String get validatorRequired => 'Obrigatório';

  @override
  String get validatorMustBePositive => 'Deve ser > 0';

  @override
  String get sectionReminders => 'Lembretes';

  @override
  String get labelWateringReminder => 'Lembrete de Rega';

  @override
  String get labelFeedingReminder => 'Lembrete de Adubo';

  @override
  String get remindersDisabled =>
      'Os lembretes estão desativados para esta planta.';

  @override
  String get careCardWatering => 'Rega';

  @override
  String get careCardFeeding => 'Adubo';

  @override
  String get careCardWatered => 'Regada ✓';

  @override
  String get careCardFed => 'Alimentada ✓';

  @override
  String get careCardWaterNow => 'Regar Agora!';

  @override
  String get careCardFeedNow => 'Alimentar Agora!';

  @override
  String lastWatered(String time) {
    return 'Última rega $time';
  }

  @override
  String lastFed(String time) {
    return 'Última alimentação $time';
  }

  @override
  String everyNDays(int n) {
    return 'A cada ${n}d';
  }

  @override
  String everyNWeeks(int n) {
    return 'A cada ${n}s';
  }

  @override
  String scheduleEveryNWeeks(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'semanas',
      one: 'semana',
    );
    return 'A cada $n $_temp0';
  }

  @override
  String get justNow => 'agora mesmo';

  @override
  String hoursAgo(int h) {
    return 'há ${h}h';
  }

  @override
  String daysAgo(int d) {
    return 'há ${d}d';
  }

  @override
  String get careTipsHeading => '💡 Dicas de Cuidados';

  @override
  String get tipSunlight => 'Garanta luz indireta adequada todos os dias.';

  @override
  String get tipTemperature =>
      'Mantenha a temperatura estável — evite correntes frias e calor direto.';

  @override
  String get tipPests =>
      'Verifique pragas regularmente e limpe as folhas para melhor fotossíntese.';

  @override
  String tipWaterInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'dias',
      one: 'dia',
    );
    return 'Regue a cada $n $_temp0 para melhores resultados.';
  }

  @override
  String tipFeedInterval(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'dias',
      one: 'dia',
    );
    return 'Adube a cada $n $_temp0 para mantê-lo forte.';
  }

  @override
  String get scheduleCardIntervals => '🔁 Intervalos de Cuidados';

  @override
  String get scheduleCardReminders => '⏰ Horários de Lembrete';

  @override
  String get scheduleCardUpcoming => '📅 Próximas Datas';

  @override
  String get scheduleWatering => 'Rega';

  @override
  String get scheduleFeeding => 'Adubo';

  @override
  String get scheduleWaterReminder => 'Lembrete de Rega';

  @override
  String get scheduleFeedReminder => 'Lembrete de Adubo';

  @override
  String get scheduleNextWatering => 'Próxima rega';

  @override
  String get scheduleNextFeeding => 'Próximo adubo';

  @override
  String scheduleEveryNDays(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'dias',
      one: 'dia',
    );
    return 'A cada $n $_temp0';
  }

  @override
  String get overdue => 'Atrasado!';

  @override
  String get healthThriving2 => 'Prosperando 🌟';

  @override
  String get healthNeedsCare2 => 'Precisa de Cuidados';

  @override
  String get healthUrgent2 => 'Urgente! 🚨';

  @override
  String get remindersOn => '🔔 Lembretes ativados';

  @override
  String get remindersOff => '🔕 Desativados';

  @override
  String get actionWatered => 'Regada!';

  @override
  String get actionFed => 'Alimentada!';

  @override
  String snackWatered(String name) {
    return '💧 $name foi regada!';
  }

  @override
  String snackFed(String name) {
    return '🌿 $name foi alimentada!';
  }

  @override
  String get pushReminders => 'Lembretes Push';

  @override
  String get notificationsActive => 'Notificações diárias ativas';

  @override
  String get tapToEnableNotifications => 'Toque para ativar notificações';

  @override
  String snackRemindersOn(String name) {
    return '🔔 Lembretes ATIVADOS para $name';
  }

  @override
  String snackRemindersOff(String name) {
    return '🔕 Lembretes DESATIVADOS para $name';
  }

  @override
  String get editCareSchedule => 'Editar Agenda de Cuidados';

  @override
  String get labelWateringInterval => 'Intervalo de Rega (Dias)';

  @override
  String get labelFeedingInterval => 'Intervalo de Adubo (Dias)';

  @override
  String get labelWateringTime => 'Horário de Rega';

  @override
  String get labelFeedingTime => 'Horário de Adubo';

  @override
  String get saveChanges => 'Salvar Alterações';

  @override
  String get notifDialogTitle => 'Fique por dentro\ndos cuidados! 🌿';

  @override
  String get notifDialogBody =>
      'Ative as notificações para lembrar quando suas plantas precisam de água ou adubo.';

  @override
  String get allowNotifications => 'Permitir Notificações';

  @override
  String get maybeLater => 'Talvez Depois';

  @override
  String get pillWater => 'Água';

  @override
  String get pillFeed => 'Comida';

  @override
  String get pillLight => 'Luz';

  @override
  String get onboardingWelcomeTitle => 'Cultive Sua\nSelva Urbana';

  @override
  String get onboardingWelcomeBody =>
      'Uma abordagem moderna para manter suas plantas vivas e prosperando.';

  @override
  String get onboardingInfoTitle1 => 'Nunca Perca uma Rega';

  @override
  String get onboardingInfoBody1 =>
      'Defina lembretes personalizados para rega, adubo e replantio. Suas plantas agradecerão.';

  @override
  String get onboardingInfoTitle2 => 'Privacidade de Dados';

  @override
  String get onboardingInfoBody2 =>
      'Seus dados permanecem no seu dispositivo.\nO acompanhamento de alto desempenho permite que você aproveite ao máximo sua planta.';

  @override
  String get onboardingStartBody =>
      'Aproveite os benefícios de uma abordagem moderna para manter suas plantas vivas e prósperas com o Plant Care.';

  @override
  String get onboardingStartCta => 'Pronto para começar sua jornada?';

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
    return '$name precisa de água agora.';
  }

  @override
  String notifFeedBody(String name) {
    return '$name está pronto para adubo.';
  }

  @override
  String get notifActionMarkDone => 'Marcar Concluído';

  @override
  String get tourSettingsTitle => 'Configurações ⚙️';

  @override
  String get tourSettingsDesc =>
      'Toque aqui para abrir Configurações e personalizar tema, idioma e mais.';

  @override
  String get tourBannerTitle => 'Seu Santuário Verde 🌿';

  @override
  String get tourBannerDesc =>
      'Uma visão geral rápida do estado atual do seu jardim.';

  @override
  String get tourStatsTitle => 'Estatísticas ao Vivo 📊';

  @override
  String get tourStatsDesc =>
      'Acompanhe seu total de plantas, quantidade saudável e próximas necessidades de rega e adubo.';

  @override
  String get tourSectionTitle => 'Minhas Plantas 🪴';

  @override
  String get tourSectionDesc =>
      'Navegue pela lista completa de todas as suas plantas registradas aqui.';

  @override
  String get tourEmptyTitle => 'Jardim Vazio 🌱';

  @override
  String get tourEmptyDesc =>
      'Nenhuma planta ainda! Adicione sua primeira planta para começar sua agenda de cuidados.';

  @override
  String get tourFabTitle => 'Adicionar uma Planta ✨';

  @override
  String get tourFabDesc =>
      'Toque aqui para registrar uma nova planta e configurar seus lembretes.';

  @override
  String get settings => 'Configurações';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get privacyPolicyLastUpdated => 'Última atualização: maio 2026';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsVersion => 'Versão 1.1.0';

  @override
  String get settingsWidget => 'Widget da Tela Inicial';

  @override
  String get settingsWidgetDesc =>
      'Crie um widget na tela inicial para ver suas estatísticas de relance';

  @override
  String get createWidget => 'Criar Widget';

  @override
  String get widgetCreatedSuccess => 'Widget criado com sucesso! 🎉';

  @override
  String get darkMode => 'Modo Escuro';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get privacySection1Title => '1. Informações que Coletamos';

  @override
  String get privacySection1Body =>
      'O Plant Care não coleta, armazena ou transmite nenhum dado pessoal para servidores externos. Todas as informações que você fornece — incluindo nomes de plantas, espécies, agendas de cuidados e preferências de lembretes — são armazenadas exclusivamente no seu dispositivo usando armazenamento local (Hive).\n\nNão utilizamos SDKs de análise, ferramentas de relatório de falhas ou qualquer serviço de terceiros que colete informações pessoais identificáveis.';

  @override
  String get privacySection2Title => '2. Notificações';

  @override
  String get privacySection2Body =>
      'Se você conceder permissão, o Plant Care usa notificações push locais para lembrá-lo sobre horários de rega e adubo. Nenhum dado de notificação é enviado para servidores externos. Todo o agendamento de notificações acontece inteiramente no seu dispositivo.\n\nVocê pode revogar a permissão de notificação a qualquer momento através das configurações do dispositivo ou dentro do aplicativo.';

  @override
  String get privacySection3Title => '3. Armazenamento e Segurança de Dados';

  @override
  String get privacySection3Body =>
      'Seus dados são armazenados localmente usando Hive, um banco de dados local leve e criptografado. Como nenhum dado sai do seu dispositivo, não há risco de violação de dados da nossa parte.\n\nSe você desinstalar o aplicativo, todos os dados armazenados são permanentemente excluídos.';

  @override
  String get privacySection4Title => '4. Serviços de Terceiros';

  @override
  String get privacySection4Body =>
      'Este aplicativo não integra serviços de análise, publicidade ou rastreamento de terceiros. O aplicativo utiliza os seguintes pacotes exclusivamente para funcionalidade local:\n  • Hive — banco de dados local\n  • Awesome Notifications — agendamento local de notificações\n  • Provider — gerenciamento de estado no aplicativo\n\nNenhum desses pacotes transmite seus dados externamente.';

  @override
  String get privacySection5Title => '5. Privacidade de Menores';

  @override
  String get privacySection5Body =>
      'O Plant Care é seguro para todas as idades. Não coletamos informações pessoais de ninguém, incluindo crianças menores de 13 anos. Todos os dados permanecem no dispositivo do usuário.';

  @override
  String get privacySection6Title => '6. Alterações nesta Política';

  @override
  String get privacySection6Body =>
      'Podemos atualizar esta política de privacidade de tempos em tempos. Quaisquer alterações serão refletidas no aplicativo. O uso continuado do aplicativo após as alterações constitui aceitação da política atualizada.';

  @override
  String get privacySection7Title => '7. Contato';

  @override
  String get privacySection7Body =>
      'Se você tiver alguma dúvida sobre esta política de privacidade, entre em contato conosco:\nmahamadbarznji712@gmail.com';
}
