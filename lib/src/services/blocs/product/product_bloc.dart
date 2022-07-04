import 'dart:async';

import 'package:ecommerce/src/models/product.dart';
import 'package:ecommerce/src/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  StreamSubscription<List<Product>?>? _streamSubscription;

  ProductBloc({required ProductRepository repository})
      : _repository = repository,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) {
    _streamSubscription?.cancel();
    _streamSubscription = _repository.listenToEntities().listen(
          (products) => add(
            UpdateProducts(products: products!),
          ),
        );
  }

  void _onUpdateProducts(
    UpdateProducts event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoaded(products: event.products));
  }
}
