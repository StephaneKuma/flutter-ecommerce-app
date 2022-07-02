import 'package:ecommerce/src/models/product.dart';
import 'package:ecommerce/src/models/widgets/wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListLoading()) {
    on<StartWishList>(_onStartWishList);
    on<AddProductToWishList>(_onAddProductToWishList);
    on<RemoveProductFromWishList>(_onRemoveProductFromWishList);
  }

  Future<void> _onStartWishList(
    StartWishList event,
    Emitter<WishListState> emit,
  ) async {
    emit(WishListLoading());

    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const WishListLoaded());
    } catch (_) {
      emit(WishListError());
    }
  }

  void _onAddProductToWishList(
    AddProductToWishList event,
    Emitter<WishListState> emit,
  ) async {
    if (state is WishListLoaded) {
      try {
        emit(
          WishListLoaded(
            wishList: WishList(
              products: List.from((state as WishListLoaded).wishList.products)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishListError());
      }
    }
  }

  void _onRemoveProductFromWishList(
    RemoveProductFromWishList event,
    Emitter<WishListState> emit,
  ) async {
    if (state is WishListLoaded) {
      try {
        emit(
          WishListLoaded(
            wishList: WishList(
              products: List.from((state as WishListLoaded).wishList.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishListError());
      }
    }
  }
}
