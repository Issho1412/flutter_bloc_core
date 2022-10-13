import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/data/models/meme/meme.dart';
import 'package:src_core_bloc/features/home/home_event.dart';
import '../../../core/base/base_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  int currentTabIndex = 0;
  late TabController tabController;
  List<MemeModel> lstMeme = [];

  HomeBloc() : super(const InitialState()) {
    on<OnSetTabIndex>((event, emit) {
      emit(DataLoadingState());
      _setIndex(event.index);
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('HomeBloc init');
  }

  void _setIndex(int index) {
    currentTabIndex = index;
    tabController.index = index;
  }
}
