import 'package:espressoblochive/src/features/bottom_nav_bar/presentation/widgets/nav_bar_custom_paint.dart';
import 'package:espressoblochive/src/features/bottom_nav_bar/presentation/widgets/polygon_custom_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:espressoblochive/src/features/bottom_nav_bar/constants/nav_bar_constants.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required int currentIndex,
    void Function(int)? onTap,
  })  : _onTap = onTap,
        _currentIndex = currentIndex;

  final int _currentIndex;
  final ValueChanged<int>? _onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _iconTopNavBar(),
                _navBar(onTap: _onTap),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _navBar({required void Function(int)? onTap}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _navBarPainter(),
        Row(
          children: List.generate(
            4,
            (index) => _icon(
              isSelected: _currentIndex == index,
              index: index,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }

  Widget _icon(
      {required int index,
      required bool isSelected,
      required void Function(int)? onTap}) {
    return Container(
      width: 44.w,
      height: 44.h,
      margin: EdgeInsetsDirectional.only(
        start: _iconPaddindCon(index: index),
        end: index == 3 ? 30.w : 0,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: () => onTap?.call(index),
        borderRadius: BorderRadius.circular(22.r),
        child: Center(
          child: SvgPicture.asset(
            isSelected
                ? navBarItems[index].selectedAsset
                : navBarItems[index].unselectedAsset,
          ),
        ),
      ),
    );
  }

  _iconPaddindCon({required int index}) {
    switch (index) {
      case 0:
        return 30.w;
      case 1:
        return 41.w;
      case 2:
        return 65.w;
      case 3:
        return 33.w;
    }
  }

  Widget _navBarPainter() {
    return CustomPaint(
      size: Size(
        350.w,
        75.h,
      ),
      painter: NavBarCustomPainter(
        color: const Color(0xff546A83),
      ),
    );
  }

  Widget _iconTopNavBar() {
    return CustomPaint(
      size: Size(
        130.w,
        150.h,
      ),
      painter: PolygonCustomPainter(
        color: Colors.white,
      ),
    );
  }
}
