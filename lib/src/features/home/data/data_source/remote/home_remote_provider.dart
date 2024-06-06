// import 'package:espressoblochive/src/core/web_services/api_result.dart';
// import 'package:espressoblochive/src/core/web_services/network_exceptions.dart';
// import 'package:espressoblochive/src/core/web_services/web_services.dart';
// import 'package:espressoblochive/src/features/home/data/models/products_model.dart';

// class HomeRemoteProvider {
//   final WebServices _webServices;

//   HomeRemoteProvider({required WebServices webServices})
//       : _webServices = webServices;

//   Future<ApiResult<ProductsModel>> getProducts() async {
//     try {
//       var response = await _webServices.getProducts();
//       return ApiResult.success(response);
//     } catch (error, stackTrace) {
//       return ApiResult.failure(
//           DioExceptionTypes.getDioException(error, stackTrace));
//     }
//   }
// }
