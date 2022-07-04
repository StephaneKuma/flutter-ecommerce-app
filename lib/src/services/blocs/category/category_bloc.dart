import 'dart:async';

import 'package:ecommerce/src/models/category.dart';
import 'package:ecommerce/src/services/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository;
  StreamSubscription<List<Category>?>? _streamSubscription;

  CategoryBloc({required CategoryRepository repository})
      : _repository = repository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) {
    _streamSubscription?.cancel();
    _streamSubscription = _repository.listenToEntities().listen(
          (categories) => add(UpdateCategories(categories: categories!)),
        );
  }

  void _onUpdateCategories(
      UpdateCategories event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
