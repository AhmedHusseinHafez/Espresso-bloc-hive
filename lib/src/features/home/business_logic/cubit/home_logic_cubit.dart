import 'package:bloc/bloc.dart';
import 'package:espressoblochive/src/features/home/data/models/products_model.dart';
import 'package:espressoblochive/src/features/home/repository/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_logic_state.dart';
part 'home_logic_cubit.freezed.dart';

class HomeLogicCubit extends Cubit<HomeLogicState> {
  HomeLogicCubit(this._repo) : super(const HomeLogicState.initial());

  final HomeRepository _repo;

  void fetchProducts() async {
    emit(const HomeLogicState.loading());
    final result = await _repo.fetchProducts();

    result.when(
      success: (data) {
        emit(HomeLogicState.fetch(data as ProductsModel));
      },
      failure: (error) {
        emit(HomeLogicState.error(error.toString()));
      },
      failureMsg: (error) {
        emit(HomeLogicState.error(error.toString()));
      },
    );
  }
}
