import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:xshop/domain/models/product_list_model.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';
import 'package:xshop/domain/usecase/product_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadHomeProducts>(_loadHome);
  }
  ProductAbstractRepository repository;

  Future<void> _loadHome(
    LoadHomeProducts event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is! HomeLoaded) {
        emit(HomeLoading());
        debugPrint("HOME_BLOC_HOMELOADING");
      }
      final randomProducts = await FetchRandomProductsUseCase(
        productRepository: repository,
      ).call();
      debugPrint("EMITEDHOMELOADED");
      emit(HomeLoaded(randomProducts));
    } catch (e, st) {
      emit(HomeLoadingFailure(e, st));
    }
  }
}
