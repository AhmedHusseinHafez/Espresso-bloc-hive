import 'package:espressoblochive/src/core/resources/common.dart';
import 'package:espressoblochive/src/core/resources/constants.dart';
import 'package:espressoblochive/src/core/web_services/interface_repos.dart';
import 'package:espressoblochive/src/features/home/data/models/products_model.dart';
import 'package:hive/hive.dart';

class HomeDBService implements InterfaceRepository<ProductsModel> {
  ///boxkey
  static const String _key = AppConstants.dbProducts;

  ///products box
  late final Box<ProductsModel> _productsBox;

  Future<void> initDataBase() async {
    try {
      Hive.registerAdapter(ProductsModelAdapter());
      Hive.registerAdapter(ProductAdapter());
      _productsBox = await Hive.openBox(_key);
      logger.d('Success on initializing database For *ProductsModel*');
    } catch (e) {
      // Handle initialization errors
      logger.e('Error initializing database For *ProductModel*');
    }
  }

  @override
  Future<ProductsModel?> getAll() async {
    try {
      if (_productsBox.isOpen && _productsBox.isNotEmpty) {
        return _productsBox.get(_key);
      } else {
        return null;
      }
    } catch (e) {
      // Handle read errors
      logger.e('Error reading from database: $e');
    }

    return null;
  }

  @override
  Future<void> insertItem({required ProductsModel object}) async {
    try {
      await _productsBox.put(_key, object);
    } catch (e) {
      // Handle insertion errors
      logger.e('Error inserting into database: $e');
    }
  }

  @override
  Future<bool> isDataAvailable() async {
    try {
      return _productsBox.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      logger.e('Error checking if box is empty: $e');
      return true; // Return true assuming it's empty on error
    }
  }
}
