import 'package:espressoblochive/src/app/app.dart';
import 'package:espressoblochive/src/core/resources/bloc_observer.dart';
import 'package:espressoblochive/src/core/resources/injection.dart';
import 'package:espressoblochive/src/core/resources/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  Future.wait([
    initGetIt(),
    ScreenUtil.ensureScreenSize(),
    CacheHelper.init(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ])
  ]).then((_) {
    Bloc.observer = AppObserver();

    runApp(MyApp(target: "production"));
  });
}
