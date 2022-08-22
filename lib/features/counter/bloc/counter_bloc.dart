import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_state.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, BaseState> {
  int value = 0;
  CounterBloc() : super(const InitialState()) {
    on<OnChangeCount>((event, emit) {
      emit(DataLoadingState());
      increaseValue();
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('CounterBloc init');
  }

  void increaseValue() {
    value++;
    log('value increases to $value');
  }
}
