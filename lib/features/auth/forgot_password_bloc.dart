import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import '../../../core/base/base_state.dart';

class ForgotPasswordBloc extends Bloc<BaseEvent, BaseState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  List<String> errors = [];

  ForgotPasswordBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(DataLoadingState());
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('ForgotPasswordBloc init');
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
