part of 'wish_list_bloc.dart';

abstract class WishListEvent extends Equatable {
  const WishListEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishListEvent {}

class AddProductToWishList extends WishListEvent {
  final Product product;

  const AddProductToWishList({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishList extends WishListEvent {
  final Product product;

  const RemoveProductFromWishList({required this.product});

  @override
  List<Object> get props => [product];
}
