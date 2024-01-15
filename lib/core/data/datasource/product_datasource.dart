import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/data/model/vehicle_response.dart';

abstract class ProductDataSource {
  Future<VehicleResponse> getVehicles();
}

class LocalProductDataSource implements ProductDataSource {
  LocalProductDataSource();

  @override
  Future<VehicleResponse> getVehicles() async {
    return VehicleResponse.fromJson({});
  }
}

class ApiProductDataSource implements ProductDataSource {

  ApiProductDataSource();

  @override
  Future<VehicleResponse> getVehicles() async {
    await Future.delayed(const Duration(seconds: 1));
    return VehicleResponse.fromJson(generateMockProductJson());
  }
}

///generate a json vehicle data that can be fed to VehicleResponse
///to create a mock vehicle response
Map<String, dynamic> generateMockProductJson() {
  return {
    "responseMessage": "success",
    "responseCode": "200",
    "vehicles": randomVehicles.asMap().entries.map(
          (e) => {
            "id": "00${e.key + 1}",
            "name": "New Bicycle",
            "image": e.value,
          },
        )
  };
}

const randomVehicles = [
  bicycleImg,
  bicycleImg,
  bicycleImg,
  bicycleImg,
  bicycleImg,
  bicycleImg,
];
