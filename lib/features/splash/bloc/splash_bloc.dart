import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:src_core_bloc/core/base/base_state.dart';

class SplashBloc extends Bloc<BaseEvent, BaseState> {
  int currentPage = 0;
  SplashBloc() : super(const InitialState()) {
    on<UpdateDataEvent>((event, emit) async {
      emit(DataLoadingState());
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('SplashBloc init');
  }

  void updatePageIndex(index) {
    currentPage = index;
    add(UpdateDataEvent());
  }
}
