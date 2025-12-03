import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:xshop/features/product_list/domain/models/product_list_model.dart';
import 'package:xshop/features/product_list/domain/repository/product_list_abstract_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadHomeProducts>(_loadHome);
  }
  ProductListAbstractRepository repository;

  Future<void> _loadHome(
    LoadHomeProducts event,
    Emitter<HomeState> emit,
  ) async {
    try {
      bool homeLoading = true;
      if (state is! HomeLoaded && homeLoading) {
        emit(HomeLoading());
        debugPrint("HOME_BLOC_HOMELOADING");
        homeLoading = false;
      }
      final randomProducts =
          await repository.fetchRandomProducts() as List<ProductListModel>;
      debugPrint("EMITEDHOMELOADED");
      emit(HomeLoaded(randomProducts));
    } catch (e, st) {
      emit(HomeLoadingFailure(e, st));
    }
  }
}
