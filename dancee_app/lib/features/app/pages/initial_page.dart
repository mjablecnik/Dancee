import 'package:dancee_app/features/events/pages/event_list_page.dart';
import 'package:dancee_app/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:vader_app/vader_app.dart';

part 'initial_page.g.dart';

@TypedGoRoute<InitialRoute>(path: '/app/initial')
class InitialRoute extends GoRouteData {
  const InitialRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const InitialPage();
}

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
        EventListRoute().go(context);
      },
    );
  }
}
