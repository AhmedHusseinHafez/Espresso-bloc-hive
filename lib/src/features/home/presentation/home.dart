import 'package:espressoblochive/src/core/resources/route_manager.dart';
import 'package:espressoblochive/src/core/resources/utils.dart';
import 'package:espressoblochive/src/core/utils/custom_loading_widget.dart';
import 'package:espressoblochive/src/features/home/business_logic/cubit/home_logic_cubit.dart';
import 'package:espressoblochive/src/features/home/data/models/products_model.dart';
import 'package:espressoblochive/src/features/home/presentation/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsModel? model;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    RouteGenerator.homeCubit.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBloc(),
    );
  }

  Widget _bodyBloc() {
    return BlocConsumer<HomeLogicCubit, HomeLogicState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.mapOrNull(
          fetch: (state) async {
            model = state.model;

            bool isConnected =
                await RouteGenerator.connectivity.checkInternetConnection();
            String msg =
                isConnected ? "From Server Source" : "From Local Source";

            showSuccessToast("${model!.message} $msg", context);
          },
          error: (state) {
            errorMessage = state.error;
          },
        );
      },
      builder: (context, state) {
        if (state == const HomeLogicState.loading()) {
          return Center(child: CustomLoading.showWithStyle(context));
        } else if (state == const HomeLogicState.initial()) {
          return const SizedBox();
        } else if (errorMessage != null) {
          return Center(
            child: Text(errorMessage!),
          );
        } else {
          return _body(model!);
        }
      },
    );
  }

  Widget _body(ProductsModel model) {
    return RefreshIndicator(
      onRefresh: () async {
        RouteGenerator.homeCubit.fetchProducts();
      },
      child: ListView.separated(
        itemBuilder: (context, index) =>
            ListTileWidget(product: model.products[index]),
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
        ),
        separatorBuilder: (context, index) => 10.verticalSpace,
        itemCount: model.products.length,
      ),
    );
  }
}
