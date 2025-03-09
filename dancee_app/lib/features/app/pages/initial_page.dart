import 'package:dancee_app/features/app/app_module.dart';
import 'package:dancee_app/features/events/event_module.dart';
import 'package:dancee_app/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: FlutterLogo(size: 80),
      loadingIndicator: Container(
        width: 84,
        height: 84,
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
      onFinish: () {
        LocaleSettings.setLocale(AppLocale.cs);
        context.go(EventRoutes.eventList.path);
      },
    );
  }
}
