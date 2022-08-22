import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
part 'dropdown_event.dart';

class DropdownBloc extends Bloc<BaseEvent, dynamic> {
  // ignore: prefer_typing_uninitialized_variables
  late var selectedItem;
  DropdownBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(selectedItem);
    });
  }

  void onChanged(value) {
    selectedItem = value;
    add(FetchDataEvent());
  }
}
