import 'package:espressoblochive/generated/l10n.dart';
import 'package:espressoblochive/src/core/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.target});
  // MyApp._internal();

  // static final MyApp _instance = MyApp._internal(); // single instance

  // factory MyApp() => _instance; // factory to get single instance
  final String target;
  final RouteGenerator routeGenerator = RouteGenerator();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, state) {
        return MaterialApp(
          title: 'Espresso Bloc Hive $target',
          navigatorKey: navigatorKey,
          locale: const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: target == "production" ? false : true,
          onGenerateRoute: routeGenerator.getRoute,
          theme: AppTheme.kLightTheme,
          themeMode: ThemeMode.system,
          initialRoute: Routes.navigationViewRoute,
        );
      },
    );
  }
}
