import 'package:flutter/material.dart';
import 'package:flutter_web/app_config.dart';
import 'package:flutter_web/company/company_page.dart';
import 'package:flutter_web/dashboard/dashboard_page.dart';
import 'package:flutter_web/login/login_page.dart';
import 'package:flutter_web/pages/gallery_page.dart';
import 'package:flutter_web/pages/home_page.dart';
import 'package:flutter_web/pages/settings_page.dart';
import 'package:flutter_web/pages/slideshow_page.dart';
import 'package:flutter_web/widgets/app_route_observer.dart';

import 'constants/route_names.dart';

void main() {
  var configuredApp = AppConfig(
    apiBaseUrl: 'https://api.example.com/',
    signInUrl: 'token/generate',
    child: SalaryApp(),
  );

  runApp(configuredApp);
}

class SalaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive app with navigation drawer',
      theme: ThemeData(
        primaryColor: Colors.grey[600],
        pageTransitionsTheme: PageTransitionsTheme(
          // makes all platforms that can run Flutter apps display routes without any animation
          builders: Map<TargetPlatform,
              _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        ),
      ),
      initialRoute: RouteNames.login,
      navigatorObservers: [AppRouteObserver()],
      routes: {
        RouteNames.login: (_) => LoginPage(),
        RouteNames.dashboard: (_) => DashBoardPage(),
        RouteNames.companyPanel: (_) => CompanyPage(),
        RouteNames.home: (_) => const HomePage(),
        RouteNames.gallery: (_) => const GalleryPage(),
        RouteNames.slideshow: (_) => const SlideshowPage(),
        RouteNames.settings: (_) => const SettingsPage()
      },
    );
  }
}

/// This class is used to build page transitions that don't have any animation
class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}