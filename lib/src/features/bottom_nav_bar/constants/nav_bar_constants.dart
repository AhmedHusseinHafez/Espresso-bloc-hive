import 'package:espressoblochive/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class PlaceHolder extends StatefulWidget {
  const PlaceHolder({
    super.key,
    this.title,
  });
  final String? title;
  @override
  State<PlaceHolder> createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.title!),
      ),
    );
  }
}

class MenuItemModel {
  final String selectedAsset;
  final String unselectedAsset;
  final int index;

  MenuItemModel({
    required this.selectedAsset,
    required this.unselectedAsset,
    required this.index,
  });
}

final List<MenuItemModel> navBarItems = [
  MenuItemModel(
    selectedAsset: AssetsManager.selectedhomeic,
    unselectedAsset: AssetsManager.unselectedhomeic,
    index: 0,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.selectedsearchic,
    unselectedAsset: AssetsManager.unselectedsearchic,
    index: 1,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.selectedlocationic,
    unselectedAsset: AssetsManager.unselectedlocationic,
    index: 2,
  ),
  MenuItemModel(
    selectedAsset: AssetsManager.selectedprofileic,
    unselectedAsset: AssetsManager.unselectedprofileic,
    index: 3,
  ),
];
