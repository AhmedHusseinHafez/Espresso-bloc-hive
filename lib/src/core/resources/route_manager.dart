import 'package:espressoblochive/src/core/resources/injection.dart';
import 'package:espressoblochive/src/core/resources/strings_manager.dart';
import 'package:espressoblochive/src/core/web_services/connection_helper.dart';
import 'package:espressoblochive/src/features/bottom_nav_bar/constants/nav_bar_constants.dart';
import 'package:espressoblochive/src/features/bottom_nav_bar/presentation/screens/bottom_nav_bar.dart';
import 'package:espressoblochive/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:espressoblochive/src/features/home/business_logic/cubit/home_logic_cubit.dart';
import 'package:espressoblochive/src/features/home/presentation/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String navigationViewRoute = '/navigationViewRoute';
}

class RouteGenerator {
  static late InternetConnectionHelper connectivity;
  static late NavBarCubit navBarCubit;
  static late HomeLogicCubit homeCubit;

  RouteGenerator() {
    connectivity = getIt<InternetConnectionHelper>();
    navBarCubit = getIt<NavBarCubit>();
    homeCubit = getIt<HomeLogicCubit>();
  }
  static List<Widget> navBarPages = [
    BlocProvider.value(
      value: RouteGenerator.homeCubit,
      child: const HomeScreen(),
    ),
    const PlaceHolder(title: "2"),
    const PlaceHolder(title: "3"),
    const PlaceHolder(title: "4"),
  ];

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.navigationViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: navBarCubit,
            child: const BottomNav(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text('${StringsManager.noRouteFound} ${settings.name}'),
          )),
        );
    }
  }
}
