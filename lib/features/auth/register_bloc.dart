import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import '../../../core/base/base_state.dart';

class RegisterBloc extends Bloc<BaseEvent, BaseState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController pswEditingController = TextEditingController();
  final TextEditingController confirmPwdEditingController =
      TextEditingController();
  bool isAgree = false;
  List<String> errors = [];

  RegisterBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(DataLoadingState());
      // increaseValue();
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('RegisterBloc init');
  }

  void updateAgreeStatus(val) {
    isAgree = val;
    add(FetchDataEvent());
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
