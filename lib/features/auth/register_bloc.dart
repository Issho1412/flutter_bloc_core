import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/util/validate.dart';
import 'package:src_core_bloc/routes.dart';
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
    log('LogicBloc init');
  }

  void updateAgreeStatus(val) {
    isAgree = val;
    add(FetchDataEvent());
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Helper().navigateReplaceTo(loginSuccessRoute);
    } else {
      if (emailEditingController.text.trim() == '') {
        addDefect(error: sEmailNotEmpty);
      } else {
        removeError(error: sEmailNotEmpty);
        var result = Validate.validateEmail(emailEditingController.text);
        if (result == null) {
        } else {
          addDefect(error: result);
        }
      }

      if (pswEditingController.text.trim() == '') {
        addDefect(error: sPasswordNotEmpty);
      } else {
        removeError(error: sPasswordNotEmpty);
      }
      add(FetchDataEvent());
    }
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
