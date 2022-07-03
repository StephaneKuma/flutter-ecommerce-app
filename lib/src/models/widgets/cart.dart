import 'package:ecommerce/src/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product> products;

  @override
  List<Object?> get props => [products];

  Map<Product, int> productQuantity(List<Product> products) {
    var quantity = <Product, int>{};

    for (var product in products) {
      int qty = quantity[product]!;

      if (!quantity.containsKey(product)) {
        qty = 1;
      } else {
        qty += 1;
      }

      quantity[product] = qty;
    }

    return quantity;
  }

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(double subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(double subTotal, double deliveryFee) {
    return subTotal + deliveryFee;
  }

  String freeDelivery(double subTotal) {
    if (subTotal >= 30.0) {
      return "You have Free Delivery";
    } else {
      double missing = 30.0 - subTotal;

      return "Add \$${missing.toStringAsFixed(2)} for Free Delivery";
    }
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String get totalString =>
      total(subTotal, deliveryFee(subTotal)).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subTotal);
}
