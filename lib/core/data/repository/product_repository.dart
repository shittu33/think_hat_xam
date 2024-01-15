import 'dart:developer';

import 'package:think_hat_test/core/data/datasource/product_datasource.dart';
import 'package:think_hat_test/core/data/model/vehicle_response.dart';

class ProductRepository {
  final LocalProductDataSource localDataSource;
  final ApiProductDataSource apiDataSource;

  ProductRepository({
    required this.localDataSource,
    required this.apiDataSource,
  });

  Future<VehicleResponse?> getVehicles() async {
    try {
      var localProducts = await localDataSource.getVehicles();
      final apiProducts = await apiDataSource.getVehicles();
      return localProducts.vehicles.isEmpty ? apiProducts : localProducts;
      // return apiProducts;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
