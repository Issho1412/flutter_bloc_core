import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import '../../../core/base/base_state.dart';

class OTPBloc extends Bloc<BaseEvent, BaseState> {
  final formKey = GlobalKey<FormState>();
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  List<String> errors = [];

  OTPBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(DataLoadingState());
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('OTPBloc init');
  }

  void addDefect({String? error}) {
    if (!errors.contains(error)) {
      if (error != null) {
        errors.add(error);
      }
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }
}
