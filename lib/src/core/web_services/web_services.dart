import 'package:dio/dio.dart' hide Headers;
import 'package:espressoblochive/src/core/resources/constants.dart';
import 'package:espressoblochive/src/features/home/data/models/products_model.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET(AppConstants.getProducts)
  Future<ProductsModel> getProducts();
}
