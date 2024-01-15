import 'package:think_hat_test/core/data/model/vehicle_response.dart';

class User{
  final String id;
  final String name;
  final List<String> messages;

  User({
    required this.id,
    required this.name,
    required this.messages,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    messages: (json['messages'] as List).map((e) => e.toString()).toList(),
  );
}

class CartItem{
  final Vehicle? product;
  final int quantity;

  CartItem({
     this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    product: Vehicle.fromJson(json['product']),
    quantity: json['quantity'],
  );
}