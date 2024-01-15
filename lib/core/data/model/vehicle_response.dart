import 'package:think_hat_test/core/data/model/user.dart';

class VehicleResponse {
  final String responseMessage;
  final String responseCode;
  final List<Vehicle> vehicles;

  const VehicleResponse({
    required this.responseMessage,
    required this.responseCode,
    required this.vehicles,
  });

  factory VehicleResponse.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return const VehicleResponse(
        responseMessage: "nothing to show",
        responseCode: "200",
        vehicles: [],
      );
    }
    return VehicleResponse(
      responseMessage: json['responseMessage'],
      responseCode: json['responseCode'],
      vehicles:
          json['vehicles'].map<Vehicle>((e) => Vehicle.fromJson(e)).toList(),
    );
  }
}

class Vehicle {
  final String id;
  final String name;
  final String image;

  Vehicle({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class ShippingDetails {
  final String name;
  final String address;
  final String? zipCode;
  final String status;
  final String deliveryDate;

  ShippingDetails({
    required this.name,
    required this.address,
    required this.zipCode,
    required this.status,
    required this.deliveryDate,
  });

  factory ShippingDetails.fromJson(Map<String, dynamic> json) {
    return ShippingDetails(
      name: json['name'],
      address: json['address'],
      zipCode: json['zipCode'],
      status: json['status'],
      deliveryDate: json['deliveryDate'],
    );
  }
}
