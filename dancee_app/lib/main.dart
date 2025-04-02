import 'package:dancee_app/features/app/app_module.dart';
import 'package:dancee_app/features/events/event_module.dart';
import 'package:dancee_app/i18n/translations.g.dart';
import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vader_app/vader_app.dart';

import 'features/app/pages/initial_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logger.setObserver(CrashlyticsLoggerObserver());

  runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      modules: [AppModule(), EventModule()],
      theme: DanceeTheme(),
      isDebug: false,
      entrypoint: InitialRoute().location,
      localization: Localization(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        delegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}

class CrashlyticsLoggerObserver extends LoggerObserver {
  const CrashlyticsLoggerObserver();

  @override
  void onError(err) {
    //FirebaseCrashlytics.instance.recordError(err.error, err.stackTrace, reason: err.message);
  }

  @override
  void onException(err) {
    //FirebaseCrashlytics.instance.recordError(err.exception, err.stackTrace, reason: err.message);
  }
}
