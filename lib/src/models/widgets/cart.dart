import 'package:ecommerce/src/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart();

  @override
  List<Object?> get props => [];

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

  static List<Product> products = [
    const Product(
      // id: '1',
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      picture:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      // id: '2',
      name: 'Soft Drink #2',
      category: 'Soft Drinks',
      picture:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      // id: '3',
      name: 'Soft Drink #3',
      category: 'Soft Drinks',
      picture:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      // id: '4',
      name: 'Smoothies #1',
      category: 'Smoothies',
      picture:
          'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      // id: '5',
      name: 'Smoothies #2',
      category: 'Smoothies',
      picture:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    const Product(
      // id: '6',
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      picture:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
  ];
}
