part of 'home_logic_cubit.dart';

@freezed
class HomeLogicState with _$HomeLogicState {
  const factory HomeLogicState.initial() = _Initial;
  const factory HomeLogicState.loading() = _Loading;
  const factory HomeLogicState.fetch(ProductsModel model) = _Fetch;
  const factory HomeLogicState.error(String error) = _Error;
}
