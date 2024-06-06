import 'dart:developer';

import 'package:espressoblochive/src/core/resources/common.dart';
import 'package:espressoblochive/src/core/resources/route_manager.dart';
import 'package:espressoblochive/src/core/web_services/api_result.dart';
import 'package:espressoblochive/src/core/web_services/network_exceptions.dart';
import 'package:espressoblochive/src/core/web_services/web_services.dart';
import 'package:espressoblochive/src/features/home/data/data_source/local/home_db_provider.dart';

class HomeRepository {
  final WebServices _webServices;
  final HomeDataBaseProvider _dbProvider;

  HomeRepository(
      {required WebServices webServices,
      required HomeDataBaseProvider dbProvider})
      : _webServices = webServices,
        _dbProvider = dbProvider;

  Future<ApiResult<dynamic>> fetchProducts() async {
    bool isConnected =
        await RouteGenerator.connectivity.checkInternetConnection();

    final bool isDataBaseIsEmpty = await _dbProvider.isProductsDataAvailable();

    if (isConnected) {
      try {
        var response = await _webServices.getProducts();

        //Success - Connection is okay
        if (response.success == true && response.products.isNotEmpty) {
          _dbProvider.insertProducts(post: response);
          log("insert Products done");
          final cachedProducts = await _dbProvider.getProducts();
          log("${cachedProducts?.message}");

          return ApiResult.success(cachedProducts);
        }

        //failure(Unknown Error) - Connection is okay
        else {
          log("1");
          return await cachedDataInDB(
              isDataBaseIsEmpty, "UnKnown Error Happened!");
        }
      } catch (error, stackTrace) {
        return ApiResult.failure(
            DioExceptionTypes.getDioException(error, stackTrace));
      }
    }

    //user internet connection is not safe - no internet connection
    else {
      log("2");
      return await cachedDataInDB(
        isDataBaseIsEmpty,
        "No Internet Connection!",
      );
    }
  }

  Future<ApiResult<dynamic>> cachedDataInDB(
      bool isDataBaseIsEmpty, String errorMessage) async {
    ///We have Cached data in DB
    if (!isDataBaseIsEmpty) {
      logger.e("Load [Products] from Local DataBase");
      final localSourceResponse = await _dbProvider.getProducts();
      return ApiResult.success(localSourceResponse);
    }

    ///There is No Data Cached!
    ///Failed
    else {
      return ApiResult.failureMsg(errorMessage);
    }
  }
}
