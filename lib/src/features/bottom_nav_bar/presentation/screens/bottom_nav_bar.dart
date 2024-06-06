import 'package:espressoblochive/src/core/resources/font_manager.dart';
import 'package:espressoblochive/src/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:espressoblochive/src/core/resources/route_manager.dart';

import 'package:espressoblochive/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:espressoblochive/src/features/bottom_nav_bar/presentation/widgets/nav_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return _buildNavBloc();
  }

  Widget _buildNavBloc() {
    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        state.mapOrNull(
          currentIndex: (state) =>
              RouteGenerator.navBarCubit.setCurrentIndex = state.index,
        );
      },
      builder: (context, state) => _buildBody(
        currentIndex: RouteGenerator.navBarCubit.getCurrentIndex,
        onPopInvoked: (didPop) => RouteGenerator.navBarCubit.onPopInvoked(),
        onTap: (index) => RouteGenerator.navBarCubit.onTap(index),
      ),
    );
  }

  _appBar(context) {
    return AppBar(
      // systemOverlayStyle: Platform.isIOS
      //     ? const SystemUiOverlayStyle(
      //         systemNavigationBarColor: ColorManager.richBlack)
      //     : null,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          const Text(
            "Hello, Ahmed!",
          ),
          Text(
            "hsino105@gmail.com",
            style: StyleManager.getRegularStyle(
              fontSize: FontSize.s13,
            ),
          ),
        ],
      ),
      centerTitle: true,
      // titleTextStyle: Theme.of(context).textTheme.displayMedium,

      actions: const [],
    );
  }

  Widget _buildBody({
    void Function(bool)? onPopInvoked,
    required int currentIndex,
    void Function(int)? onTap,
  }) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: _appBar(context),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: kBottomNavigationBarHeight.h + 25.h,
                ),
                child: RouteGenerator.navBarPages[currentIndex],
              ),
              NavBarWidget(
                currentIndex: currentIndex,
                onTap: onTap,
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    RouteGenerator.navBarCubit.restart();
    super.dispose();
  }
}
